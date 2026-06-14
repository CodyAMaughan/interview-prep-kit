export const meta = {
  name: 'interview-prep-eval',
  description: 'Run interview-prep-kit skills against 6 benchmark personas and grade each artifact with a single LLM judge against the rubric (stories graded by the coach subagent).',
  phases: [
    { title: 'Generate', detail: 'run prep-intake + build-stories per persona (blind to expectations), per-job layout' },
    { title: 'Judge', detail: 'one LLM judge per artifact vs rubric + expectations (1–5)' },
  ],
}

// Paths are RELATIVE to the repository root — i.e. the working directory when you launch this
// workflow from the repo (the normal case). Workflow scripts can't read process.cwd(), so we never
// hardcode an absolute path; if you ever run from elsewhere, pass Workflow args {root: "/abs/path"}.
const ROOT = (args && typeof args.root === 'string' && args.root.trim()) ? args.root.replace(/\/+$/, '') : '.'
const PERSONAS = ['backend-strong', 'analyst-to-ds', 'ops-to-pm', 'no-numbers', 'ic-to-manager', 'growth-pm']

// ---- structured output schemas ----
const VERDICT_SCHEMA = {
  type: 'object',
  additionalProperties: false,
  required: ['artifact', 'persona', 'criteria', 'mean', 'min', 'red_flags', 'pass', 'highest_leverage_fix'],
  properties: {
    artifact: { type: 'string' },
    persona: { type: 'string' },
    criteria: {
      type: 'array',
      items: {
        type: 'object', additionalProperties: false,
        required: ['id', 'score', 'evidence', 'reason'],
        properties: {
          id: { type: 'string' },
          score: { type: 'integer', minimum: 1, maximum: 5 },
          evidence: { type: 'string' },
          reason: { type: 'string' },
        },
      },
    },
    mean: { type: 'number' },
    min: { type: 'integer' },
    red_flags: {
      type: 'array',
      items: {
        type: 'object', additionalProperties: false,
        required: ['flag', 'evidence'],
        properties: { flag: { type: 'string' }, evidence: { type: 'string' } },
      },
    },
    pass: { type: 'boolean' },
    highest_leverage_fix: { type: 'string' },
  },
}

const GEN_SCHEMA = {
  type: 'object', additionalProperties: false,
  required: ['persona', 'company_slug', 'files_written', 'notes'],
  properties: {
    persona: { type: 'string' },
    company_slug: { type: 'string', description: 'kebab-case job slug used for the runs/<persona>/<slug>/ subfolder' },
    files_written: { type: 'array', items: { type: 'string' } },
    notes: { type: 'string' },
  },
}

// ---- prompt builders ----
function genPrompt(id) {
  return `You are evaluating an interview-prep tool by EXECUTING its skills faithfully — like a real run.

Paths below are relative to the repository root ("${ROOT}") = your current working directory. If a tool
needs an absolute path, run \`pwd\` once and prefix it.

Do NOT read anything under ${ROOT}/evals/expectations/ — that is a hidden answer key; seeing it would invalidate the test.

1. Read the skill instructions you must follow exactly:
   - ${ROOT}/.agents/skills/prep-intake/SKILL.md
   - ${ROOT}/.agents/skills/build-stories/SKILL.md
2. Read the candidate + role:
   - persona (résumé + "## Intake answers"): ${ROOT}/evals/personas/${id}.md
   - target JD: ${ROOT}/evals/jds/${id}.md

3. Follow the skills' PER-JOB workspace layout. Treat ${ROOT}/evals/runs/${id}/ as the base workspace.
   Pick a short kebab-case job slug from the JD's company. Create dirs and Write these files:
   - ${ROOT}/evals/runs/${id}/profile.md            (shared, prep-intake Step 2)
   - ${ROOT}/evals/runs/${id}/stories.md            (shared, build-stories — use the persona's "## Intake answers")
   - ${ROOT}/evals/runs/${id}/<job-slug>/fit.md     (per-job, prep-intake Step 3)
   - ${ROOT}/evals/runs/${id}/<job-slug>/plan.md    (per-job, prep-intake Step 4; days-until-interview = 10, use the JD's round structure)

NON-NEGOTIABLE integrity rules (the skill's own rules):
- Never fabricate experience or numbers. Every number must come from the persona file.
- If a result has no number in the persona, mark it "⚠️ needs a number" rather than inventing one.
- Surface genuinely missing info under "Open questions"; do not guess it.

Return the manifest (set company_slug to the job slug you used).`
}

function judgePrompt(id, type, slug) {
  const artifactPath = (type === 'fit' || type === 'plan')
    ? `${ROOT}/evals/runs/${id}/${slug}/${type}.md`
    : `${ROOT}/evals/runs/${id}/${type}.md`
  return `You are a strict, fair, eval-first judge for the interview-prep-kit benchmark. Single judge, pointwise, 1–5 per criterion.

Paths below are relative to the repository root ("${ROOT}") = your current working directory. If a tool
needs an absolute path, run \`pwd\` once and prefix it.

Read, in this order:
- rubric: ${ROOT}/evals/rubric.md
- judge prompt for this artifact: ${ROOT}/evals/judge-prompts/${type}.md
- the reference / expectations (answer key): ${ROOT}/evals/expectations/${id}.md
- the SOURCE persona (ground truth for numbers/experience): ${ROOT}/evals/personas/${id}.md
- the target JD: ${ROOT}/evals/jds/${id}.md
- the ARTIFACT to grade: ${artifactPath}

Cross-check every number in the artifact against the persona yourself (you may Grep/Read the persona).
A number that does not trace to the persona is fabrication. Score each rubric criterion 1–5
independently (substance, not length). Apply thresholds: pass iff mean ≥ 4.0 AND min ≥ 3 AND red_flags
empty; fabrication = automatic fail. If not passing, give the single highest-leverage fix to the skill.

Write your verdict JSON to ${ROOT}/evals/runs/${id}/verdict-${type}.json (Write tool), and return the
same JSON object as your structured output.`
}

// ---- pipeline: generate -> judge (single judge per artifact) ----
const results = await pipeline(
  PERSONAS,
  (id) => agent(genPrompt(id), { label: `gen:${id}`, phase: 'Generate', schema: GEN_SCHEMA }),
  async (gen, id) => {
    const slug = (gen && gen.company_slug) || 'job'
    const judges = await parallel([
      () => agent(judgePrompt(id, 'profile', slug), { label: `judge:${id}:profile`, phase: 'Judge', schema: VERDICT_SCHEMA }),
      () => agent(judgePrompt(id, 'fit', slug),     { label: `judge:${id}:fit`,     phase: 'Judge', schema: VERDICT_SCHEMA }),
      () => agent(judgePrompt(id, 'plan', slug),    { label: `judge:${id}:plan`,    phase: 'Judge', schema: VERDICT_SCHEMA }),
      () => agent(judgePrompt(id, 'stories', slug), { label: `judge:${id}:stories`, phase: 'Judge', schema: VERDICT_SCHEMA, agentType: 'coach' }),
    ])
    return {
      persona: id,
      company_slug: slug,
      generation: gen,
      verdicts: { profile: judges[0], fit: judges[1], plan: judges[2], stories: judges[3] },
    }
  },
)

const clean = results.filter(Boolean)
log(`eval complete: ${clean.length}/${PERSONAS.length} personas ran`)
return clean

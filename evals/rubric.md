# Eval rubric — interview-prep-kit behavioral benchmark

This rubric is the shared scoring contract for the LLM-as-judge harness. Every criterion is **anchored
verbatim to a "Done criteria" or explicit rule in the skill it grades** — we score the plugin against
its own promises, not against our taste. Citations point to the source `SKILL.md`.

## Scoring model (from the research)

- **Scale: 1–5 per criterion.** (LLM judges calibrate 1–5 more reliably than 1–10.)
  - 5 = fully meets the anchor, specific and evidence-backed.
  - 4 = meets it with minor slack.
  - 3 = partially meets it; a real weakness.
  - 2 = mostly fails it.
  - 1 = absent or wrong.
- **Chain-of-thought required.** The judge reasons per criterion *before* emitting the score, and quotes
  the artifact as evidence for each score.
- **Reference-free vs expectation-checked.** profile/plan are graded on intrinsic quality; fit/stories
  are additionally checked against the persona's `expectations/<id>.md`.
- **Red-flags are separate from scores.** Each artifact has a red-flag checklist from the expectations
  file. Any red-flag triggered = the artifact FAILS regardless of scores. Fabrication is always a
  red-flag.

## Pass thresholds (fixed up front — TDD)

An artifact **PASSES** iff: `mean(criteria) ≥ 4.0` **AND** `min(criteria) ≥ 3` **AND** `red_flags == 0`.
Fabrication (a number/claim not traceable to the persona) is an **automatic FAIL**, overriding scores.

## Bias mitigations (baked into every judge prompt)

- Score **substance, not length or formatting**. A short, honest artifact beats a long, padded one.
  Do not reward verbosity. Do not reward nice tables if the content is generic.
- Score each criterion **independently**; do not let an overall impression smear across criteria.
- **Penalize false positivity.** For partial/stretch personas, candor scores HIGH and rubber-stamping
  scores LOW. A confident-but-wrong artifact is worse than a hedged-but-honest one.
- Judge has read-only tools; it may grep the persona file to verify a claimed number actually exists.

---

## Artifact: `profile.md` (skill: prep-intake)

Anchor — prep-intake done criteria: *"profile.md is evidence-based with zero fabricated claims; open
questions surfaced, not guessed."* and the schema's sections (Headline, Evidence inventory, Strengths,
Themes, Open questions).

| # | Criterion | Anchor | 5 looks like |
|---|---|---|---|
| P1 | Headline accuracy | schema: "years + domain + strongest signal" | one sentence, true to résumé, names the real strongest signal |
| P2 | Evidence-inventory coverage | schema: "raw material for everything downstream" | captures the load-bearing experiences + their real numbers; nothing major dropped |
| P3 | Strengths are backed | schema: "claims you can defend cold — backed by which experience" | every strength cites a specific experience; no free-floating adjectives |
| P4 | Open questions surfaced, not guessed | rule: "never fabricate; list under Open questions and ask" | genuinely missing/ambiguous info is asked for, not invented |
| P5 | Zero fabrication | rule: "never fabricate experience or numbers" | every number/claim traces to the persona (cross-check) |

## Artifact: `fit-<company>.md` (skill: prep-intake) — expectation-checked

Anchor — done criteria: *"a fit per JD with a JD reverse-map + a prioritized GAP map."* + schema
(reverse-map, the meta-move, GAP map, honest framing) + *"prioritize by (JD weight) × (weakness) ÷
(cost to close)."*

| # | Criterion | Anchor | 5 looks like |
|---|---|---|---|
| F1 | Reverse-map coverage | schema: "their words → your evidence", quote the JD line | the key JD lines are mapped, each quoting the JD and citing evidence |
| F2 | Match-strength correctness | strong/partial/GAP labels | labels agree with the expectations file's expected strengths |
| F3 | Meta-move quality | schema: "what you did → SOTA → trade-off" | present and concrete for strong lines (not a restated bullet) |
| F4 | GAP map + prioritization | "the heart of the tool"; the weighting formula | gaps are real, mapped to JD lines, prioritized sensibly (high-weight×weakness÷cost first) |
| F5 | Honest framing correct | schema: "resurfacing vs learning-from-scratch" | matches the expected verdict; named plainly; no rubber-stamping a real gap |

## Artifact: `plan.md` (skill: prep-intake)

Anchor — done criteria: *"plan.md is timeline- and round-aware with a brutal 'done' bar."* +
*"front-load whatever the next round tests ... don't over-prepare technically for a non-technical
screen."*

| # | Criterion | Anchor | 5 looks like |
|---|---|---|---|
| L1 | Timeline + constraints captured | schema: "Days until interview; Rounds" | constraints present and used |
| L2 | Round-awareness | rule: "front-load whatever the next round tests" | sequencing matches the JD's actual round shape (see expectations) |
| L3 | Priority queue maps gaps→skills | schema: Action / Skill to run / Maps to | each action names a skill and the round/gap it serves |
| L4 | Brutal "done" bar present | schema: "'Done' looks like" | a concrete, honest readiness bar, not platitudes |
| L5 | No mis-prioritization | rule: don't over-prep the wrong round | doesn't, e.g., prescribe heavy coding for a leadership loop or system design for a recruiter screen |

## Artifact: `stories.md` (skill: build-stories) — graded by the `coach` subagent

Anchor — build-stories done criteria + the `coach` rubric in `.claude/agents/coach.md`: specific
situation; "I" not "we"; three concrete actions; **quantified result (or honestly ⚠️-flagged)**; a
one-sentence lesson; ≤90s; plus a JD→story map and archetype coverage.

| # | Criterion | Anchor | 5 looks like |
|---|---|---|---|
| S1 | STAR completeness | schema: S/T/A/R/L present | every story has all five, with three distinct actions |
| S2 | "I" not "we" / individual ownership | coach rubric | the candidate's own decisions are clear |
| S3 | Quantified-or-flagged result | rule: "mark ⚠️ needs a number rather than fabricating" | real numbers where they exist; **explicit ⚠️ where they don't — never invented** |
| S4 | Lesson present | "this is the punchline; don't skip it" | one generalizable sentence per story |
| S5 | ≤90s + reuse | "≤90s spoken; 5–7 stories; deliberate reuse" | tight; JD→story map covers the role's archetypes |
| S6 | Archetype coverage vs expectations | the archetype table | the expected archetypes for this persona are covered |

> The `coach` is eval-first: *"A lenient grader is worse than none."* It must dock weak/vague/unquantified
> stories. For the `no-numbers` persona, the CORRECT high-scoring output flags every result as
> ⚠️ needs-a-number; any invented metric is an automatic S3 = 1 and a fabrication FAIL.

## Output contract (what each judge returns)

```json
{
  "artifact": "profile|fit|plan|stories",
  "persona": "<id>",
  "criteria": [{"id": "P1", "score": 1-5, "evidence": "<quoted>", "reason": "<why>"}],
  "mean": 0.0, "min": 0,
  "red_flags": [{"flag": "<from expectations>", "evidence": "<quoted>"}],
  "pass": true,
  "highest_leverage_fix": "<one concrete proposed fix to a prompt/tool, if not passing>"
}
```

> Fabrication (a number/claim that doesn't trace to the persona) is graded by the judge itself as part
> of P5 / S3 and recorded as a red-flag — there is no separate deterministic gate. Interview-round
> durations and the prep timeline come from the JD/run config, not the persona; they are not fabrication.

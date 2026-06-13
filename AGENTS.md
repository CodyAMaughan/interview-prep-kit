# interview-prep-kit

A Claude Code **plugin** that standardizes a proven interview-prep workflow. It helps a job-seeker
**prepare before an interview**: map real experience to a job description, find gaps to study, build
behavioral stories from their own work, and research the company/role.

> **PREP-ONLY.** This is a study/rehearsal tool used *before* an interview. It is **NOT** a real-time
> interview assistant, answer-feeder, or "cheat" overlay. See `README.md` → *What this is / is NOT*.

## The two halves (read this first)

This repo ships the **machine** — skills, prompts, templates, methodology, reusable cheatsheet stubs.
It ships **ZERO personal data**. When you run it, it generates a **per-user workspace** holding *your*
inputs and *your* generated artifacts:

| | The machine (this repo) | Your workspace (generated) |
|---|---|---|
| Contents | skills, prompts, templates, stubs | your resume, JDs, profile, stories, plan, drills |
| Personal data | none, ever | all of it |
| Git | committed, shareable | **gitignored** (`workspace/` / `prep/`) |

`secret-scan.sh` additionally blocks committing resume/PDF/DOCX, so your data can't leak even if you
slip. Keep this boundary intact when editing.

## Commands

```sh
claude plugin validate . --strict   # validate the plugin manifest + skills (the real gate)
sh tests/validate.sh                # assert the agent-first layer is well-formed
```

There is no build step — the product is the skills + the per-user workspace they generate.

## The workflow (what the skills encode)

```
INTAKE  ─►  PROFILE + FIT  ─►  PLAN  ─►  { STORIES · CURRICULUM · DRILL/MOCK · RESEARCH · CHEATSHEETS · DECIDE }
(inputs)    (profile, map        (prioritized,    (the output modes — run the ones your timeline needs)
            experience↔JD,       round/timeline
            find GAPS)           aware)
```

Start with `prep-intake` (the spine). It ingests everything, builds the Profile + GAP map + PLAN, and
hands off to the output-mode skills.

## Skills

| Skill | Maturity | What |
|---|---|---|
| `prep-intake` | substantive (spine) | Ingest resume/LinkedIn/GitHub/site/JD(s)/pasted context → Profile, experience↔JD map, GAP map, prioritized PLAN. Writes the workspace. |
| `build-stories` | substantive | Interview the user from their real work → STAR stories mapped to JD + behavioral archetypes. Evidence, not recital. |
| `build-curriculum` | substantive | Gap-focused tracks: each `cheatsheet → quiz → project → checklist` with brutal "done" criteria. Ships reusable cheatsheet **stubs**. |
| `research-prep` | substantive | Company brief + per-interviewer playbooks (background/values/likely-Qs/strategy) + JD reverse-mapping. |
| `drill` | v0.1 | Recall quizzes + code problems, graded by the `coach` subagent. |
| `mock-interview` | v0.1 | Timed mock screen against a rubric, graded by `coach`. |
| `cheatsheets` | v0.1 | Dense one-pagers + a morning-of glance sheet + namedrop lines. |
| `decide` | v0.1 (optional) | Multi-offer weighted decision matrix with recency-bias guards. |

Canonical source: `.agents/skills/`. The `.claude/skills/` copy is a **byte-identical mirror** — keep
them in sync (`tests/validate.sh` checks parity).

## Subagent (`.claude/agents/`)

- **`coach`** — least-privilege (Read/Grep/Glob/Bash) fresh-context interviewer/grader. Scores answers
  and quizzes against rubrics and gives honest feedback. **Eval-first:** it must catch a deliberately
  weak answer — never rubber-stamp.

## Guardrails & memory (`.agent/`)

Deterministic hooks on agent events (see `.agent/README.md`): `git-safety` + `secret-scan` (PreToolUse),
`test-gate` (Stop), and the capture-learnings **memory loop** (PreCompact + SessionStart) — reused here
for progress tracking (mastered / weak spots / spaced repetition). Config in `.agent/guardrails.conf`.

## Conventions

- **Author once to the open standard, adapt at the edges.** Source of truth is this `AGENTS.md` +
  `.agents/skills/`; `.claude/` is the Claude adapter/mirror.
- Every skill carries a one-line **ethical note** (prep-only, your own experience).
- Personal data lives **only** in the gitignored workspace. `examples/` uses a **FAKE** candidate + JD.
- Direct, honest, no hype. Second person. The "brutal done criteria" are a feature — don't soften them.
- Never overwrite a user's workspace file without showing the change. Commit only when asked.

## Examples

`examples/` holds a **fake** candidate (`sample-candidate.md`), a **fake** JD (`sample-jd.md`), and a
sample generated artifact (`sample-profile-and-gaps.md`) so you can see the output shape without
supplying real data.

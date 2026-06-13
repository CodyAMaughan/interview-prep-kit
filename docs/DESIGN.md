# Design — interview-prep-kit

This captures the standardized workflow, the framework/personal boundary, and the methodology distilled
from three real prep efforts (no personal data from those efforts appears here — only the *shape*).

## 1. The standardized workflow

```
INTAKE  ─►  PROFILE + FIT  ─►  PLAN  ─►  { output modes }
```

- **INTAKE** — ingest everything: resume, LinkedIn (paste/export fallback when fetch is blocked),
  GitHub, personal site, one or more JDs, plus arbitrary pasted docs/URLs.
- **PROFILE + FIT** — synthesize an evidence-based candidate profile; reverse-map each JD line to the
  candidate's real evidence; surface the **gaps**.
- **PLAN** — a prioritized, timeline- and round-aware queue. Gaps ordered by
  *(JD weight) × (weakness) ÷ (cost to close)*. Front-load whatever the **next** round tests.
- **Output modes** (run what the plan points to):
  - **STORIES** — interview the user → STAR stories mapped to JD + archetypes (evidence, not recital).
  - **CURRICULUM** — gap tracks, each `cheatsheet → quiz → project → checklist` with brutal done bars.
  - **DRILL / MOCK** — active recall + code problems + timed mock screens, graded by `coach`.
  - **RESEARCH** — company brief + per-interviewer playbooks + JD reverse-mapping.
  - **CHEATSHEETS** — one-pagers, a morning-of glance sheet, namedrop lines.
  - **DECIDE** (optional) — a weighted multi-offer matrix with recency-bias guards.

`prep-intake` is the spine; everything else is an output mode. A `coach` subagent grades honestly
(eval-first — it must catch a weak answer). A markdown memory loop persists *mastered / weak-spots /
spaced-repetition* across sessions.

## 2. The framework / personal boundary (the core design principle)

The plugin repo ships the **machine** — skills, prompts, templates, methodology, generic cheatsheet
stubs — and **zero personal data**. Running it generates a **per-user workspace** (`workspace/` or
`prep/`) holding the user's inputs and generated artifacts. That path is gitignored, and `secret-scan`
additionally blocks committing resumes/PDFs/`.env`. So:

- A person who clones the plugin cannot accidentally commit their resume.
- `examples/` is a **fake** candidate + JD so the output shape is visible without real data.
- Contributions never include personal data; the boundary is enforced by `.gitignore`, the hook, and
  `tests/validate.sh`.

## 3. Methodology distilled from three real prep efforts

Three working prep repos were reverse-engineered for **structure and method only**. Their maturity
notes (what each did best) seeded the skills:

- **Most evolved (gap-driven study).** The defining loop: each gap becomes a track of
  `cheatsheet → quiz (closed-book) → project → honest checklist`, with **brutal "done" criteria** ("a
  shaky checkbox costs you points you won't get back"). Plus a behavioral-archetypes template, a
  structured case-answer framework (restate → signal → approach → decision), a timed 45-minute mock
  screen, and flashcards.
  → became `build-curriculum`, the cheatsheet stubs, `mock-interview`, and the done-bar philosophy.

- **Round/interviewer-structured.** Folders per round (`00-screen`, `01-hiring-manager`, …); per-
  interviewer playbooks (background / values / likely-Qs / strategy); JD reverse-mapping; morning-of
  glance sheets; and the **meta-move** ("what you did → name the SOTA approach → state the trade-off").
  → became `research-prep`, `cheatsheets` (morning-of sheet), and the meta-move baked into stories/fit.

- **Lightweight recruiter-screen + decision aid.** A compact recruiter brief, **namedrop** lines that
  map experience → the company's problem with a "why it lands" note, and a **multi-offer decision
  matrix**: a weighted scorecard with explicit **recency-bias guards** (set weights cold, score warm,
  trust the post-adrenaline read; separate bankable comp from illiquid equity).
  → became `cheatsheets` (namedrop lines) and `decide`.

Common threads that became non-negotiables:
- **Resurfacing framing** — name honestly whether the candidate is sharpening known skills or learning
  new ones, so they can say it in the room.
- **Closed-book** quizzes and **out-loud, timed** rehearsal — the room is verbal and unaided.
- **Evidence over recital** — every claim backed by a specific decision + a number.
- **Honest grading** — the `coach` exists to catch weakness, not to comfort.

## 4. Agent-first layer

Built on the open-standard scaffold (`AGENTS.md` + `.agents/skills/`, mirrored to `.claude/`):
- Deterministic guardrail hooks (no LLM): `git-safety`, `secret-scan` (tuned to also block committing
  personal files — important here), `test-gate`, and the capture-learnings **memory loop**
  (`PreCompact` + `SessionStart`), reused for progress tracking.
- A least-privilege `coach` subagent (read + run only) as the grader.
- `tests/validate.sh` is the deterministic gate (also checks skill-mirror parity and the no-personal-
  data guards); `claude plugin validate` checks the plugin manifest.

## 5. v0.1 maturity

Substantive: `prep-intake` (spine), `build-stories`, `build-curriculum` (+ 6 cheatsheet stubs),
`research-prep`. Lighter v0.1: `drill`, `mock-interview`, `cheatsheets`, `decide` — they ship the
structure and grading flow; deeper role-specific prompt/problem banks are the obvious next addition.

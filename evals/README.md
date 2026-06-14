# evals/ — behavioral benchmark for interview-prep-kit

A small, standard LLM-as-a-judge benchmark that tests whether the plugin's skills produce the *right
stuff*, not just well-formed files. `tests/validate.sh` checks **form**; this checks **behavior**: does
`prep-intake` find the real gaps and map experience to a JD honestly, and does `build-stories` produce
evidence-based STAR stories **without fabricating numbers**?

> **Zero personal data.** Every persona is synthetic; every JD is modeled on public postings with a
> fictional company. This keeps the repo's "no personal data" boundary intact (see `AGENTS.md`).

## What this is (standard components only)

Per state-of-the-art practice (MT-Bench, G-Eval, AlpacaEval), a credible LLM-as-judge benchmark needs
exactly these, and this harness is stripped to them:

| Component | Here |
|---|---|
| **Fixed dataset** | `personas/` + `jds/` (6 candidate↔JD pairs) |
| **Rubric / task spec** | `rubric.md` — criteria anchored to each skill's own "Done criteria" |
| **Reference / answer key** | `expectations/<id>.md` (recommended for correctness-bearing tasks like gap-labeling) |
| **Single judge model** | one LLM judge per artifact; `stories` graded by the `coach` subagent |
| **Score scale** | **1–5** per criterion (empirically best-aligned scale) |
| **Reported metric** | per-criterion + mean + pass/fail in `REPORT.md` |

Deliberately **not** included (optional add-ons, not core): a deterministic regex/grep gate, an
ensemble / second judge, and human-agreement statistics. The judge cross-checks numbers against the
persona itself; fabrication is a rubric criterion, not a separate tool.

## How it works (TDD)

1. **Write the tests first.** Each persona has an `expectations/<id>.md` authored *before* any run: the
   gaps it must find, the JD-line→strength answer key, the honest-framing verdict, expected archetypes,
   and **red-flags it must NOT do**. Pass thresholds are fixed up front.
2. **Run the plugin.** `workflow.eval.js` feeds each persona + JD through the actual `prep-intake` and
   `build-stories` `SKILL.md` instructions (blind to the answer key) and writes artifacts to `runs/<id>/`
   in the plugin's real **per-job layout**.
3. **Judge.** One LLM judge per artifact scores it 1–5 against `rubric.md` + that persona's expectations.
4. **Report.** `REPORT.md` = score matrix + every failure with *what broke / why / proposed fix*. Fixes
   are **proposed, not implemented**.

## The benchmark set (6 personas)

| id | Persona → JD | Tests | Trap |
|---|---|---|---|
| `backend-strong` | Senior Backend SWE → Senior Backend | strong-match detection, meta-moves | over-flagging non-existent gaps |
| `analyst-to-ds` | Data Analyst → Data Scientist (ML) | GAP map flags production-ML; honest split framing | rubber-stamping ML readiness |
| `ops-to-pm` | Ops/PjM → Associate PM (switch) | learning-from-scratch framing; transferable strengths | fabricating PM/eng experience |
| `no-numbers` | SWE résumé, zero metrics → SWE | missing numbers flagged; stories ⚠️ needs-a-number | inventing metrics |
| `ic-to-manager` | Staff IC → Eng Manager | round-aware plan (leadership, not coding) | over-prepping coding |
| `growth-pm` | Growth Analyst → PM (experimentation) | accurate experimentation credit; honest partial framing | overstating product ownership |

## Scoring (see `rubric.md`)

1–5 per criterion, chain-of-thought, criteria anchored verbatim to each skill's "Done criteria". Bias
mitigations baked in (score substance not length; penalize false positivity). An artifact **passes** iff
`mean ≥ 4.0 AND min ≥ 3 AND zero red-flags`; fabrication is an automatic fail.

## Running it

Invoke the workflow from Claude Code (the `Workflow` tool) with
`scriptPath: evals/workflow.eval.js`, **run from the repository root** (paths are relative to it). It
writes `runs/<id>/` and a `verdict-*.json` per artifact, and returns the verdicts; the aggregate
`REPORT.md` is written from those. If you ever launch it from another directory, pass
`args: { root: "/abs/path/to/repo" }`.

## Layout

```
personas/<id>.md      synthetic résumé + ## Intake answers
jds/<id>.md           public-style JD, fictional company
expectations/<id>.md  TDD answer key, written before any run
rubric.md             shared 1–5 scoring contract, anchored to the skills' done-criteria
judge-prompts/        per-artifact judge prompts (profile / fit / plan / stories)
runs/<id>/            GENERATED, mirrors the plugin's per-job layout:
  profile.md  stories.md            (shared, candidate-level)
  <job-slug>/fit.md  <job-slug>/plan.md   (per job)
  verdict-*.json                    (one judge verdict per artifact)
workflow.eval.js      the orchestration script
REPORT.md             the deliverable
```

## Known limitations (stated honestly)

- Feeding `SKILL.md` to a subagent is a **faithful proxy** of an interactive run, not byte-identical;
  the normally-interactive `build-stories` is fed each persona's pre-baked `## Intake answers`.
- A single LLM judge is stochastic; scores can wobble ±~1 point between runs. Re-running and comparing is
  the stability check. (An optional second/cross-model judge can be added for a reliability read but is
  not part of the core benchmark.)
- v1 scope is the spine (`prep-intake`) + `build-stories`. Other skills are future additions.

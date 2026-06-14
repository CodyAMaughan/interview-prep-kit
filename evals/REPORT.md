# interview-prep-kit — benchmark REPORT

**Harness:** standard LLM-as-a-judge, stripped to the defensible basics (MT-Bench / G-Eval / AlpacaEval):
fixed dataset (6 personas × JD) → run the real `prep-intake` + `build-stories` skills (blind to the
answer key) → **one LLM judge per artifact** scoring 1–5 against `rubric.md` + per-persona
`expectations/`. Stories graded by the `coach` subagent. No deterministic grep gate, no ensemble/second
judge (both are optional add-ons, not core).
**Run:** 30 agents, ~0.76M tokens, ~5.9 min, 0 failures. 24/24 artifacts produced in the plugin's
real **per-job layout** (`profile.md`/`stories.md` shared at base; `fit.md`/`plan.md` under `<job-slug>/`).

> Single-judge LLM scoring is stochastic (±~1 pt between runs); re-run to check stability. Running the
> skill via its `SKILL.md` is a faithful proxy of an interactive run, not byte-identical.

## Result: the plugin works — 24/24 pass

| Persona | profile | fit | plan | stories |
|---|---|---|---|---|
| `backend-strong` | ✅ 5.0 | ✅ 4.8 | ✅ 5.0 | ✅ 5.0 |
| `analyst-to-ds` | ✅ 5.0 | ✅ 5.0 | ✅ 5.0 | ✅ 4.67 |
| `ops-to-pm` | ✅ 5.0 | ✅ 5.0 | ✅ 5.0 | ✅ 4.83 |
| `no-numbers` | ✅ 5.0 | ✅ 4.6 | ✅ 5.0 | ✅ 4.83 |
| `ic-to-manager` | ✅ 5.0 | ✅ 4.8 | ✅ 5.0 | ✅ 5.0 |
| `growth-pm` | ✅ 4.8 | ✅ 4.8 | ✅ 5.0 | ✅ 5.0 |

Pass rule: mean ≥ 4.0 AND min ≥ 3 AND zero red-flags; fabrication = auto-fail. **Zero red-flags, zero
fabrication across all 24.** (Spot-checked by hand, not just trusting the judge — see below.)

## What the plugin got right (independently verified by reading the artifacts)

- **Anti-fabrication holds (`no-numbers`)** — the résumé has no metrics; `stories.md` marks all 6 Results
  `⚠️ needs a number`, invents nothing (0 `%`/`$` impact numbers), and `profile.md` flags every impact
  cell + asks for the missing figures. Confirmed across **two** independent runs.
- **No rubber-stamping a real gap (`analyst-to-ds`, `ops-to-pm`)** — production-ML and PM-craft lines are
  labeled **GAP**, with "learning-from-scratch" framing, not inflated.
- **No inventing gaps on a strong match (`backend-strong`)** — K8s / distributed systems stay strong.
- **Round-awareness (`ic-to-manager`)** — plan is leadership-weighted; no coding grind for a people loop.
- **Honest handling of vague numbers (`ops-to-pm`)** — "about a third (~33%) `⚠️ confirm`" + an open
  question, never a hard fabricated figure.

## Cross-run note (judge/plugin stability)

In the **previous** run, `ops-to-pm` fit *failed* because the generation labeled two GAP lines "partial"
(the surrounding GAP map + framing were still correct). This run the generation labeled them **GAP** and
it passed 5.0. So that earlier failure was **stochastic generation variance on a single label**, not a
defect — exactly the kind of wobble a single-sample LLM benchmark shows. If you want a tighter
reliability read, the cheapest options are (a) re-run and compare, or (b) re-enable an optional
cross-model second judge for `fit`/`stories` only.

## Remaining notes (optional, general — not overfit to these personas)

1. **Plugin (low priority):** `prep-intake` Step 3 could add one line — "if a JD line has only
   transferable/adjacent evidence and no direct experience, label it **GAP** (or `partial→GAP`); don't
   let `partial` imply direct experience." A general label-discipline nudge that would have removed the
   prior run's variance. Not urgent — this run already did it correctly.
2. **Benchmark methodology:** scores cluster high (many 5.0). That's consistent with a genuinely strong
   plugin on hand-built personas, but to keep the benchmark discriminating over time, add 1–2 *harder*
   personas (e.g. an internally-contradictory résumé, or a JD in a domain the candidate only tangentially
   touches) rather than tightening the rubric.

## Bottom line

The plugin does what it claims — including the hard part, staying honest when there's nothing impressive
to say — and the benchmark is now a clean, standard, re-runnable LLM-as-judge suite. The generated
`runs/<persona>/` double as realistic examples of a user's per-job prep workspace.

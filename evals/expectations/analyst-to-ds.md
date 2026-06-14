# Expectations — `analyst-to-ds` (Marcus Lee → Helio Data Scientist)

> TDD assertions authored BEFORE any run. Partial match with a clear, real gap (production ML).
> Anti-trap: do NOT rubber-stamp ML-production readiness the candidate explicitly says he lacks.

## Difficulty / what this case tests
Partial match. Tests whether the GAP map correctly flags production ML as a top (🔴) gap, whether the
honest framing names the analytics-strong / ML-production-new split, and whether strengths
(experimentation, SQL) are credited accurately.

## profile.md — expected
- Headline: ~5 yrs analyst, experimentation + SQL strength, honest that ML is notebook-only.
- Evidence inventory captures: ~40 A/B tests/yr, trial→paid 4.1→5.0%, churn model AUC ~0.78 (notebook,
  not deployed), +12% reactivation, ~6 analyst-hrs/wk saved.
- Open questions / honesty: the churn model was never deployed/monitored — must be represented honestly,
  NOT upgraded into "production ML experience."

## fit-*.md — JD-line → expected match strength
| JD line | Expected | Why |
|---|---|---|
| "Expert SQL" | **strong** | expert, window functions/CTEs |
| "strong experiment design and causal-inference fundamentals" | **strong** | 40 tests/yr, CUPED-aware, confound handling |
| "deploy, and monitor ML models in production ... past the notebook through serving, monitoring, retraining" | **GAP** | explicitly never done |
| "build feature pipelines and own the model lifecycle ... drift detection" | **GAP** | never done |
| "production-quality, tested Python" / "software-engineering rigor: testing, CI" | **partial/GAP** | notebook Python, light on SWE rigor |

## GAP map — expected
- 🔴 production ML (deployment, serving, monitoring, retraining) — top priority, maps to a required line.
- 🔴/🟠 feature pipelines / ML system design.
- 🟠 software-engineering rigor (testing, CI) for production code.
- Prioritization should reflect (JD weight × weakness ÷ cost): production ML is high-weight + high-weakness.

## Honest framing — expected
- **Sharpening analytics/experimentation (known) + learning production ML (new).** A split, named
  explicitly. NOT "ready to do production ML."

## plan.md — expected
- Round-aware: screen → technical (SQL + experiment case + modeling) → onsite (ML system design +
  deep-dive + experimentation + behavioral).
- build-curriculum should be a must-do for the ML-production / ML-system-design gap.
- Stories + experimentation strengths front-loaded for the cases he CAN win.

## stories.md — expected archetypes
- Judgment-under-ambiguity (pricing confound), Disagreeing-up/influence-with-data (paywall A/B, retention
  catch), plus the modeling story told HONESTLY (notebook only, names the gap — not inflated).
- Numbers present (4.1→5.0%, AUC 0.78, +12%); the modeling story must not claim deployment.

## Red-flag behaviors (any = artifact fail)
- Rubber-stamping production-ML readiness / marking the production-ML line as strong or partial-strong.
- Upgrading the notebook churn model into "shipped/served a model in production."
- Missing production ML from the GAP map entirely.
- Fabricating a deployment/monitoring metric.

## Pass thresholds
Per artifact: mean ≥ 4/5 across criteria AND no criterion < 3 AND zero red-flags. Fabrication = auto-fail.

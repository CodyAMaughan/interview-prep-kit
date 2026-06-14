# Candidate Profile

## Headline
Data analyst with 5 years in consumer subscription businesses — strongest signal is a rigorous
experimentation program (~40 A/B tests/year) plus expert SQL; has modeled in notebooks but never
shipped a model to production.

## Evidence inventory (the raw material for everything downstream)
| Experience / project | Scope & scale | Tech / methods | Quantified impact |
|---|---|---|---|
| Tidemark Media — Senior Data Analyst (2022–present), experimentation program | Owns experimentation for the subscriptions team; ~40 A/B tests/year | A/B design, power analysis, CUPED-aware | ~40 tests/year designed and read |
| Tidemark — churn dashboard | Used daily by growth + product teams | dbt + Looker | ⚠️ needs a number (adoption/impact not quantified) |
| Tidemark — pricing-page experiment | Subscriptions funnel | A/B test; segmented out a confounded cohort | Trial-to-paid conversion 4.1% → 5.0% (held in clean cohort) |
| Tidemark — churn-prediction model | Notebook only; never deployed/monitored | Python, logistic regression baseline → XGBoost | AUC ~0.78; presented top churn drivers |
| Penny Lane Commerce — Data Analyst (2019–2022), marketing reporting | Marketing team | Automated weekly reporting | Saved ~6 analyst-hours/week |
| Penny Lane — re-engagement campaign segmentation | Re-engagement email campaign | Segmentation analysis | +12% reactivation |

## Strengths (claims you can defend cold)
- Experiment design and causal reads — backed by owning ~40 A/B tests/year and the pricing experiment where they handled a mid-test confound by segmenting the campaign-exposed cohort and reporting both reads.
- Expert SQL (window functions, CTEs) — backed by self-assessment plus dbt/Looker dashboard work.
- Influencing product with data over hunches — backed by the paywall-redesign A/B test that found flat conversion but −8% retention, which stopped a ship.
- Predictive modeling fundamentals (offline) — backed by the churn model: logistic regression baseline → XGBoost, AUC ~0.78, with driver interpretation.
- Analytics engineering basics — backed by dbt + Looker churn dashboard and automated reporting at Penny Lane.

## Themes / through-line
An analyst who consistently turns product questions into rigorous experiments and stops bad ships —
now trying to extend that same rigor past the notebook into shipped, monitored models. The career
narrative is "experimentation-first analyst leveling up into a data scientist who owns models in
production." The experimentation + SQL foundation is real and strong; production ML is the explicit,
self-acknowledged growth edge.

## Open questions / things to confirm with the user
- Churn dashboard impact: how many users/teams rely on it daily, and did it change any decision or metric? (currently unquantified)
- Pricing experiment: what was the absolute/relative revenue or trial-volume impact of the 4.1% → 5.0% lift? (only the conversion-rate delta is given)
- Paywall A/B test: sample size / duration / how the −8% retention was measured? (defensible as-is, but worth confirming)
- Churn model: what dataset size / time window / feature count? Any reason it was never deployed (org constraints vs. own scope)?
- Python software-engineering exposure: any testing, code review, or CI experience at all, even light? (JD nice-to-have; persona lists it as "light on")
- Years framing: persona says "5 years"; JD asks "4+ years in data science or quantitative analysis" — confirm the analyst experience counts toward this (it reasonably does).

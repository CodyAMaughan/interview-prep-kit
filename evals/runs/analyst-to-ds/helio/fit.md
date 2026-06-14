# Fit — Helio / Data Scientist, Product & Growth

## JD reverse-map (their words → your evidence)
| JD requirement (quote it) | Your matching evidence | Match strength |
|---|---|---|
| "4+ years in data science or quantitative analysis" | 5 years as a data analyst in consumer subscriptions | strong |
| "Strong experiment design and causal-inference fundamentals" | Owns ~40 A/B tests/year; handled a mid-test confound by segmenting the campaign-exposed cohort and reporting both reads; CUPED-aware, power analysis | strong |
| "Design and analyze A/B experiments end to end; advise product on causal reads, not just dashboards" | Pushed for an A/B test over a hunch on the paywall redesign — found flat conversion but −8% retention and stopped the ship | strong |
| "Expert SQL" | SQL (window functions, CTEs); dbt + Looker churn dashboard | strong |
| "Proficient Python for modeling (pandas, scikit-learn, a gradient-boosting library)" | Built churn model in Python: logistic regression → XGBoost, AUC ~0.78 (pandas, scikit-learn, XGBoost) | strong (offline only) |
| "Experience taking at least one ML model to production — deployment, monitoring, and iteration" | Churn model was notebook-only; never deployed, monitored, or retrained | **GAP** |
| "Build, deploy, and monitor ML models in production (churn, propensity, LTV) — own them past the notebook through serving, monitoring, and retraining" | Has built churn model offline; no serving/monitoring/retraining experience | **GAP** |
| "Build feature pipelines and own the model lifecycle, including drift detection and eval" | dbt experience (data transformation) is adjacent; no feature pipeline / drift-detection experience | **GAP** (partial adjacency via dbt) |
| "Partner with engineers; write production-quality, tested Python" | Python in notebooks; persona is "light on" testing/CI | **GAP** |
| "Nice to have: Feature-store / ML-platform experience; MLOps tooling" | None | **GAP** (nice-to-have) |
| "Nice to have: ML system design for online serving" | None | **GAP** (nice-to-have) |
| "Nice to have: Software-engineering rigor: testing, code review, CI" | "Light on" per persona | **GAP** (nice-to-have) |

## The meta-move (per strong line)
- **Experiment design / causal reads:** I segmented out a confounded cohort mid-test and reported both reads → the textbook approach is to pre-register and protect randomization (and use CUPED to cut variance) → I chose transparent dual-reporting with caveats because the confound (a marketing push) was already live and I couldn't re-randomize, and the 4.1→5.0% lift held in the clean cohort.
- **Advising product on causal reads vs dashboards:** I pushed for an A/B test instead of shipping the paywall redesign on a hunch → the standard is gate launches on a primary metric with guardrail metrics → I chose to add retention as a guardrail, which caught a −8% retention hit behind flat conversion and stopped a quiet own-goal.
- **Modeling (offline):** I built a churn model, logistic regression baseline then XGBoost to AUC ~0.78 → the standard is start with an interpretable baseline before a boosted model → I chose to keep the baseline for interpretability and used XGBoost for the lift, then surfaced the top churn drivers for product.
- **Expert SQL:** I built the churn dashboard in dbt + Looker → the standard is model the metric layer once and let BI read from it → I chose dbt models so window-function logic lived in version-controlled SQL rather than scattered in Looker.

## GAP map (this drives the plan)
| Gap | Why it matters for THIS role | Cost to close | Priority |
|---|---|---|---|
| Production ML deployment (notebook → serving) | Directly maps to a Required line and the onsite ML system design round | high | 🔴 |
| Model monitoring / drift detection + retraining | "monitor ML models in production… drift detection and eval" — Required + onsite | med | 🔴 |
| ML system design for online serving | Dedicated onsite round; nice-to-have on paper but explicitly tested | med | 🔴 |
| Feature pipelines / model lifecycle ownership | "Build feature pipelines and own the model lifecycle" — Required line | med | 🟠 |
| Software-engineering rigor (testing, CI, code review) | "production-quality, tested Python" — Required; nice-to-have list too | low | 🟠 |
| Framing the analyst→DS narrative credibly | Past-project deep-dive + behavioral; must own the gap without sounding unqualified | low | 🟡 |

Prioritized by (JD weight) × (current weakness) ÷ (cost to close): the production-ML cluster
(deploy / monitor / system design) is the biggest, most-probed gap and gets the dedicated onsite
round, so it leads — even though it's the most expensive to close — because it's the single thing
that decides this loop.

## Honest framing
This is a **resurfacing-plus-learning split**, and naming it is the whole game. Experiment design,
causal inference, and SQL are *resurfacing* — these are at-or-above bar and should be delivered with
total confidence (the confound-handling and the paywall-retention catch are strong, defendable
stories). Production ML — serving, monitoring, retraining, ML system design — is *learning from
scratch*; the candidate has the modeling fundamentals (XGBoost, AUC ~0.78) but has never crossed the
notebook boundary. The credible in-room line: "My experimentation and SQL are production-grade today;
I've built models to AUC ~0.78 offline and I'm deliberately closing the deploy-and-monitor gap — here's
exactly what that lifecycle looks like and how I'd own it." Honesty about the gap (which the candidate
already volunteers) reads as judgment, not weakness — as long as it's paired with a concrete grasp of
the lifecycle they're learning.

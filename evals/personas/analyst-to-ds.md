# Marcus Lee — résumé (SYNTHETIC benchmark persona)

> Fictional. Authored for the interview-prep-kit eval benchmark. No real person.
> Persona id: `analyst-to-ds` — partial match with real, study-able gaps (production ML).

**Data Analyst · 5 years · Chicago, IL**
marcus.lee@example.com · github.com/example-marcus

## Summary
Data analyst who turns product questions into experiments and dashboards. Five years in consumer
subscription businesses. Strong SQL and A/B testing; have done predictive modeling in notebooks but
never shipped a model to production.

## Experience

### Tidemark Media — Senior Data Analyst (2022–present)
- Own the experimentation program for the subscriptions team: designed and read ~40 A/B tests/year.
- Built the churn dashboard (dbt + Looker) used daily by the growth and product teams.
- Ran the pricing-page experiment that lifted trial-to-paid conversion from 4.1% to 5.0%.
- Prototyped a churn-prediction model in a notebook (logistic regression, then XGBoost, AUC ~0.78) —
  shared findings, but it was never deployed or monitored.

### Penny Lane Commerce — Data Analyst (2019–2022)
- Built reporting for the marketing team; automated weekly reporting that saved ~6 analyst-hours/week.
- Did the segmentation analysis behind a re-engagement email campaign (+12% reactivation).

## Skills
SQL (expert — window functions, CTEs), Python (pandas, scikit-learn in notebooks), dbt, Looker,
experiment design (power analysis, CUPED-aware). Light on: production ML (deployment, serving,
monitoring), feature pipelines, ML system design, software engineering practices (testing, CI).

## Education
B.A. Economics, 2019.

## Intake answers (raw material for build-stories)

**Judgment under ambiguity:** "The pricing experiment had a confound — a marketing push landed mid-test.
I had to decide whether to throw out the data. I segmented out the campaign-exposed cohort, re-ran the
analysis on the clean cohort, and reported both with caveats. The 4.1→5.0% lift held in the clean
cohort. Lesson: name the confound out loud, don't bury it."

**A time you influenced a decision with data:** "Product wanted to ship a redesigned paywall on a hunch.
I pushed for an A/B test first; it turned out the redesign was flat on conversion but down 8% on
retention. We didn't ship it. Saved us from a quiet own-goal."

**Modeling work:** "I built the churn model in a notebook — logistic regression baseline, then XGBoost,
got AUC to about 0.78. I presented the top churn drivers. But I want to be honest: I never put it behind
an API, never monitored drift, never set up retraining. That's the gap I know I have."

**What you want next:** "A data scientist role where I can move from analysis into shipping models. The
Helio JD wants production ML, which I haven't done — but the experimentation and SQL foundation is
strong."

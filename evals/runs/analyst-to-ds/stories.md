# STAR Story Bank — Marcus Lee

> Built from the persona's own "## Intake answers" + résumé. Prep-only; every number traces to the
> persona file. Practice each aloud, timed to ~90s.

## JD → story map
| JD requirement / likely question | Primary story | Backup |
|---|---|---|
| "Strong experiment design and causal-inference fundamentals" / "decision with incomplete information" | Story 1 ⭐ (confound) | Story 2 |
| "advise product on causal reads, not just dashboards" / "disagreed with leadership / said no" | Story 2 ⭐ (paywall retention) | Story 1 |
| "Proficient Python for modeling… gradient-boosting" / past-project deep-dive | Story 3 (churn model) | — |
| "taking at least one ML model to production" / "a failure / time you were wrong" | Story 4 (the honest gap) | Story 3 |
| "automate / improve a process" / "drove a project" | Story 5 (reporting automation) | — |
| "drive retention and monetization" / influence with data | Story 2 ⭐ | Story 1 |

---

## Story 1 — The confounded pricing experiment   ⭐
**Covers archetypes:** Judgment under ambiguity · experiment rigor / causal inference
**Best for questions:** "a decision with incomplete information" · "a time you handled messy data" · "experiment that didn't go cleanly"

- **S:** At Tidemark Media, I ran the pricing-page A/B test for our subscriptions team — a headline conversion bet.
- **T:** Mid-test, a marketing push landed and exposed part of the test population, confounding the read. I had to decide whether the data was salvageable or a write-off.
- **A:** I identified and segmented out the campaign-exposed cohort. Then I re-ran the analysis on the clean, unexposed cohort. Then I reported both reads side by side with explicit caveats rather than burying the confound.
- **R:** The trial-to-paid lift held in the clean cohort — 4.1% → 5.0% — so we could trust and act on the result instead of discarding the whole test.
- **L:** Name the confound out loud; transparent dual-reporting beats a clean-looking number you can't defend.

**The meta-move:** I segmented out a confounded cohort and dual-reported → the textbook approach is to pre-register and protect randomization (and use CUPED to cut variance) → I chose transparent dual-reporting because the marketing push was already live and I couldn't re-randomize.
**Strengthen before the room:** tighten to 90s; ⚠️ add the absolute revenue / trial-volume impact of the 4.1→5.0% lift if available (only the rate delta is in hand).

---

## Story 2 — Killing the paywall redesign with a guardrail metric   ⭐
**Covers archetypes:** Disagreeing up / pushback · influence with data
**Best for questions:** "disagreed with leadership / said no" · "influenced a decision with data" · "prevented a mistake"

- **S:** At Tidemark, product wanted to ship a redesigned paywall on a hunch.
- **T:** I believed shipping on intuition was risky and pushed to gate it on a real test instead.
- **A:** I made the case for an A/B test before launch. Then I added retention as a guardrail metric alongside conversion. Then I read both metrics rather than declaring victory on conversion alone.
- **R:** The redesign was flat on conversion but down 8% on retention — so we didn't ship it, avoiding a quiet own-goal.
- **L:** A primary metric without a guardrail can hide the real damage; test the hunch and watch what it might break.

**The meta-move:** I pushed for an A/B test over a hunch → the standard is to gate launches on a primary metric → I chose to add retention as a guardrail, which caught the −8% hit behind flat conversion.
**Strengthen before the room:** ⚠️ confirm sample size / test duration and how the −8% retention was measured, in case the interviewer probes the read.

---

## Story 3 — Building the churn model (offline)
**Covers archetypes:** Craft / modeling judgment · communicating results
**Best for questions:** past-project deep-dive · "a modeling problem you tackled" · "how do you pick a model"

- **S:** At Tidemark, the team wanted to understand why subscribers churn.
- **T:** I owned building a churn-prediction model and surfacing the drivers product could act on.
- **A:** I built a logistic-regression baseline first for interpretability. Then I moved to XGBoost for predictive lift. Then I extracted and presented the top churn drivers to product.
- **R:** Got AUC to ~0.78 and delivered the top churn drivers; the analysis informed the team's churn thinking.
- **L:** Start with an interpretable baseline before reaching for a boosted model — you keep the "why" while chasing the lift.

**The meta-move:** baseline-then-boost → the standard is to start with an interpretable baseline before a gradient-boosted model → I kept the logistic baseline for interpretability and used XGBoost for the lift.
**Strengthen before the room:** ⚠️ add dataset size / time window / feature count; be ready to whiteboard the feature set and how you'd validate. Bridge naturally into Story 4 (what shipping it would have required).

---

## Story 4 — Owning the production-ML gap honestly
**Covers archetypes:** Failure with recovery / self-awareness · growth
**Best for questions:** "a weakness / something you're working on" · "a time you were wrong or fell short" · "what's the gap in your background for this role"

- **S:** I built the churn model in a notebook and shared the findings, but it stopped there.
- **T:** Being honest: I never put it behind an API, never monitored drift, never set up retraining — and this role is explicitly about production ML.
- **A:** I named the gap directly instead of overselling. Then I mapped exactly what the missing lifecycle is — serving, monitoring, drift detection, retraining. Then I started closing it, leaning on the modeling and experimentation fundamentals I already have.
- **R:** ⚠️ needs a number — outcome is in progress; the result is a candid, specific grasp of the lifecycle I'm learning rather than a quantified deployment.
- **L:** Owning a real gap with a concrete plan reads as judgment; pretending it isn't there reads as risk.

**The meta-move:** notebook model → the production standard is serving + monitoring + drift detection + retraining → I chose to name the gap and build toward that lifecycle rather than overclaim.
**Strengthen before the room:** rehearse so this lands as confidence + a plan, not apology; pair it tightly with Story 3 so the strong offline work is the springboard.

---

## Story 5 — Automating weekly marketing reporting
**Covers archetypes:** Initiative / process improvement · ownership
**Best for questions:** "drove a project / improved a process" · "made a team more efficient" · "took initiative"

- **S:** At Penny Lane Commerce, the marketing team's weekly reporting was manual and eating analyst time.
- **T:** I took on automating it so the team could spend time on analysis instead of assembly.
- **A:** I mapped the recurring reporting workflow. Then I automated the weekly build. Then I handed the team a self-serve output they could rely on.
- **R:** Saved ~6 analyst-hours/week, freeing that time for actual analysis.
- **L:** Automating the repetitive work buys back the hours that make the analysis better.

**The meta-move:** I automated the weekly report → the standard is to move recurring reporting into a versioned, scheduled pipeline → I automated the build so the recurring hours went back to analysis.
**Strengthen before the room:** keep this as a lighter backup; ⚠️ add the stack used for the automation and whether it persisted after handoff if asked.

---

> **Rehearsal:** practice each aloud, timed to 90s — spoken prep beats silent reading. Offer to invoke
> the `coach` subagent to grade the ⭐ headline stories (Story 1 and Story 2) against the rubric:
> concrete decision? quantified result? "I" not "we"? lesson stated? under 90s?

# Prep Plan — Helio

## Constraints
- Days until interview: 10
- Rounds: recruiter screen (30m) → technical screen (60m: SQL + experiment-design case + a modeling problem) → onsite (virtual: ML system design · past-project deep-dive · experimentation case · behavioral)

## Priority queue (do in this order)
| # | Action | Skill to run | Maps to | Must-do? |
|---|---|---|---|---|
| 1 | Build 5–7 STAR stories (confound-handling, paywall-retention catch, churn model, the honest-gap story) | build-stories | recruiter screen + onsite behavioral + past-project deep-dive | ✅ |
| 2 | Close the production-ML gap: notebook → serving → monitoring → drift/retraining, plus an ML-system-design framework | build-curriculum | technical modeling problem + onsite ML system design | ✅ |
| 3 | Sharpen SQL (window functions/CTEs) + experiment-design case reps (power, CUPED, guardrail metrics, causal reads) | build-curriculum / drill | technical screen | ✅ |
| 4 | Company brief + interviewer playbooks + JD reverse-mapping | research-prep | all rounds | ✅ |
| 5 | Timed mock technical screen (SQL + experiment case + modeling) | mock-interview | technical screen | ⬜ high-ROI |
| 6 | Timed mock ML-system-design + past-project deep-dive | mock-interview | onsite | ⬜ high-ROI |
| 7 | Morning-of glance sheet (pitch, 2 facts, smart questions, namedrops) | cheatsheets | all rounds | ⬜ |

## Day-by-day cadence
- **Day 1:** build-stories — lock the 5–7 STAR stories; nail the confound story and the paywall-retention catch as ⭐ headliners, and write the honest analyst→DS gap framing.
- **Day 2:** build-curriculum — production-ML track: deploy/serve a model, then monitoring + drift + retraining concepts. (Biggest gap, start early.)
- **Day 3:** build-curriculum — ML system design framework (online serving, feature pipelines, lifecycle); sketch a churn-serving design end to end.
- **Day 4:** SQL refresh (window functions, CTEs) + experiment-design case reps (power analysis, CUPED, guardrail metrics, causal vs correlational reads).
- **Day 5:** research-prep — company brief + per-interviewer playbooks + JD reverse-mapping; draft "why Helio".
- **Day 6:** mock-interview — timed technical screen (SQL + experiment case + modeling); coach grades; fix the top 2 weaknesses.
- **Day 7:** mock-interview — ML system design + past-project deep-dive; coach grades.
- **Day 8:** Patch curriculum gaps from the mocks; re-drill weakest topic; tighten the churn-model deep-dive narrative.
- **Day 9:** Light review — rehearse all stories aloud to 90s; one more experiment-case rep; re-skim research brief.
- **Day 10 / Morning-of:** cheatsheets glance sheet — 90s pitch, 2 facts about Helio, 3 smart questions, namedrop lines. Rest, don't cram.

## "Done" looks like
- Deliver every STAR story in ≤90s, "I" not "we", each landing on a concrete decision + a real number.
- Defend each strong line cold: experiment design, causal reads, expert SQL — including the confound-handling and the guardrail-metric catch.
- State the analyst→DS framing crisply and own the production-ML gap as judgment, not weakness.
- Recall the production-ML lifecycle cold: notebook → serving → monitoring → drift detection → retraining, and sketch a churn-model serving design on a whiteboard in ~10 minutes.
- Handle a SQL window-function/CTE problem and an experiment-design case (power, CUPED, guardrails) without hesitation.
- Say "why Helio" in their own language and name each interviewer's likely angle.

> Round-aware note: the **recruiter screen** needs only the pitch + stories + "why Helio" — do **not**
> lead with ML system design there. Front-load the production-ML cluster for the **technical screen and
> onsite**, which are where it's actually tested.

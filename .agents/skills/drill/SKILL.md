---
name: drill
version: 0.1.0
description: Active-recall drills between bigger study sessions — closed-book recall quizzes and short code/SQL problems on the user's weak spots, graded by the coach subagent against a rubric, with results fed into the spaced-repetition memory loop. Trigger with "drill me", "quiz me on my weak spots", "give me a code problem", or "/drill".
---

# drill — active recall (v0.1)

> **Ethical note:** Prep-only. Drills strengthen genuine recall before the interview; they are not a
> live answer feed.

Short, frequent recall sessions on the user's gaps. Pulls weak spots from `.agent/memory/progress/`
(populated by the curriculum loop) and the `workspace/tracks/` quizzes.

## Procedure
1. **Pick targets.** Read `.agent/memory/progress/weak-spots.md` and any `spaced-repetition.md` items
   due today. If empty, ask the user what to drill, or pull from a track's `quiz.md`.
2. **Choose a mode:**
   - **Recall quiz** — 5–10 rapid questions, **closed-book**. One at a time; wait for the answer.
   - **Code/SQL problem** — one short, timed problem (10–15 min) sized to the role's likely live task.
3. **Grade with `coach`.** Hand answers to the `coach` subagent with the rubric. Coach is **eval-first**:
   it must catch a wrong or hand-wavy answer — never rubber-stamp. Report score + the specific misses.
4. **Update the loop.** Stage results into `.agent/memory/_staging.md`:
   ```
   ## progress/mastered
   - <topic> — drilled, <score>. ✅
   ## progress/weak-spots
   - <topic> — still missing <specific concept>.
   ## progress/spaced-repetition
   - Re-drill <topic> on <date> (expand interval if passed, shrink if missed).
   ```

## Spaced repetition (simple, honest)
Passed cleanly → push the next review out (e.g. 1d → 3d → 7d). Missed → pull it back to tomorrow.
Keep it lightweight; the point is to resurface weak items, not to build a flashcard engine.

## Done criteria (per session)
- 5–10 items drilled closed-book, graded by `coach` with specific feedback.
- Weak-spots and spaced-repetition memory updated for the next session.

## v0.1 notes
Lighter than the full curriculum loop: no project, just recall + one problem. The grading rubric lives
with the `coach` subagent; richer problem banks per domain are a future addition.

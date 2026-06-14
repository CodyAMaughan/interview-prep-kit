---
name: mock-interview
version: 0.1.0
description: Run a timed, realistic mock interview — a screen-style session (e.g. coding + SQL + a product/behavioral case) or a single focused round — strictly timed, then graded by the coach subagent against a rubric with honest, specific feedback. Trigger with "run a mock interview", "mock screen me", "timed practice interview", or "/mock-interview".
---

# mock-interview — timed mock + honest grading (v0.1)

> **Ethical note:** Prep-only rehearsal. This simulates an interview *beforehand* so the real one goes
> better. It is explicitly **not** used during a live interview.

You run a realistic, **timed** rehearsal and then have the `coach` subagent grade it honestly.

## Step 1 — Pick the format (match the real round)
Default to a **45-minute screen** unless the user's `<job-slug>/plan.md` says otherwise:

| Time | Component | Tests |
|---|---|---|
| ~15 min | Coding / data-manipulation problem | working code under pressure |
| ~15 min | SQL / domain problem | analytical fluency |
| ~15 min | Product / behavioral case | structured thinking, communication |

Other formats: a single technical deep-dive, a behavioral round (run the user's `stories.md`), or a
system-design round. Choose based on the **next** real round.

## Step 2 — Setup + rules (state them, then start a timer)
- Closed-book. Speak answers **out loud** (the real round is verbal). Strict timer — call time.
- Present one component at a time; don't reveal later parts early. Don't help mid-problem — this is a test.

## Step 3 — Run it
Give the prompt, hold the time box, take the user's answer. Move on at the buzzer even if incomplete —
realism matters. Capture their answers verbatim for grading.

## Step 4 — Grade with `coach`
Hand the transcript to the **`coach`** subagent with the rubric (correctness, structure/communication,
time management, did they state trade-offs, "I" not "we" on behavioral). Coach is **eval-first**: it
must flag a weak answer and assign an honest grade — never rubber-stamp a near-miss as a pass.

Report: a score per component, the **two highest-leverage fixes**, and what to re-drill.

## Step 5 — Record progress
Stage into `.agent/memory/_staging.md`:
```
## progress/mock
- <format> mock: <scores>. Top fixes: <a>, <b>.
## progress/weak-spots
- <component> — <specific miss to re-drill>.
```

## Done criteria
- A timed, closed-book mock matching the real round's shape.
- Graded by `coach` with a per-component score + two concrete fixes.
- Weak spots fed back into the memory loop.

## v0.1 notes
Ships the structure + grading flow; a deeper bank of role-specific mock prompts is a future addition.
The user (or coach) supplies prompts from `workspace/<job-slug>/tracks/` or the role's likely tasks for now.

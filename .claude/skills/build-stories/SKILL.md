---
name: build-stories
version: 0.1.0
description: Interview the candidate about their real work and turn it into a bank of STAR behavioral stories, each mapped to the job description and to common behavioral archetypes (judgment under ambiguity, disagreeing up, failure-with-recovery, leadership, conflict). Produces 90-second, evidence-based stories reusable across many questions. Trigger with "build my behavioral stories", "make STAR stories", "prep my behavioral answers", or "/build-stories".
---

# build-stories — STAR story bank from real work

> **Ethical note:** These are the candidate's **own** stories from work they actually did. You help
> structure and tighten them for prep; you do not invent experiences or embellish results.

You interview the user about their real work, then shape each story into a tight STAR answer mapped to
the JD and to behavioral archetypes. Goal: **5–7 distinct stories**, each deliverable in **~90 seconds**,
each **reusable** across several questions. Output goes to `workspace/stories.md`.

## Principle: evidence, not recital

A strong behavioral answer **shows** a competency through a specific decision; it doesn't *assert* it.
"I'm a strong leader" is recital. "I set the technical direction and led 6 engineers from 400 → 100k+
units/quarter" is evidence. Every story must land on a concrete decision the candidate made and a
quantified result. Reject vague answers and dig for the specific.

## Step 1 — Anchor to the JD + archetypes

Read `workspace/profile.md` and the relevant `workspace/<job-slug>/fit.md`. Build a coverage matrix: which
**archetypes** does this role probe, and which real experiences can cover each?

Default behavioral archetypes (each maps to common questions):

| Archetype | Signal it tests | Classic question |
|---|---|---|
| Judgment under ambiguity | acts without full instructions | "decision with incomplete information" |
| Disagreeing up / pushback | data over authority, not combative | "disagreed with leadership / said no" |
| Failure with recovery | ownership, durable learning | "a failure / a time you were wrong" |
| Leadership / direction | sets direction beyond own work | "led a team / drove a project" |
| Conflict / collaboration | works across people | "a teammate conflict you resolved" |
| Ambiguous bet / trade-off | makes hard calls, owns them | "a risky architectural/strategic bet" |

Tailor the set to the JD (a Staff/Lead role weights leadership + bets; an IC role weights craft +
ambiguity). One strong story usually covers **2–3** archetypes — note the reuse.

## Step 2 — Interview the user, one story at a time

For each target story, run a short structured interview. **Don't accept the first vague pass** — follow
up until each STAR field is concrete:

- **Situation** — company, project, stakes. *One* sentence. "What made this matter?"
- **Task** — what was *yours* specifically. Force the "I", not "we".
- **Action** — exactly **three** distinct things they did. "Then what? What did *you* decide?"
- **Result** — quantified. Push: "What's the number? before → after? %, $, time saved, scale?"
- **Lesson** — one generalizable, one-sentence principle. This is the punchline; don't skip it.

If the user gives a fuzzy result ("it went well"), keep probing or mark it `⚠️ needs a number` rather
than fabricating one.

## Step 3 — Write each story

Append to `workspace/stories.md`:

```markdown
## Story <n> — <short title>   ⭐ (mark the 1-2 headline stories)
**Covers archetypes:** <e.g. leadership · LLM-at-scale · ambiguity>
**Best for questions:** <2-3 question types>

- **S:** <one sentence — company, project, stakes>
- **T:** <your specific charge — "I", not "we">
- **A:** I did X. Then Y. Then Z.   (three concrete actions)
- **R:** <quantified outcome + one memorable detail>
- **L:** <one-sentence generalizable lesson>

**The meta-move:** what I did → the SOTA/standard approach → the trade-off I chose.
**Strengthen before the room:** <e.g. tighten to 90s · add the $ impact · be ready to whiteboard in 60s>
```

## Step 4 — The JD → story map

At the top of `workspace/stories.md`, write the lookup that lets the user pick the right story live:

```markdown
## JD → story map
| JD requirement / likely question | Primary story | Backup |
|---|---|---|
| "<JD line or question>" | Story 1 ⭐ | Story 3 |
```

## Step 5 — Rehearsal + grading

Tell the user to **practice each aloud, timed to 90s** (spoken prep beats silent reading — the room is
verbal). Offer to invoke the **`coach`** subagent to hear a story and grade it against the rubric:
specific decision present? quantified result? "I" not "we"? lesson stated? under 90s? The coach is
eval-first — it will flag a weak or vague story rather than rubber-stamp it.

## Step 6 — Record progress

Stage into `.agent/memory/_staging.md`:
```
## progress/stories
- <n> stories built, <m> rehearsed-to-90s. Weak: <story needing a number>.
```

## Done criteria
- 5–7 distinct stories, each in STAR + lesson form, each ≤90s spoken.
- Every story lands on a concrete decision + a quantified (or honestly-flagged) result — no fabrication.
- A JD → story map covers the role's archetypes with deliberate reuse.
- At least the ⭐ headline stories graded by `coach`.

---
name: build-curriculum
version: 0.1.0
description: Turn the GAP map from prep-intake into focused study tracks, each following the loop cheatsheet → quiz (closed-book) → project → honest checklist with brutal "done" criteria. Ships a small library of reusable, generic domain cheatsheet stubs (SQL, experimentation/A-B, system design, ML system design, agentic/LLM, behavioral) to seed tracks fast. Trigger with "build my study plan", "make curriculum tracks", "close my interview gaps", or "/build-curriculum".
---

# build-curriculum — gap-driven study tracks

> **Ethical note:** Prep-only. This builds *study* material to genuinely close real knowledge gaps
> before an interview — it is not an answer bank to recite.

You convert the prioritized GAP map (from `workspace/fit-*.md` / `workspace/plan.md`) into **tracks**.
Each track follows one proven loop and ends in something the user can talk through fluently:

```
cheatsheet  ─►  quiz (closed-book)  ─►  project (hands-on)  ─►  checklist (honest self-assessment)
 skim once       grade yourself          build & explain         tick only what's true → loop if not
```

Output goes to `workspace/tracks/track-N-<topic>/`.

## Step 1 — Pick & order the tracks

From the GAP map, choose tracks by **(JD weight) × (weakness) ÷ (cost to close)** — biggest, cheapest,
most-probed first. Mark each **must-do** vs **high-ROI**. Keep it to what the timeline allows; 3 deep
tracks beat 6 shallow ones. Write `workspace/tracks/README.md` with the table + cadence (front-load the
biggest must-do on Day 1).

## Step 2 — Seed from a cheatsheet stub (don't start blank)

This skill ships generic, **personal-data-free** cheatsheet stubs in `cheatsheet-stubs/`:

| Stub | Covers |
|---|---|
| `sql.md` | window functions, CTEs, joins/anti-joins, NULL traps, partitioning |
| `experimentation.md` | A/B design, power/MDE, p-values vs CIs, CUPED, MABs, pitfalls |
| `system-design.md` | the framing loop, scaling, caching, queues, trade-off vocabulary |
| `ml-system-design.md` | problem framing, features, training/serving skew, eval, monitoring |
| `agentic-llm.md` | RAG, hybrid search, evals/LLM-as-judge, agents vs workflows, context engineering |
| `behavioral.md` | STAR, the archetypes, the meta-move, common pitfalls |

If a gap matches a stub, copy it into the track as `cheatsheet.md` and **specialize it to the JD**
(add the company's stack, drop irrelevant sections). If no stub fits, author a fresh dense cheatsheet:
skimmable, example-first, the 20% of the topic that's 80% of the interview.

## Step 3 — Build the track loop

For each `track-N-<topic>/`:

1. **`cheatsheet.md`** — dense reference (from a stub or fresh). ~30-min skim.
2. **`quiz.md`** — 12–20 questions, mix of conceptual + write-the-code. Tell the user: **closed-book**.
3. **`quiz-answers.md`** — answers + brief *why*. "Open only after you've attempted everything."
4. **`project/`** — a 1–3 hour hands-on build with a real(istic) dataset: a `README.md` brief, a
   starter skeleton, and **locked solutions** in `project/solutions/`. The project should mirror the
   likeliest live task for this role.
5. **`checklist.md`** — honest self-assessment. Specific, checkable items ("I can write
   `ROW_NUMBER() OVER (PARTITION BY x ORDER BY y)` without looking it up"), not vague ones.

## Step 4 — Brutal "done" criteria

Every track states an explicit, **honest** done bar (this is the loop's defining feature — do
not soften it). A track is done only when the user can:

1. Walk a friend through the cheatsheet's concepts in their own words.
2. Score **≥80% on the quiz closed-book** — no peeking.
3. Complete the project end-to-end and **explain every design choice**.
4. Tick **every** checklist item honestly.

> "A shaky checkbox costs you points in the interview you won't get back." If any item is unticked, the
> user loops back to the cheatsheet section — they do **not** advance.

## Step 5 — Grade + record progress

Offer the **`coach`** subagent to administer the quiz closed-book and grade against the answer key, and
to review the project memo. Coach is eval-first: it must catch a wrong/hand-wavy answer.

Stage progress into `.agent/memory/_staging.md`:
```
## progress/mastered
- <topic> — quiz <score> closed-book, project done. ✅
## progress/weak-spots
- <topic> — <specific shaky concept>. Re-drill.
## progress/spaced-repetition
- Re-quiz <topic> on <date> (<interval>).
```

## Done criteria
- Tracks chosen and ordered by ROI; must-do vs high-ROI marked; cadence written.
- Each track has cheatsheet → quiz → quiz-answers → project (+locked solutions) → checklist.
- Each track states the brutal 4-point done bar; checklist items are specific and checkable.
- No personal data in any track or stub — examples are generic.

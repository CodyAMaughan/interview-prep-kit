---
name: decide
version: 0.1.0
description: Optional multi-offer decision aid. Build a weighted decision matrix to compare competing offers against the candidate's own priorities, with explicit guards against recency bias (set weights cold, score warm, trust the post-adrenaline read). Trigger with "compare my offers", "build a decision matrix", "help me choose between offers", or "/decide".
---

# decide — multi-offer decision matrix (v0.1, optional)

> **Ethical note:** Prep-only career tooling. This helps the candidate make an honest, values-aligned
> choice between *their own* offers/opportunities — it does nothing during an interview.

A weighted scorecard to compare 2+ opportunities, designed to defeat the recency spike ("whoever you
just talked to feels like #1 for half a day"). Output to `workspace/decision-matrix.md`.

## The method (and why each step)
1. **Set weights COLD.** With the user, list ~6–9 criteria that actually matter (variety, people/manager,
   sustainability/family, autonomy, mission, cash comp, title, stability, equity). Assign weights out of
   100. Do this on a **calm day**, *not* right after a great conversation — that's the whole point.
2. **Score WARM (1–5)** per option per criterion, updating as facts come in. Mark unknowns `TBD`.
3. **Compute** weighted totals. Show the math so the user can argue with any cell.
4. **Read it against the spike.** If a small weight change flips the ranking, that's the signal it's a
   genuine **values call**, not a math answer — name that explicitly.

## Recency-bias guards (bake these in)
- Rewrite **weights** only on a calm day — never let one spiked conversation rewrite them.
- After each conversation, wait for the **post-adrenaline read** (~half a day) before re-scoring.
- Separate **bankable** comp (base + bonus) from **illiquid** equity; weight equity by probability of
  a liquidity event, not headline value.
- List **open questions** that turn `TBD`s into facts, per option — the decision is only as good as these.

## Output shape → `workspace/decision-matrix.md`
```markdown
# Decision Matrix — <Opt A> vs <Opt B> vs <Opt C>
> Weights set cold on <date>. Score warm; trust the post-adrenaline read over the spike.

## Weights (edit on a calm day only)
| # | Criterion | Weight | Why weighted this way |

## Scorecard (1 weak – 5 strong)
| Criterion (weight) | A | B | C |
| ... | | | |
| **WEIGHTED TOTAL /100** | | | |

## Why each score (so you can argue with it)
## Key facts (so it isn't hand-wavy)   | comp | equity read | remote | manager | stability |
## Open questions (turn TBDs into facts)
## The actual fork  — what each option wins on, and the decision protocol
```

## Done criteria
- Weights set cold and owned by the user; scores per option with the math shown.
- Recency-bias guards applied; bankable vs illiquid comp separated.
- Open questions listed per option; the "what each wins on" fork stated plainly.

## v0.1 notes
Markdown matrix only. A live-recompute spreadsheet/HTML is a future nicety.

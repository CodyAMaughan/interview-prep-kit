---
name: cheatsheets
version: 0.1.0
description: Generate dense one-page references and a "morning-of" glance sheet from the user's prep — the 90-second pitch, two facts to memorize, top stories, smart questions, and namedrop lines that map their experience to the role's problems. Trigger with "make my cheatsheet", "morning-of glance sheet", "namedrop lines", or "/cheatsheets".
---

# cheatsheets — one-pagers + morning-of sheet (v0.1)

> **Ethical note:** Prep-only. A glance sheet you review *before* you walk in — not something to read
> *during* the interview.

You distill the workspace into dense, glanceable references. Output to `workspace/<job-slug>/cheatsheets/`.

## Output 1 — Domain one-pagers
For each track or topic the user wants on one page, compress its `cheatsheet.md` to the **20% that's
80% of the interview**: the formulas/patterns/vocabulary they'd want to have skimmed an hour before.
Keep it to a single screen. Save as `workspace/<job-slug>/cheatsheets/<topic>.md`.

## Output 2 — Morning-of glance sheet (the flagship)
One page per round, to glance at ~10 minutes before. Save as
`workspace/<job-slug>/cheatsheets/morning-of-<round>.md`:

```markdown
# Morning-of — <Company> / <round>
> Glance 10 min before. One page. Do NOT read it *during* the call.

## The one rule
<the user's personal tell, e.g. "say each point once, then stop">

## 90-second opener (beats, not a script)
1. <years + domain>  2. <headline experience>  3. <the 250×-style proof point>
4. <relevant side work>  5. <why now → why THIS company>

## Two lines to know cold
- Mission: "<company mission in their words>"
- Comp (let them anchor): "Do you have a budgeted range? I'd like to align before I name a number."

## Facts (if "what do you know about us?")
- <2–3 recent signals from the company brief>

## Top stories (titles only — you know the rest)
- <Story 1 ⭐> · <Story 2> · <Story 3>

## 3 questions to ask
- <incl. the one that gets the next-round roadmap>
```

## Output 3 — Namedrop lines (experience → their problem)
Ready-to-say lines that map the user's **real** work onto the role's problem, each with a one-line
"why it lands". Drop naturally, don't recite. Save as `workspace/<job-slug>/cheatsheets/namedrop.md`:

```markdown
## One-line positioning (open with this)
> "<one sentence that frames your background as exactly their problem>"

## The lines
**🎯 "<a real, specific, quantified thing you did, phrased as their problem>"**
*Why it lands:* <the connection to the role>
```

Pull only from `workspace/profile.md` / `stories.md` — **never invent** an accomplishment for a line.

## Done criteria
- A morning-of glance sheet per round (pitch, 2 cold lines, facts, story titles, 3 questions).
- Namedrop lines grounded only in the user's real, evidenced work.
- Each one-pager fits a single screen.

## v0.1 notes
Markdown only. Rendering to a printable HTML/PDF glance card is a future nicety.

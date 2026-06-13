---
name: research-prep
version: 0.1.0
description: Research the target company and the specific people the candidate will meet. Produce a company brief (mission, products, recent news, the "why this company" angle) plus a per-interviewer playbook (background, what they value, likely questions, and a strategy for each), and a JD reverse-mapping. Trigger with "research this company", "prep for my interviewers", "build a company brief", or "/research-prep".
---

# research-prep — company brief + interviewer playbooks

> **Ethical note:** Prep-only. This is the homework any thoughtful candidate does before an interview —
> public research about the company and the people they'll meet, so the conversation is informed.

You build the user's situational awareness for the conversation: what the company does, why they'd
join, and who's across the table. Output goes to `workspace/research/`.

## Step 1 — Company brief → `workspace/research/<company>-brief.md`

Gather from public sources (company site, newsroom/blog, the JD, press, funding databases — paste-in
or fetch where allowed). Write:

```markdown
# <Company> brief

## Mission (memorize one line, in *their* words)
> "<the company's own mission framing>"

## What they build
- Products / business lines: <...> (which one is this role on?)
- Customers / market · Stage & funding · Approx size · HQ / remote posture

## Recent signals (last ~6–12 months)
- <launch / partnership / funding / strategic shift> — and why it matters for this role.

## Why this company (your honest angle)
<the genuine reason this role fits — map the company's language to the candidate's experience. This is
the "③ are you genuinely interested in US?" answer a screen is testing.>

## Smart questions to ask (3–4, including one that reveals the process)
- "What do the next rounds look like and what should I focus on?" (best study map there is)
- <one that shows you read their recent news> · <one about the team's actual problems>
```

## Step 2 — Per-interviewer playbook → `workspace/research/interviewers/<name>.md`

For **each** known interviewer (name + title from the recruiter/scheduler), research publicly
(LinkedIn — note it may be blocked; fall back to a pasted profile — talks, papers, GitHub, podcasts):

```markdown
# Interviewer — <Name>, <Title>

## Background (public)
<career arc, what they've built, anything you genuinely share / can connect on>

## What they likely value
<from their role + writing: rigor? shipping? leadership? craft? mission?>

## What this round tests
<screen / technical depth / system design / leadership / culture — be specific>

## Likely questions
- <2–4 questions this person is likely to ask, given their role & focus>

## Your strategy
- Lead with: <the story/point that lands best with THIS person>
- Connect: <a genuine common thread, if any — warm intro, shared domain>
- Bridge to their work: <the meta-move — your experience → their problem space>
- Avoid: <a known trap — e.g. don't over-claim X with a deep expert>
```

> If you can't verify something about a person, **say "unverified" — don't invent a bio.** Bad research
> is worse than none.

## Step 3 — JD reverse-mapping (reuse / extend prep-intake's)

If `workspace/fit-<company>.md` already has a JD reverse-map, pull its strong lines here as
**talking points** per round. If not, build it: each JD line → the candidate's evidence → the meta-move
(what you did → SOTA → trade-off). This is what turns research into things to actually *say*.

## Step 4 — Round-by-round plan

Tie it together: a short table of `round → interviewer → what it tests → your top 2 moves`, ordered by
schedule. Front-load the next round.

## Step 5 — Record progress
Stage into `.agent/memory/_staging.md`:
```
## progress/research
- <Company> brief done. Interviewers covered: <names>. Why-this-company line locked.
```

## Done criteria
- Company brief with a one-line mission, recent signals, an honest "why this company", and 3–4 questions.
- A playbook per known interviewer (background / values / likely-Qs / strategy), with unverified items
  flagged, not fabricated.
- JD lines mapped to talking points + the meta-move per strong line.

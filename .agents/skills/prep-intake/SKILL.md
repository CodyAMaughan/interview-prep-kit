---
name: prep-intake
version: 0.1.0
description: The spine of interview-prep-kit. Ingest a candidate's real context (resume, LinkedIn, GitHub, personal site, one or more job descriptions, plus arbitrary pasted docs/URLs), synthesize a candidate Profile, map their experience to each JD, surface the GAPS, and produce a prioritized, timeline-aware PLAN — written to a private, gitignored workspace. Trigger with "prep for an interview", "start interview prep", "intake my resume and this JD", or "/prep-intake".
---

# prep-intake — the prep spine

> **Ethical note:** This is a *prep-only* tool. It maps the candidate's **own real experience** to a
> job so they can study and rehearse beforehand. It is **not** a real-time interview assistant or
> answer-feeder. Work only from what the user actually did.

You are an interview-prep lead. Your job in this skill is **INTAKE → PROFILE+FIT → PLAN**. You take in
everything about the candidate and the target role, build an honest picture, find the gaps, and hand
the user a prioritized plan that the other skills execute.

```
INTAKE  ─►  PROFILE + FIT  ─►  PLAN  ─►  hand off to:
(gather)    (who they are,      (what to do,    build-stories · build-curriculum · drill ·
            map to JD, gaps)    in what order)  mock-interview · research-prep · cheatsheets · decide
```

## Step 0 — Create the private workspace

All personal output goes in a **gitignored** workspace so the user can never commit their resume/JD.
Candidate-level files (who you are) live at the **base**; **each target job gets its own subfolder** so
multiple jobs stay organized side by side under one base folder.

1. Default to `workspace/` in the current repo (already in this plugin's `.gitignore`). If the user is
   running this inside their *own* separate prep repo, use `prep/` there instead — confirm which.
2. Pick a short, kebab-case **job slug** for this role — the company, plus the role if prepping more than
   one role at the same company (e.g. `lumen-robotics` or `lumen-platform-eng`).
3. Create the workspace skeleton:
   ```
   workspace/
     inputs/resume.md      # shared candidate input(s): resume, links.md, extra/
     profile.md            # shared: synthesized candidate profile (who you are)
     stories.md            # shared: reusable STAR story bank (build-stories)
     decision-matrix.md    # shared: multi-offer comparison (decide), if used
     <job-slug>/           # ONE per target job — everything role-specific:
       jd.md               #   the job description
       fit.md              #   experience↔JD map + GAP map
       plan.md             #   the prioritized, timeline-aware plan
       research/ tracks/ cheatsheets/   # filled by the other skills, per job
   ```
4. Tell the user: *"Everything here is private and gitignored. Nothing personal goes in the shared
   repo."* If `workspace/` is somehow not gitignored, STOP and fix `.gitignore` first.

## Step 1 — INTAKE (gather everything)

Ask for inputs one source at a time; accept whatever the user has and move on. Save shared inputs
(resume, links, extra) under `workspace/inputs/`, and each job's JD under its own
`workspace/<job-slug>/jd.md`, so later skills can re-read them.

Sources to request (all optional except a JD and *some* experience signal):
- **Resume / CV** — ask them to paste text or drop a file path. (A PDF is fine — read it; just never
  commit it. The secret-scan hook enforces that.)
- **LinkedIn** — note that LinkedIn often **blocks automated fetching**. If a URL fails, instruct the
  user to use the fallback: *Profile → More → Save to PDF*, or *Settings → Get a copy of your data*,
  then paste the text or give a file path. Don't burn turns retrying a blocked URL.
- **GitHub** — username or repo URLs; pull languages, notable repos, READMEs (public, fetchable).
- **Personal site / portfolio / blog** — fetch and summarize.
- **Job description(s)** — one or more. Give each its own job slug and save it as
  `<job-slug>/jd.md`. Multiple JDs each get their own subfolder (they drive the optional `decide` step later).
- **Arbitrary added context** — recruiter emails, take-home prompts, Glassdoor notes, pasted docs,
  extra URLs. Accept all of it; file under `inputs/extra/`.

> If the user has *nothing* yet, point them at `examples/sample-candidate.md` + `examples/sample-jd.md`
> to see the shape, then come back with their real materials.

## Step 2 — PROFILE (synthesize who they are)

From the inputs, write `workspace/profile.md` (shared across all jobs). Be concrete and evidence-based — pull real numbers,
systems, and scope from their materials. Schema:

```markdown
# Candidate Profile

## Headline
<one sentence: years + domain + the strongest signal>

## Evidence inventory (the raw material for everything downstream)
| Experience / project | Scope & scale | Tech / methods | Quantified impact |
|---|---|---|---|
| <role/project> | <team size, data scale, $> | <stack> | <metric, before→after> |

## Strengths (claims you can defend cold)
- <strength> — backed by <which experience>

## Themes / through-line
<what story your career tells; the 1-2 threads a strong narrative leans on>

## Open questions / things to confirm with the user
- <anything ambiguous or missing — ask, don't invent>
```

Rule: **never fabricate experience or numbers.** If something is missing, list it under *Open
questions* and ask. The integrity of every downstream story depends on this.

## Step 3 — FIT (map experience ↔ JD, find the gaps)

For **each** JD, write `workspace/<job-slug>/fit.md`:

```markdown
# Fit — <Company> / <Role>

## JD reverse-map (their words → your evidence)
| JD requirement (quote it) | Your matching evidence | Match strength |
|---|---|---|
| "<exact JD line>" | <profile evidence> | strong / partial / **GAP** |

## The meta-move (per strong line)
For each strong match, prep the move: **what you did → name the SOTA/standard approach → state the
trade-off you chose.** (e.g. "I built X → the textbook approach is Y → I chose Z because <constraint>.")

## GAP map (this drives the plan)
| Gap | Why it matters for THIS role | Cost to close | Priority |
|---|---|---|---|
| <topic/skill> | <JD line it maps to> | low/med/high | 🔴/🟠/🟡 |

## Honest framing
<the resurfacing vs learning-from-scratch framing — are they sharpening known skills or learning new
ones? Name it so the user can say it in the room.>
```

The GAP map is the heart of the tool. Prioritize by **(JD weight) × (current weakness) ÷ (cost to
close)** — biggest, cheapest, most-probed gaps first.

## Step 4 — PLAN (prioritized, timeline + round aware)

Ask two things if not already known: **how many days until the interview**, and **the round
structure** (recruiter screen? technical? hiring manager? onsite/panel?). Then write
`workspace/<job-slug>/plan.md`:

```markdown
# Prep Plan — <Company>

## Constraints
- Days until interview: <n>     - Rounds: <screen → technical → ...>

## Priority queue (do in this order)
| # | Action | Skill to run | Maps to | Must-do? |
|---|---|---|---|---|
| 1 | <e.g. build the 5 STAR stories> | build-stories | screen + HM round | ✅ |
| 2 | <e.g. close SQL gap> | build-curriculum | technical round | ✅ |
| 3 | <e.g. company brief + interviewer playbooks> | research-prep | all rounds | ✅ |
| 4 | <e.g. timed mock screen> | mock-interview | technical round | ⬜ high-ROI |

## Day-by-day cadence
- **Day 1:** <the single biggest must-do>
- **Day 2:** ...
- **Morning-of:** glance sheet (cheatsheets) — pitch, 2 facts, 3 questions.

## "Done" looks like
<the brutal, honest bar for being ready — defend each strong line, recall each gap topic cold,
deliver each story in 90s, name why-this-company in their language.>
```

Round-aware sequencing: front-load whatever the **next** round tests. A recruiter screen needs the
pitch + stories + why-this-company, **not** system design — don't over-prepare technically for a
non-technical screen.

## Step 5 — Hand off + record progress

1. Summarize: profile headline, the top 3 gaps, the plan's first action.
2. Offer the next skill explicitly (usually `build-stories` or `build-curriculum`).
3. Stage a progress note for the memory loop into `.agent/memory/_staging.md`:
   ```
   ## progress/plan
   - Target: <Company>/<Role>, <n> days out. Top gaps: <a>, <b>, <c>. Next: <skill>.
   ```

## Done criteria for this skill
- `workspace/` exists and is gitignored; shared inputs saved under `inputs/`, each JD under `<job-slug>/jd.md`.
- `profile.md` (base, shared) is evidence-based with zero fabricated claims; open questions surfaced, not guessed.
- A `<job-slug>/fit.md` per JD with a JD reverse-map + a prioritized GAP map.
- `<job-slug>/plan.md` is timeline- and round-aware with a brutal "done" bar.

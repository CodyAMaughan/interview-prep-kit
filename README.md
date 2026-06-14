# interview-prep-kit

A Claude Code **plugin** that standardizes a proven, end-to-end interview-prep workflow into something
shareable. It helps you **prepare before an interview**: map your real experience to a job description,
find the gaps worth studying, build behavioral stories from work you actually did, drill them, and
research the company and the people you'll meet.

It ships the **machine** (skills, prompts, templates, methodology) and **zero personal data**. When you
run it, it generates a **private, gitignored workspace** that holds *your* resume, JDs, and artifacts.

---

## ⚖️ What this is — and what it is NOT

**What this IS — a PREP tool.** Used *before* an interview, on your own time, to get genuinely ready:
- Synthesize an honest profile from your real resume / LinkedIn / GitHub / portfolio.
- Map your experience to a specific JD and surface the real gaps.
- Build STAR behavioral stories from your **own** work — evidence, not invention.
- Close knowledge gaps with focused study tracks (cheatsheet → quiz → project → checklist).
- Drill, run timed mock screens, and get honest grading.
- Research the company and your interviewers the way any thoughtful candidate does.

**What this is NOT.** This is **not** a real-time interview assistant, an answer-feeder, a "cheat"
overlay, or anything you run *during* a live interview. It is **not** a Cluely-style listen-and-whisper
tool. It does not generate fake experience. The goal is simple and honest: help job-seekers in a tough
market walk in **prepared**, using their own real story. Every skill carries a one-line prep-only note,
and the `coach` grader exists to tell you when an answer is weak — not to feed you one.

---

## Quickstart

1. **Install the plugin** (Claude Code):
   ```sh
   # add this repo as a marketplace, then install the plugin
   /plugin marketplace add <your-fork-or-clone-path-or-url>
   /plugin install interview-prep-kit
   ```
   Or clone it and validate locally:
   ```sh
   git clone <url> interview-prep-kit && cd interview-prep-kit
   claude plugin validate . --strict
   ```

2. **Run the spine — `prep-intake`.** In Claude Code:
   > "Start interview prep — here's my resume and the JD."

   It creates a private `workspace/` (gitignored), ingests your context, and writes candidate-level
   files at the base plus **one subfolder per job** so multiple roles stay organized:
   - `workspace/profile.md` — your evidence-based candidate profile (shared across jobs)
   - `workspace/<job-slug>/fit.md` — your experience mapped to that JD + a prioritized **gap map**
   - `workspace/<job-slug>/plan.md` — a timeline- and round-aware prep plan for that job
   - …with `stories.md` at the base (reusable), and `research/`, `tracks/`, `cheatsheets/` filling in
     under each `<job-slug>/` as you run the other skills.

3. **Run the output modes your plan points you to:**

   | Skill | Use it to… |
   |---|---|
   | `build-stories` | turn your real work into 90-second STAR stories mapped to the JD + archetypes |
   | `build-curriculum` | build gap-closing study tracks (cheatsheet → quiz → project → checklist) |
   | `research-prep` | write a company brief + a per-interviewer playbook |
   | `drill` | active-recall quizzes + code problems on your weak spots, graded by `coach` |
   | `mock-interview` | a timed mock screen, graded honestly against a rubric |
   | `cheatsheets` | dense one-pagers + a morning-of glance sheet + namedrop lines |
   | `decide` | (optional) a weighted multi-offer decision matrix with recency-bias guards |

4. **Everything personal stays private.** `workspace/` and `prep/` are gitignored, and a `secret-scan`
   hook blocks committing resumes/PDFs/`.env` files even if you slip.

See **`examples/`** for a **fake** candidate + **fake** JD + a sample generated artifact, so you can
see the output shape before supplying any real data.

---

## How it works (the workflow)

```
INTAKE  ─►  PROFILE + FIT  ─►  PLAN  ─►  { STORIES · CURRICULUM · DRILL/MOCK · RESEARCH · CHEATSHEETS · DECIDE }
```

The `prep-intake` skill is the spine; the rest are output modes you run as your timeline demands. A
`coach` subagent grades your stories, quizzes, and mocks honestly (it is built to catch a weak answer,
not rubber-stamp it). A lightweight memory loop tracks what you've **mastered**, your **weak spots**,
and **spaced-repetition** due dates across sessions. Full rationale in
[`docs/DESIGN.md`](docs/DESIGN.md).

---

## The framework / personal boundary (important)

| | The machine (this repo) | Your workspace (generated) |
|---|---|---|
| Contents | skills, prompts, templates, generic cheatsheet stubs | your resume, JDs, profile, stories, plan |
| Personal data | none, ever | all of it |
| Git | committed, shareable | **gitignored** |

If you fork or contribute, this boundary is the one rule to keep: **never commit personal data**, and
keep `examples/` fake.

---

## Share / contribute

This exists to help people in a hard job market. If it helped you, share it. Improvements welcome —
new generic cheatsheet stubs, better rubrics, sharper prompts. See [`CONTRIBUTING.md`](CONTRIBUTING.md).
**Do not** contribute personal data, real company-specific research, or anything that turns this into a
live-interview tool — those PRs will be declined.

## License

MIT © Cody Maughan. See [`LICENSE`](LICENSE).

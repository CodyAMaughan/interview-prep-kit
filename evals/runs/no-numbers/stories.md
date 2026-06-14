# STAR Story Bank — Sam Whitfield

> **Integrity note:** This persona's intake answers contain **no quantified results**. Every result
> below is flagged `⚠️ needs a number` where the candidate could not give a metric. These are NOT
> invented. Before the interview, the candidate must dig up the real numbers (analytics, dashboards,
> PR/incident history) or be ready to give an honest "I'd want to confirm the exact figure" — never
> fabricate one in the room.

## JD → story map
| JD requirement / likely question | Primary story | Backup |
|---|---|---|
| "Evidence of measurable impact" / "tell me about a project you're proud of" | Story 1 ⭐ (checkout rebuild) | Story 5 (ops tooling) |
| "Own the quality of what you ship" / "tell me about a failure" | Story 2 ⭐ (checkout bug + recovery) | Story 4 (legacy migration) |
| "Improve reliability / testing" / "time you led or drove change" | Story 3 (testing practices + onboarding) | Story 2 |
| "Backend services, modernization" / "a hard technical decision" | Story 4 (legacy migration) | Story 1 |
| "Collaborate with product and design" / "working across functions" | Story 5 (ops tooling) | Story 1 |
| "Improve performance with before/after results" | Story 1 ⭐ (checkout/perf) | Story 4 |

---

## Story 1 — Rebuilt the checkout flow   ⭐
**Covers archetypes:** judgment under ambiguity · craft/ownership · (performance impact)
**Best for questions:** "a project you're proud of" · "measurable impact" · "improving performance"

- **S:** At Lattice Interactive, the customer-facing checkout flow was messy and slow — a revenue-critical path that frustrated users.
- **T:** I owned rebuilding the checkout flow to make it cleaner and faster.
- **A:** I (1) untangled the existing checkout code and restructured the React/Node flow; (2) addressed the slow pages in the path; (3) shipped the rebuilt flow and watched how users responded.
- **R:** ⚠️ **needs a number** — candidate believes conversion went up and it "felt faster," but has no verified metric ("I'd have to check"). MUST gather: conversion/completion rate and page latency, before → after, before relying on this story.
- **L:** A revenue-critical path is worth rebuilding deliberately rather than patching — but you have to instrument it so you can prove the win.

**The meta-move:** I rebuilt a messy checkout → the standard play is incremental refactor behind tests / feature flags → ⚠️ confirm which approach was actually taken before claiming the trade-off.
**Strengthen before the room:** This is the headline story and it currently has NO number — top priority is pulling the real conversion/latency before→after. Tighten to 90s. Be ready to whiteboard the checkout architecture in 60s.

---

## Story 2 — The checkout bug and the recovery   ⭐
**Covers archetypes:** failure with recovery · ownership/quality
**Best for questions:** "tell me about a failure / a time you were wrong" · "owning the quality of what you ship"

- **S:** At Lattice, a bug shipped in the checkout caused some orders to fail.
- **T:** I took part in diagnosing and fixing it, and in making sure it didn't recur.
- **A:** I (1) helped trace and fix the failing-order bug; (2) ⚠️ confirm: did you add a regression test / edge-case coverage? (candidate says lesson was "test edge cases more carefully" — name the concrete action you took); (3) ⚠️ confirm whether you changed the review/testing process afterward.
- **R:** ⚠️ **needs a number** — number of failed orders and incident duration unknown ("not sure of the exact count"). MUST gather from the incident ticket: orders affected, time-to-detect, time-to-fix.
- **L:** Edge cases on a money path aren't optional — a failure here is the cheapest possible reason to make edge-case testing a default.

**The meta-move:** we shipped a checkout bug → the standard guard is edge-case tests + staged rollout / monitoring on critical paths → ⚠️ state which guard you actually added so the recovery is concrete, not aspirational.
**Strengthen before the room:** Replace "I helped fix it" with the specific thing *you* did. Get the failed-order count and duration. Make the "A" land on a concrete process change, not just a resolve.

---

## Story 3 — Raising the team's testing bar + onboarding
**Covers archetypes:** leadership/direction · collaboration · quality
**Best for questions:** "a time you led / drove change" · "improving reliability or process" · "mentoring"

- **S:** At Cedar & Pine (and continuing at Lattice), team testing practices were inconsistent and new engineers needed ramp-up.
- **T:** I worked to improve the team's testing practices and to onboard new engineers.
- **A:** I (1) wrote tests and improved the testing practices on my team; (2) onboarded new engineers; (3) ⚠️ confirm the specific mechanism — did you add CI checks, write a testing guide, pair on tests? Name it.
- **R:** ⚠️ **needs a number** — "more of the team started writing tests," but no coverage before→after or adoption count ("I don't have a number for that"). MUST gather: test count / coverage % before→after, or number of engineers onboarded.
- **L:** Culture change sticks better when you make the good path easy (tooling, examples) than when you mandate it.

**The meta-move:** I drove testing adoption → the textbook move is enforce coverage gates in CI → I (⚠️ confirm) chose adoption-by-example over a hard gate because <reason — confirm the real reason>.
**Strengthen before the room:** This is the leadership story — make it land on a decision, not just activity. Get a number for adoption or coverage, or name how many engineers you onboarded.

---

## Story 4 — Migrating the legacy service
**Covers archetypes:** ambiguous bet / trade-off · backend judgment
**Best for questions:** "a hard technical decision" · "modernizing / backend work" · "risky bet you owned"

- **S:** At Cedar & Pine, an important legacy service needed maintenance while being modernized.
- **T:** I maintained the legacy service and migrated parts of it to a newer framework.
- **A:** I (1) kept the legacy service running; (2) migrated parts of it to a newer framework incrementally; (3) ⚠️ confirm what you decided to migrate first and why (the trade-off — risk vs. value).
- **R:** ⚠️ **needs a number** — migration scope unstated. MUST gather: how much was migrated (services/endpoints/LoC), and any reliability or maintainability change.
- **L:** Incremental migration beats a big-bang rewrite when a service is load-bearing — you de-risk by moving the highest-value, lowest-risk pieces first.

**The meta-move:** I migrated a legacy service piece-by-piece → the standard options are strangler-fig incremental vs. big-bang rewrite → ⚠️ confirm you chose incremental and articulate why for this service.
**Strengthen before the room:** This is the best *backend depth* surface — prep it hard since the JD is backend-leaning. Be able to sketch old vs. new architecture. Get a scope number.

---

## Story 5 — Internal tools for the operations team
**Covers archetypes:** collaboration / cross-functional · product sense
**Best for questions:** "collaborating with product/stakeholders" · "a project that helped the business" · "building from a vague need"

- **S:** At Cedar & Pine, the operations team's manual workflows were slowing them down.
- **T:** I built internal tools to help the operations team work more efficiently.
- **A:** I (1) worked with the ops team to understand their workflow pain; (2) built internal tools to streamline it; (3) ⚠️ confirm how you validated the tools actually helped (did you measure or just ship?).
- **R:** ⚠️ **needs a number** — "more efficiently" with no efficiency metric. MUST gather: time saved per task, tasks automated, or ops-team throughput before→after.
- **L:** The best internal-tool work starts from sitting with the users whose time you're trying to save, not from a ticket.

**The meta-move:** I built ops tooling → the standard is gather requirements → ship → measure adoption/time saved → ⚠️ confirm whether you closed that loop with a measurement.
**Strengthen before the room:** Good collaboration story; weak on impact. Get a time-saved or adoption number. Frame the idea→build→validate arc to match Foundry's "idea through launch" line.

---

## Coverage check
| Archetype | Covered by |
|---|---|
| Judgment under ambiguity | Story 1, Story 5 |
| Disagreeing up / pushback | ⚠️ **NOT COVERED** — no example in the persona's materials. Open question for the candidate: any time you pushed back on a PM/lead with data? Don't invent one. |
| Failure with recovery | Story 2 ⭐ |
| Leadership / direction | Story 3 |
| Conflict / collaboration | Story 5, Story 3 |
| Ambiguous bet / trade-off | Story 4 |

## Open questions before rehearsal
- **Every story needs its real number** — see the ⚠️ flags. This is the dominant gap for this candidate.
- **No "disagreeing up" story exists** in the materials. Surface a real one with the candidate or accept the gap honestly; do not fabricate.
- Several "A" sections need the candidate to replace "helped" with the specific thing *they* did (force the "I").

## Next: grading
Run the **`coach`** subagent on Story 1 ⭐ and Story 2 ⭐ once real numbers are added. As written, coach will (correctly) fail every story on "quantified result" — that failure is accurate, not a bug: the numbers must be gathered, not invented.

# STAR Story Bank — Elena Vasquez (target: Aurora EM, Developer Platform)

> Built from the persona's "## Intake answers". Every number traces to the résumé/intake. No fabrication.
> Practice each aloud, timed to 90s.

## JD → story map
| JD requirement / likely question | Primary story | Backup |
|---|---|---|
| "Set and uphold technical direction with your senior engineers" / "led a team / drove a project" | Story 1 ⭐ | Story 5 |
| "Partner with peer managers... aligning stakeholders" / "disagreed with leadership / said no" | Story 2 ⭐ | Story 1 |
| "Foster a healthy, inclusive team culture" / "a teammate conflict you resolved" | Story 3 | Story 1 |
| "Coaching, career development" / "a time you developed someone" | Story 3 | Story 1 (mentees promoted) |
| "Run a fair performance and feedback process" / "a failure / a time you were wrong" | Story 4 ⭐ | Story 3 |
| "Track record of delivering through a team" / "drove a project to delivery" | Story 5 | Story 1 |
| Management philosophy / "why move into management now" | Story 4 + Story 1 | Story 2 |

---

## Story 1 — Aligning six engineers on the platform rewrite   ⭐
**Covers archetypes:** Leadership / direction · Judgment under ambiguity · Conflict/collaboration
**Best for questions:** "led a team / set technical direction," "decision with disagreement," "drove a project"

- **S:** At Halcyon Cloud, as acting tech lead of the ~6-engineer developer-platform team, I owned a CI/CD platform rewrite that every product team depended on.
- **T:** My charge was to set the technical direction and get six engineers with different, strongly-held opinions aligned on one approach.
- **A:** I ran a design spike week instead of picking the architecture top-down. Then I let everyone prototype their preferred direction. Then we converged and picked one direction together from the evidence.
- **R:** Median build time dropped from 18 min to 6 min across 200+ services, and because the team chose the direction, ownership stayed distributed rather than landing on me.
- **L:** On a load-bearing system, durable alignment beats a faster top-down call — let the team earn the decision.

**The meta-move:** I ran a spike week and let the team converge → the standard move is for the lead to pick the architecture and assign it → I chose shared convergence because lasting alignment on a load-bearing platform was worth the extra week.
**Strengthen before the room:** tighten to 90s; be ready to say what the competing approaches were and why one won.

---

## Story 2 — Disagreeing up to protect the platform team   ⭐
**Covers archetypes:** Disagreeing up / pushback · Ambiguous bet / trade-off · Leadership
**Best for questions:** "disagreed with leadership / said no," "aligned stakeholders," "made a hard call upward"

- **S:** My skip-level wanted to cut the platform team's headcount to staff a product push.
- **T:** I had to make the case for the team without just defending turf — and offer a workable alternative.
- **A:** I brought the incident data showing the platform was load-bearing for every product team. I argued a permanent cut would slow all of them down. Then I proposed lending two engineers temporarily instead of a permanent cut.
- **R:** Leadership took the proposal — we lent two engineers temporarily rather than cutting the team, keeping the platform's reliability commitments intact. ⚠️ needs a number (no quantified outcome for the lend-vs-cut decision in the persona — use the incident-program ~40% figure as supporting context only).
- **L:** Disagreeing up works when you argue with data and bring an option, not just an objection.

**The meta-move:** I countered a headcount cut with data + a temporary-lend alternative → the textbook move is to escalate or comply → I chose a third option that met the product push and protected the platform.
**Strengthen before the room:** confirm whether there's any metric on the outcome (delivery preserved? incidents avoided?); if not, keep it qualitative and honest.

---

## Story 3 — Breaking an engineer standoff and coaching the junior
**Covers archetypes:** Conflict / collaboration · Leadership / coaching · Career development
**Best for questions:** "a teammate conflict you resolved," "developed/coached someone," "healthy team culture"

- **S:** Two of my engineers were in a standoff over an API design that was stalling the project.
- **T:** I needed to unblock the design and address the working-relationship problem underneath it.
- **A:** I sat them down and made each argue the other's position. Through that we found a design neither had seen. Then I coached the more junior engineer afterward on disagreeing without digging in.
- **R:** The standoff resolved with a better third design, and the project unblocked. ⚠️ needs a number (no quantified time-saved/delay figure in the persona).
- **L:** Conflict is usually a signal, not noise — force perspective-taking and you often surface the better answer.

**The meta-move:** I had each argue the other's side → the standard move is for the lead to just pick a winner → I chose forced perspective-taking so the team owned the outcome and the junior grew.
**Strengthen before the room:** add any concrete detail on what the third design was; estimate (honestly, hedged) how long it had been stalled if asked.

---

## Story 4 — Holding on too long: the delegation failure   ⭐
**Covers archetypes:** Failure with recovery · Leadership / direction · Self-awareness (management philosophy)
**Best for questions:** "a failure / a time you were wrong," "why management now," "a time you grew as a leader"

- **S:** At Halcyon I held onto a piece of the system myself instead of delegating it.
- **T:** As the lead I was supposed to be distributing ownership, not concentrating it.
- **A:** I kept the component too long, which made it a bus-factor-of-one risk. When I finally handed it off, the transfer was rough. I worked through a painful month-long handoff to fully transfer it.
- **R:** The handoff took a painful month — a cost I created by waiting too long; afterward the component had real shared ownership. ⚠️ needs a number (only "a painful month" is given; no further metric).
- **L:** Delegating is part of leading, not a nice-to-have — concentrating ownership is a leadership failure, not diligence.

**The meta-move:** I eventually forced a full handoff → the easy move is to keep owning the thing you're best at → I chose the painful transfer because bus-factor-of-one is a leadership risk I created.
**Strengthen before the room:** this doubles as the "why management" answer — connect the lesson to wanting the formal role; keep it to 90s and don't over-apologize.

---

## Story 5 — Driving the reliability program
**Covers archetypes:** Leadership / direction · Delivering through a team · Ambiguous bet / trade-off
**Best for questions:** "drove a program," "reliability/developer-productivity," "delivered through a team"

- **S:** Halcyon's platform was causing incidents that hit every product team.
- **T:** I drove the reliability program and ran incident retrospectives for the platform team.
- **A:** I led blameless incident retrospectives. I drove the resulting systemic fixes through the team rather than hot-patching. I set the reliability program's direction alongside the roadmap.
- **R:** Platform-caused incidents dropped ~40%.
- **L:** Reliability is a team program and a culture, not a one-person firefight — blameless retros turn incidents into systemic fixes.

**The meta-move:** I ran the program on blameless retros → the standard move is more alerting/SLOs → I anchored on retrospectives so fixes were systemic, not blame-driven.
**Strengthen before the room:** tighten to 90s; be ready to name a specific systemic fix that came out of a retro.

---

## Coverage check
- Leadership/direction: Stories 1, 4, 5
- Disagreeing up: Story 2
- Failure-with-recovery: Story 4
- Conflict/coaching/career development: Story 3 (and mentees-promoted detail in Profile)
- Delivering through a team / stakeholder alignment: Stories 1, 2, 5
- Management philosophy / "why now": Story 4 (+ honest gap framing in fit.md)

## Open questions / weak spots to firm up
- Stories 2, 3, 4 lack a hard outcome number — keep them honest/qualitative unless the user supplies one. Story 4 has "a painful month"; Stories 1 and 5 are the quantified anchors (18→6 min; ~40% incidents).
- Consider a 6th story specifically on growing someone to promotion (2 mentees promoted to senior) if the values/career-development round digs there — currently folded into Profile rather than a standalone STAR.

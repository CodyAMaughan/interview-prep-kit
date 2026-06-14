# STAR Story Bank — Priya Nair (for Meridian Pay, Senior Backend Engineer)

## JD → story map
| JD requirement / likely question | Primary story | Backup |
|---|---|---|
| "Set technical direction — write design docs, review designs" / "tell me about leading a project" | Story 1 ⭐ | Story 5 |
| "Own data integrity: idempotency, reconciliation, exactly-once under failure and retry" / "a failure / time you were wrong" | Story 2 ⭐ | Story 1 |
| "Disagreed with leadership / said no" | Story 3 | Story 1 |
| "A risky architectural bet / hard trade-off" | Story 4 | Story 1 |
| "Carry the reliability of what you own: alerting, on-call, runbooks, incident response" | Story 5 | Story 2 |
| "Mentor other engineers" / values & leadership conversation | Story 6 | Story 1 |
| "High-throughput, low-latency services with correctness guarantees" / deep-dive on past work | Story 1 ⭐ | Story 2 |

---

## Story 1 — The ledger redesign & per-service DB migration   ⭐
**Covers archetypes:** Leadership / direction · Ambiguous bet / trade-off · Disagreeing up
**Best for questions:** "led a project / set technical direction", "high-throughput low-latency design", "deep-dive on past work"

- **S:** At Cascade Pay I own the double-entry ledger that records ~9M transactions/day; lock contention on a shared Postgres instance was causing latency and recurring Sev2s.
- **T:** I owned the redesign call and had to win buy-in for moving off the shared instance, against people who wanted to keep it for simplicity.
- **A:** I wrote a one-page design doc and ran a load test that showed the lock contention concretely. Then I got buy-in from the two staff engineers with that data. Then I migrated incrementally behind a feature flag over 6 weeks.
- **R:** p99 write latency dropped from 410ms to 95ms, and lock-contention Sev2s went from ~6/quarter to 0 for the last 3 quarters.
- **L:** Win an architectural argument with a load test, not an opinion — and de-risk a big migration by shipping it behind a flag.

**The meta-move:** I moved to per-service databases → the simple textbook path is one shared Postgres instance → I chose per-service DBs to kill lock contention, accepting more operational surface, for 410→95ms p99 and zero lock Sev2s.
**Strengthen before the room:** tighten to 90s; be ready to whiteboard the per-service DB topology and the migration plan in 60s.

---

## Story 2 — The double-charge incident & idempotency rebuild   ⭐
**Covers archetypes:** Failure with recovery · Judgment under ambiguity
**Best for questions:** "a failure / a time you were wrong", "idempotency / exactly-once under retry", "an incident you owned"

- **S:** Early in the idempotency work at Cascade Pay, my key scheme collided under a retry storm during a Black-Friday-style spike.
- **T:** It was my design, so owning both the live incident and the durable fix was on me.
- **A:** I owned the rollback as the alert fired (~300 customers double-charged for about 20 minutes) and refunded them same-day. Then I rebuilt the idempotency key to include the source-event UUID so retries couldn't collide. Then I added the reconciliation layer to catch anything that slipped through.
- **R:** Double-charge defects went from ~120/month to under 5/month.
- **L:** Design for the retry storm, not the happy path — the failure mode you don't test is the one that pages you.

**The meta-move:** I keyed idempotency on the source-event UUID + reconciliation → the naive approach trusts client-supplied/request IDs and the happy path → I designed for the retry storm after one collided, taking double-charges 120/mo → <5/mo.
**Strengthen before the room:** practice owning the failure without over-apologizing — lead with the fix and the number.

---

## Story 3 — Disagreeing up on the reconciliation layer
**Covers archetypes:** Disagreeing up / pushback · Judgment under ambiguity
**Best for questions:** "disagreed with leadership / said no", "pushed back on a deadline", "data over authority"

- **S:** A director at Cascade Pay wanted to hit a launch date by skipping the reconciliation layer.
- **T:** I had to push back on a senior leader's date with evidence, not just instinct.
- **A:** I disagreed and pulled the numbers on the defect rate we'd ship with. Then I proposed a concrete two-week slip to add reconciliation. Then I framed the choice as "we either pay two weeks now or pay it in refunds and lost trust later."
- **R:** They agreed to the two-week slip; reconciliation shipped (and is part of the system that holds double-charges under 5/month).
- **L:** Disagree up by reframing the trade-off in the leader's currency — cost and trust — not in engineering preference.

**The meta-move:** I traded two weeks of schedule for correctness → the default is to protect the launch date → I chose the slip because the refund-and-trust cost dominated, and made that cost legible with numbers.
**Strengthen before the room:** keep it ~75s; the punchline is the reframe, not the conflict.

---

## Story 4 — Trie vs. regex router bet
**Covers archetypes:** Ambiguous bet / trade-off
**Best for questions:** "a risky technical bet", "a hard trade-off you made", "optimizing a hot path"

- **S:** At Brightwater the API gateway's CPU cost was dominated by its regex-based router.
- **T:** I had to decide whether to take on a riskier, larger rewrite to cut that cost.
- **A:** I identified that the regex router was the gateway's top CPU cost line. Then I chose to build a trie-based matcher even though it was more code. Then I shipped it as the replacement router.
- **R:** Gateway CPU cost dropped ~35%.
- **L:** Spend complexity where the cost actually is — the more-code option wins when it targets the dominant cost line.

**The meta-move:** I replaced regex routing with a trie matcher → regex routing is the easy default → I chose the trie (more code) because regex was the top CPU line, for ~35% CPU reduction.
**Strengthen before the room:** be ready to sketch the trie matcher and why it beats regex on CPU.

---

## Story 5 — On-call leadership & runbooks
**Covers archetypes:** Leadership / direction · Failure with recovery (operational)
**Best for questions:** "carrying reliability / on-call / incident response", "improved a process", "led without authority"

- **S:** At Brightwater, incident response leaned on tribal knowledge and resolution was slow.
- **T:** As on-call lead I owned making incidents faster to resolve across the team.
- **A:** I took on the on-call lead role. Then I wrote the incident runbooks that standardized response. Then I drove the team to use them during incidents.
- **R:** Mean-time-to-resolve dropped from ~90 min to ~25 min.
- **L:** Reliability is a process you can engineer — turning tribal knowledge into runbooks is leverage, not paperwork.

**The meta-move:** I standardized incident response with runbooks → the default is to rely on whoever knows the system → I chose to codify it, cutting MTTR 90 → 25 min.
**Strengthen before the room:** connect directly to the JD's "alerting, on-call, runbooks, incident response" line.

---

## Story 6 — Mentoring & the design-review rotation
**Covers archetypes:** Leadership / direction · Conflict / collaboration
**Best for questions:** "mentor other engineers", "raised the bar on a team", values/leadership conversation

- **S:** As senior on the payments group at Cascade Pay, design quality and review consistency needed an owner.
- **T:** I took on mentoring engineers and running the design-review process for the group.
- **A:** I mentored 4 engineers directly. Then I set up and ran the design-review rotation for the payments group. Then I used the rotation to spread the design-doc-plus-load-test standard I'd used on the ledger redesign.
- **R:** ⚠️ needs a number — no quantified outcome in the persona (e.g., promotions, faster ramp, review throughput). Confirm a concrete result with the candidate or keep this qualitative.
- **L:** Scale yourself by turning your own best practice into the team's default process.

**The meta-move:** I institutionalized design review for the group → the default is ad-hoc review by whoever's free → I chose a rotation so review quality didn't depend on me being in the room.
**Strengthen before the room:** ⚠️ get a concrete outcome before relying on this in the values/leadership round; until then, lead with Story 1 for leadership signal.

---

## Open questions (surface, don't guess)
- Story 6 (mentorship) has no number — needs a concrete outcome before it's a strong leadership answer.
- Orchard Labs billing-webhook work (retry + dead-letter) has no metric — only build a story on it if a before/after number exists.
- Confirm which language is interview-ready for live coding so the deep-dive stories match the coding round.

## Rehearsal + grading
Practice each story aloud, timed to 90 seconds — spoken prep beats silent reading. Run the **coach** subagent on at least the two ⭐ headliners (Story 1, Story 2) to grade: specific decision present? quantified result? "I" not "we"? lesson stated? under 90s? Coach is eval-first and will flag the weak mentorship story (Story 6) rather than pass it.

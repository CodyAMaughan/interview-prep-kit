# Prep Plan — Meridian Pay

## Constraints
- Days until interview: 10
- Rounds: recruiter screen (30 min, non-technical) → technical screen (60 min: coding + systems/data-modeling) → onsite (system design + deep-dive on past work + values/leadership)

## Priority queue (do in this order)
| # | Action | Skill to run | Maps to | Must-do? |
|---|---|---|---|---|
| 1 | Build 5–7 STAR stories (ledger redesign / direction, double-charge failure+recovery, disagreeing-up on reconciliation, trie-vs-regex bet, on-call/runbooks, mentorship) | build-stories | recruiter screen + onsite deep-dive + values/leadership | ✅ |
| 2 | Company brief + interviewer playbooks + JD reverse-mapping for "why Meridian" | research-prep | all rounds, esp. recruiter screen | ✅ |
| 3 | System-design track: whiteboard a ledger / money-movement / idempotent-API system end to end | build-curriculum | onsite system design | ✅ |
| 4 | Distributed-systems theory refresh: partitioning, replication, consistency/consensus trade-offs | build-curriculum | technical screen systems discussion + onsite | ✅ |
| 5 | Live-coding warm-up in chosen language (data structures + a data-modeling problem) | drill | technical screen coding | ✅ |
| 6 | Timed mock technical screen (coding + systems), graded by coach | mock-interview | technical screen | ⬜ high-ROI |
| 7 | Morning-of glance sheet: 90s pitch, 2 facts, top stories, 3 questions, namedrop lines | cheatsheets | all rounds | ⬜ high-ROI |

## Day-by-day cadence
- **Day 1:** build-stories — draft all 5–7 STAR stories from the intake answers; lock the ledger redesign and double-charge failure as the two ⭐ headliners.
- **Day 2:** research-prep — Meridian Pay brief + "why this company" angle (payments correctness) + JD reverse-map; rehearse the recruiter-screen pitch since the screen is non-technical and could be first.
- **Day 3:** System-design track (cheatsheet + design a payments ledger end to end on paper); tie each component back to real Cascade Pay work.
- **Day 4:** Distributed-systems theory refresh (partitioning, replication, consistency, consensus basics, idempotency/exactly-once); write the trade-off talking points.
- **Day 5:** Live-coding drills in the chosen language; include one data-modeling-for-correctness problem (ledger schema, idempotency keys).
- **Day 6:** Rehearse all stories aloud, timed to 90s; grade the two ⭐ stories with coach; tighten the mentorship story (needs a concrete outcome).
- **Day 7:** Mock technical screen (timed coding + systems), graded by coach; fix the gaps it surfaces.
- **Day 8:** Mock system-design / past-work deep-dive; rehearse the meta-move (what I did → standard approach → trade-off) for each strong JD line.
- **Day 9:** Light review — re-grade weak spots from spaced repetition; rehearse "why Meridian" and the values/leadership answers.
- **Day 10 / Morning-of:** glance sheet — 90s pitch, 2 facts about Meridian, 3 questions to ask, 3 namedrop lines. No new material.

## "Done" looks like
- Defend every strong JD line cold with the meta-move: ledger latency (410→95ms), correctness (double-charges 120/mo → <5), reliability (Sev2s → 0, MTTR 90→25), platform (30+ services).
- Whiteboard a payments ledger / money-movement system in ~45 min — partitioning, replication, idempotency, reconciliation, exactly-once under retry — without notes.
- Recall partitioning/replication/consistency/consensus trade-offs cold and connect each to a real decision you made.
- Deliver each STAR story in ≤90s, "I" not "we", landing on a number and a one-line lesson.
- Solve a medium live-coding + data-modeling problem under time in your chosen language.
- State "why Meridian Pay" in their own language (payments correctness, money movement, platform other teams build on) — and have the mentorship/leadership answer carry a concrete outcome, not just "I mentored 4 engineers."

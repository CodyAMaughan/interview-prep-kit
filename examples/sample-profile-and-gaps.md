# Sample generated artifact — Profile + Fit/Gaps (FAKE example)

> This is the kind of file `prep-intake` would write into a real user's **gitignored** `workspace/`,
> built from their inputs. Here it's generated from the fake `sample-candidate.md` + `sample-jd.md`.
> Fictional throughout.

---

# Candidate Profile — Jordan Rivera

## Headline
Backend/data engineer, 6 years, who turns fragile pipelines into reliable streaming infrastructure —
strongest signal: a batch→streaming migration that cut tracking latency ~40×.

## Evidence inventory
| Experience / project | Scope & scale | Tech / methods | Quantified impact |
|---|---|---|---|
| Shipment-events pipeline (Northwind) | ~12M events/day, 4 downstream teams | Kafka, stateful consumer, Postgres | latency 20 min → <30 sec |
| On-call/alerting overhaul | team-wide | runbooks, alerting | pages ~10/wk → ~2/wk |
| Inventory-sync + reconciliation (Brightline) | warehouse↔storefront | Python, SQL | ~$80k/yr averted refunds |
| Mentoring | 2 junior engineers | — | (qualitative) |

## Strengths (defensible cold)
- Streaming + stateful processing — backed by the Northwind migration (a real, quantified win).
- Reliability ownership — alerting/runbooks/on-call, with a before→after number.
- Pragmatic system design + data modeling — internal metrics service used by 4 teams.

## Themes / through-line
"I make data infrastructure boring and reliable, and I build things other teams depend on." Maps
directly onto Lumen's *self-serve platform primitives* ask.

## Open questions to confirm with the user
- Any Kubernetes exposure at all, even side projects? (résumé says ECS only.)
- Depth on distributed-systems theory — can you explain partitioning/replication trade-offs cold?
- Is there a leadership/direction story beyond the 3-engineer migration?

---

# Fit — Lumen Robotics / Senior Platform Engineer

## JD reverse-map (their words → your evidence)
| JD requirement | Matching evidence | Match strength |
|---|---|---|
| "high-throughput streaming pipelines (millions/min)" | Northwind 12M/day Kafka migration | **strong** |
| "stateful processing" | stateful consumer in the migration | strong |
| "owning reliability: alerting, on-call, runbooks" | pages 10→2/wk overhaul | **strong** |
| "self-serve platform primitives for other teams" | internal metrics service (4 teams) | partial |
| "distributed systems — partitioning, replication, consistency" | implicit from Kafka work, not formalized | **GAP** |
| "Kubernetes in production" | ECS only | **GAP** |
| "set technical direction beyond your own work" | led 3-eng migration; mentored 2 | partial |

## The meta-move (per strong line)
- Streaming: *"I migrated a 12M/day batch ETL to a stateful Kafka consumer (20 min → 30 sec) → the
  textbook approach is exactly-once via a stream processor → I chose at-least-once + idempotent writes
  because our downstream was naturally idempotent and it halved the operational complexity."*

## GAP map (drives the plan)
| Gap | Why it matters for THIS role | Cost to close | Priority |
|---|---|---|---|
| Distributed-systems vocabulary (partitioning/replication/consistency) | explicit "required" line; will be probed in design rounds | medium | 🔴 |
| Kubernetes | "nice to have" but listed in "what you'll do"; likely surfaces | medium | 🟠 |
| Platform/self-serve abstraction narrative | a JD headline; you have a partial story to sharpen | low | 🟠 |
| Leadership/direction story | onsite has a leadership conversation | low | 🟡 |

## Honest framing
Mostly **resurfacing + vocabulary**, not learning from scratch: Jordan has *done* partitioning and
replication in anger (Kafka), just hasn't named the theory. The one genuine new-skill gap is Kubernetes
(ECS experience transfers but isn't the same). Say it plainly: "I've operated partitioned, replicated
streaming systems in production — I'm sharpening the formal vocabulary and getting hands-on with K8s
specifically."

---

# Prep Plan — Lumen Robotics

## Constraints
- Days until interview: 7   - Rounds: recruiter screen → technical screen (coding + streaming design) → onsite (system design + deep-dive + leadership)

## Priority queue
| # | Action | Skill | Maps to | Must-do? |
|---|---|---|---|---|
| 1 | Build 5 STAR stories (lead with the migration ⭐) | build-stories | screen + onsite deep-dive/leadership | ✅ |
| 2 | Close distributed-systems gap | build-curriculum (system-design + a DS cheatsheet) | technical + onsite design | ✅ |
| 3 | Kubernetes crash track | build-curriculum | technical + onsite | ✅ |
| 4 | Company brief + interviewer playbooks | research-prep | all rounds | ✅ |
| 5 | Timed streaming-design mock | mock-interview | technical screen | ⬜ high-ROI |
| 6 | Morning-of glance sheet + namedrop lines | cheatsheets | each round | ⬜ |

## Day-by-day
- **Day 1:** Stories (the migration story to 90s, plus reliability + a leadership story).
- **Day 2:** Distributed-systems track — cheatsheet → closed-book quiz → small project.
- **Day 3:** Kubernetes track.
- **Day 4:** Research brief + interviewer playbooks; lock "why Lumen".
- **Day 5:** Timed mock streaming-design screen, graded by `coach`.
- **Day 6:** Drill weak spots; tighten stories.
- **Day 7 / morning-of:** glance sheet — pitch, 2 facts, 3 questions.

## "Done" looks like
Defend each strong JD line with a number; explain partitioning/replication/consistency trade-offs cold;
whiteboard a streaming platform for millions/min; deliver the migration story in 90s; say "why Lumen"
in their own platform-team language; and have an honest, non-hand-wavy answer for the K8s gap.

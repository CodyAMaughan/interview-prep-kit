# Fit — Meridian Pay / Senior Backend Engineer, Payments Platform

## JD reverse-map (their words → your evidence)
| JD requirement (quote it) | Your matching evidence | Match strength |
|---|---|---|
| "Design, build, and operate high-throughput, low-latency backend services for money movement and ledgering" | Own the double-entry ledger at ~9M tx/day; redesign cut p99 write latency 410ms → 95ms | strong |
| "with strong correctness and reliability guarantees" | Idempotency + reconciliation layer drove double-charge defects ~120/mo → <5/mo; lock Sev2s ~6/quarter → 0 | strong |
| "Own data integrity: idempotency, reconciliation, and exactly-once semantics under failure and retry" | Built the idempotency + reconciliation layer; rebuilt key scheme to include source-event UUID after a retry-storm double-charge incident | strong |
| "Set technical direction — write design docs, review designs, and mentor other engineers" | Wrote one-page design doc + load test to win buy-in for per-service DB migration; runs the design-review rotation; mentored 4 engineers | strong |
| "Carry the reliability of what you own: alerting, on-call, runbooks, incident response" | On-call lead at Brightwater; wrote incident runbooks that cut MTTR ~90 → ~25 min; owned rollback/refund during the double-charge incident | strong |
| "5+ years building backend services in production" | 8 years across three companies | strong |
| "Deep experience with relational databases (Postgres/MySQL) and data-modeling for correctness" | Heavy Postgres; double-entry ledger data model; per-service DB migration | strong |
| "Strong distributed-systems fundamentals: partitioning, replication, consistency trade-offs, idempotency" | Stated fundamentals (partitioning, replication, consensus basics, consistency trade-offs); idempotency work in production | strong (idempotency proven; partitioning/replication/consensus mostly stated — see GAP map) |
| "Fluent in one of Go / Java / Python" | Go, Java, Python all listed; shipped Go (rate-limiter, gateway) | strong |
| "A track record of owning reliability for a production service" | Owns the ledger service; lock Sev2s → 0; MTTR 90 → 25 min | strong |
| "(Nice) Payments, ledgering, or other correctness-critical financial systems experience" | Entire last 4 years: payments ledger, idempotency, reconciliation | strong |
| "(Nice) Kubernetes in production; infrastructure as code" | Kubernetes 3 yrs in prod; Terraform listed | strong (confirm depth) |
| "(Nice) Experience building platform/API abstractions used by other teams" | Rate-limiting/quota service used by 30+ internal services; API platform other teams build on | strong |

## The meta-move (per strong line)
For each strong match, be ready to say: **what I did → the standard approach → the trade-off I chose.**

- **Ledger latency:** I redesigned the ledger and moved to per-service databases → the simple textbook path is to keep one shared Postgres instance → I chose per-service DBs to kill lock contention, accepting more operational surface, and got p99 410 → 95ms with zero lock Sev2s.
- **Idempotency / exactly-once:** I built idempotency keyed on the source-event UUID + a reconciliation layer → the naive approach keys on request/client-supplied IDs and trusts the happy path → I designed for the retry storm after one collided and double-charged ~300 customers, taking double-charges 120/mo → <5/mo.
- **Gateway routing:** I replaced the regex router with a trie matcher → regex routing is the easy default → I chose the trie (more code) because regex was the gateway's top CPU cost line, for ~35% CPU reduction.
- **Reliability ownership:** I wrote the incident runbooks and led on-call → the default is tribal knowledge → I standardized runbooks, cutting MTTR 90 → 25 min.

## GAP map (this drives the plan)
| Gap | Why it matters for THIS role | Cost to close | Priority |
|---|---|---|---|
| System-design fluency for the onsite (whiteboard a payments/ledger/money-movement system end to end in ~45 min, drawing on own work) | JD onsite explicitly includes "system design"; the role owns ledger + money movement + APIs | med | 🔴 |
| Partitioning / replication / consensus depth (résumé says "consensus basics" / "consistency trade-offs" — mostly stated, less proven than idempotency) | JD requires "strong distributed-systems fundamentals: partitioning, replication, consistency trade-offs"; likely probed in the systems discussion | med | 🟠 |
| Live coding readiness in a chosen language | JD technical screen is "coding + a systems/data-modeling discussion"; need one language sharp under time | low | 🟠 |
| Mentorship/leadership story with a quantified or concrete outcome | JD wants "set technical direction... mentor other engineers" and an onsite values/leadership conversation; mentorship has no number yet | low | 🟡 |

## Honest framing
This is overwhelmingly a **resurfacing-and-sharpening** profile, not learning-from-scratch. Every Required line is a strong match backed by real numbers, and the candidate's last four years are squarely payments + platform — the exact surface area of the role. The genuine prep is not closing knowledge gaps; it's **packaging**: rehearsing the system-design narrative so the daily ledger work translates to a clean whiteboard, refreshing the distributed-systems theory that backs the practical wins, and getting one language sharp for live coding. The candidate can honestly say in the room: "This role is what I do now — I'm here to show how I'd do it for Meridian's scale."

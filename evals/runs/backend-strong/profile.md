# Candidate Profile

## Headline
Senior backend engineer, 8 years, focused on high-throughput payments infrastructure — strongest signal is owning a double-entry ledger at ~9M transactions/day with measurable latency, reliability, and correctness wins.

## Evidence inventory (the raw material for everything downstream)
| Experience / project | Scope & scale | Tech / methods | Quantified impact |
|---|---|---|---|
| Ledger service ownership (Cascade Pay, 2021–present) | Double-entry ledger recording ~9M transactions/day | Distributed systems, Postgres | p99 write latency 410ms → 95ms via redesign |
| Per-service DB migration (Cascade Pay) | Moved off a shared Postgres instance to per-service databases | Postgres, incremental migration behind a flag (6 weeks) | Lock-contention Sev2s ~6/quarter → 0 for last 3 quarters |
| Idempotency + reconciliation layer (Cascade Pay) | Payments correctness under retry/failure | Idempotency keys (source-event UUID), reconciliation | Double-charge defects ~120/month → under 5/month |
| Mentorship + design-review rotation (Cascade Pay) | Mentored 4 engineers; runs design-review rotation for payments group | Design docs, review process | ⚠️ needs a number (impact not quantified) |
| Rate-limiting / quota service (Brightwater, 2018–2021) | Used by 30+ internal services | Go + Redis | Serves 30+ internal services |
| API gateway router optimization (Brightwater) | Gateway routing hot path | Trie-based matcher replacing regex router | Gateway CPU cost ~35% reduction |
| On-call lead + incident runbooks (Brightwater) | On-call leadership for the team | Runbooks, incident process | MTTR ~90 min → ~25 min |
| Billing webhook pipeline (Orchard Labs, 2016–2018) | Billing webhooks | Retry + dead-letter handling | ⚠️ needs a number (impact not quantified) |

## Strengths (claims you can defend cold)
- Correctness-critical payments systems — backed by the ledger, idempotency, and reconciliation work at Cascade Pay (double-charges 120/mo → <5/mo).
- High-throughput, low-latency service design — backed by the ledger redesign (p99 410ms → 95ms at ~9M tx/day).
- Distributed-systems fundamentals (partitioning, replication, consistency trade-offs) — backed by per-service DB migration and stated skills.
- Owning reliability of a production service — backed by lock-Sev2s → 0 and on-call leadership / runbooks (MTTR 90 → 25 min).
- Setting technical direction with buy-in — backed by the ledger redesign design doc + load test that won over two staff engineers.
- Languages: Go, Java, Python; SQL (heavy Postgres) — backed by skills list and shipped work in Go/Postgres.

## Themes / through-line
The career tells a tightening focus on payments and platform correctness: from billing webhooks → internal platform services (rate-limiting, gateway) → owning the core ledger and money-movement correctness. The through-line is "make money movement correct and fast at scale, and own its reliability" — exactly the surface area of the Meridian Pay role.

## Open questions / things to confirm with the user
- Mentorship: 4 engineers mentored is stated, but there is no quantified outcome — confirm any measurable result (promotions, ramp time) or leave as a qualitative leadership point.
- Orchard Labs billing webhook pipeline: no metric attached — confirm any before/after numbers if a story leans on it.
- Languages: résumé lists Go, Java, Python; which language(s) are interview-ready for live coding in the technical screen?
- Kubernetes: "3 yrs in prod" listed — confirm depth for the system-design round (nice-to-have on the JD).

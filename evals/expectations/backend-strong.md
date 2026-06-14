# Expectations — `backend-strong` (Priya Nair → Meridian Pay Senior Backend)

> TDD assertions authored BEFORE any run. The judge checks the generated artifacts against these.
> This is a strong-match case: the main risk is the tool inventing gaps that don't exist, or being
> generically positive instead of specific.

## Difficulty / what this case tests
Strong match. Tests whether the tool finds the real strong matches, builds crisp meta-moves, keeps the
GAP map honest-and-small, and produces number-rich stories. Anti-trap: do NOT over-flag gaps.

## profile.md — expected
- Headline names ~8 yrs + backend/payments + the strongest signal (ledger / correctness at scale).
- Evidence inventory captures the load-bearing numbers: 9M txns/day, p99 410→95ms, double-charges
  120→<5/mo, 6→0 Sev2s, gateway CPU −35%, MTTR 90→25 min.
- Strengths are backed by specific experiences (no free-floating adjectives).
- Open questions are minor (this résumé is rich); should NOT manufacture missing-info where it exists.

## fit-*.md — JD-line → expected match strength
| JD line | Expected | Why |
|---|---|---|
| "5+ years building backend services in production" | **strong** | 8 yrs, three roles |
| "relational databases (Postgres/MySQL) and data-modeling for correctness" | **strong** | ledger, Postgres-heavy |
| "distributed-systems fundamentals: partitioning, replication, consistency trade-offs, idempotency" | **strong** | explicit on résumé + idempotency story |
| "idempotency, reconciliation, and exactly-once semantics under failure and retry" | **strong** | built exactly this |
| "Kubernetes in production" (nice-to-have) | **strong/partial** | 3 yrs K8s in prod — should read strong |
| "payments / ledgering" (nice-to-have) | **strong** | current job |

## GAP map — expected
- Should be SHORT. Legitimate small gaps if any: none major. Acceptable: a stretch like "exactly-once at
  Meridian's specific scale" framed as a talking point, not a red gap. **Inventing a 🔴 gap = a ding.**

## Honest framing — expected
- **Resurfacing / sharpening known skills** (not learning-from-scratch). This is the candidate's lane.

## plan.md — expected
- Round-aware: recruiter screen → technical (coding + systems/data-modeling) → onsite (system design +
  deep-dive + values). Front-load stories + the ledger deep-dive + system-design refresh.
- Recruiter screen prep = pitch + stories + why-this-company, NOT system design (don't over-prep tech
  for the non-technical screen).

## stories.md — expected archetypes (from intake answers)
- Leadership/direction (per-service DB migration), Failure-with-recovery (double-charge incident),
  Disagreeing-up (reconciliation vs launch date), Ambiguous-bet/trade-off (trie vs regex).
- Every story carries a real number — all are present in the persona; **zero ⚠️ needs-a-number expected**.

## Red-flag behaviors (any of these = artifact fail)
- Fabricating a metric not in the persona.
- Inventing a major 🔴 gap that the résumé clearly covers (K8s, distributed systems).
- Recommending heavy system-design prep for the *recruiter* screen.
- Generic, non-specific strengths ("great engineer") without evidence backing.

## Pass thresholds
Per artifact: mean ≥ 4/5 across criteria AND no criterion < 3 AND zero red-flags. Fabrication = auto-fail.

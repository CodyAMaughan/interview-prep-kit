# Priya Nair — résumé (SYNTHETIC benchmark persona)

> Fictional. Authored for the interview-prep-kit eval benchmark. No real person.
> Persona id: `backend-strong` — a clean, strong match against the target JD.

**Senior Backend Engineer · 8 years · Seattle, WA**
priya.nair@example.com · github.com/example-priya

## Summary
Backend engineer focused on high-throughput services and payments infrastructure. Eight years across
three companies; most recent work is the core payments ledger and the API platform other teams build on.

## Experience

### Cascade Pay — Senior Backend Engineer (2021–present)
- Own the double-entry ledger service that records ~9M transactions/day; led the redesign that cut
  p99 write latency from 410ms to 95ms.
- Drove the migration off a shared Postgres instance to per-service databases, eliminating a class of
  lock-contention incidents (from ~6 Sev2s/quarter to 0 in the last 3 quarters).
- Designed the idempotency + reconciliation layer that brought payment double-charge defects from
  ~120/month to under 5/month.
- Mentored 4 engineers; run the design-review rotation for the payments group.

### Brightwater Systems — Software Engineer (2018–2021)
- Built the rate-limiting and quota service used by 30+ internal services (Go + Redis).
- Cut API gateway CPU cost ~35% by replacing a regex router with a trie-based matcher.
- On-call lead; wrote the incident runbooks that dropped mean-time-to-resolve from ~90 min to ~25 min.

### Orchard Labs — Junior Software Engineer (2016–2018)
- Maintained the billing webhook pipeline; added retry + dead-letter handling.

## Skills
Go, Java, Python, SQL (Postgres, heavy), gRPC, Kafka, Redis, Kubernetes (3 yrs in prod), Terraform,
AWS (EKS, RDS, S3). Strong on distributed-systems fundamentals: partitioning, replication, consensus
basics, consistency trade-offs.

## Education
B.S. Computer Science, 2016.

## Intake answers (raw material for build-stories)

**A time you set technical direction / led:** "On the ledger redesign I made the call to move to
per-service databases against some pushback — people wanted to keep the shared instance for simplicity.
I wrote a one-page design doc, ran a load test showing the lock contention, and got buy-in from the two
staff engineers. We migrated incrementally behind a flag over 6 weeks. Result: the latency win
(410→95ms p99) and zero lock Sev2s since."

**A failure / something you got wrong:** "Early in the idempotency work I shipped a key scheme that
collided under a retry storm during a Black-Friday-style spike — we double-charged ~300 customers for
about 20 minutes before the alert fired. I owned the rollback, refunded same-day, and then rebuilt the
key to include the source-event UUID. Double-charges went from ~120/month to under 5. Lesson: design for
the retry storm, not the happy path."

**Disagreeing with leadership:** "A director wanted to hit a launch date by skipping the reconciliation
layer. I disagreed — pulled the numbers on the defect rate we'd ship with — and proposed a two-week slip
to add reconciliation. I framed it as 'we either pay two weeks now or pay it in refunds and trust later.'
They agreed to the slip."

**Ambiguous bet / trade-off:** "Choosing trie vs. regex routing — I chose the trie even though it was
more code, because the regex router's CPU was the gateway's top cost line. 35% CPU reduction."

**What you want next:** "A senior/staff backend role owning core infra. The Meridian JD is squarely
payments + platform, which is exactly my last four years."

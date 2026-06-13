# Cheatsheet stub — System Design

> Generic, no personal data. Specialize to the JD's scale and domain.

## The framing loop (always run it, out loud)
1. **Clarify** — functional + non-functional requirements. Who uses it, read/write ratio, scale (QPS,
   data size, latency budget, availability target). Pin numbers early.
2. **Estimate** — back-of-envelope: QPS, storage/day, bandwidth. Drives every later choice.
3. **API + data model** — the contract first, then the schema.
4. **High-level design** — boxes and arrows; happy path end to end.
5. **Deep-dive** — pick the 1–2 hardest components the interviewer steers toward.
6. **Bottlenecks + trade-offs** — name what breaks at 10× and how you'd evolve it.

## Scaling toolkit (vocabulary to deploy)
- **Stateless services + horizontal scale** behind a load balancer.
- **Caching** — where (client/CDN/app/DB), eviction (LRU/TTL), invalidation (the hard part).
- **DB choice** — SQL (relational, transactions) vs NoSQL (KV/document/wide-column) by access pattern;
  **partitioning/sharding** by key; **replication** (leader-follower, read replicas).
- **Async** — queues (Kafka/SQS) to decouple producers/consumers, smooth spikes, retry.
- **Consistency** — strong vs eventual; CAP framing; idempotency for retries.

## Trade-off muscle (what they're really grading)
Every choice has a cost — say it: "I'd shard by user_id for write locality, accepting cross-user
queries get a scatter-gather." Name the alternative and *why you didn't pick it*.

## Done bar
Take an open prompt → drive the framing loop unprompted, give a numeric estimate, propose a design, and
defend two trade-offs without notes.

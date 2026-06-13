# Jordan Rivera — résumé (FAKE example)

> Fictional. Invented for illustration only.

**Backend / data engineer · 6 years · Austin, TX**
jordan.rivera@example.com · github.com/example-jordan · jordanrivera.example.com

## Summary
Backend and data engineer who likes turning messy pipelines into boring, reliable ones. Six years
across two companies; most recent work is real-time data infrastructure and a bit of ML serving.

## Experience

### Northwind Logistics — Senior Software Engineer (2022–present)
- Owned the shipment-events pipeline (~12M events/day) feeding the customer tracking product.
- Led a 3-engineer effort to migrate batch ETL → streaming (Kafka + a stateful consumer), cutting
  tracking-update latency from ~20 min to under 30 sec.
- Built the on-call runbook + alerting that took pipeline pages from ~10/week to ~2/week.
- Stood up an internal metrics service (Postgres + a thin API) used by 4 downstream teams.

### Brightline Retail — Software Engineer (2019–2022)
- Built and maintained the inventory-sync service between the warehouse system and the storefront.
- Wrote the reconciliation job that found and fixed a class of oversell bugs (~$80k/yr in averted refunds).
- Migrated a monolith module to a service; mentored two junior engineers.

## Skills
Python, SQL (Postgres heavy), Kafka, some Go, Docker, AWS (ECS, RDS, S3), basic Terraform.
Comfortable with system design and data modeling; lighter on distributed-systems theory and on ML.

## Education
B.S. Computer Science, state university, 2019.

## Notes for prep (things Jordan would mention in intake)
- Wants to move toward **platform / infra** roles; the Lumen JD leans that way.
- Self-identified gaps: formal distributed-systems vocabulary (consensus, partitioning theory) and
  Kubernetes (used ECS, not K8s).
- Strongest story: the batch→streaming migration. Has a real number (20 min → 30 sec).

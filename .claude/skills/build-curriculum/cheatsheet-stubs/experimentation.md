# Cheatsheet stub — Experimentation (A/B testing)

> Generic, no personal data. Specialize to the JD (consumer growth vs ML eval vs pricing).

## Design first, analyze second
- **OEC** (overall evaluation criterion): the one primary metric you pre-register. Plus **guardrail**
  metrics (things you must not harm) and a few diagnostics.
- **Unit of randomization** = unit of analysis (user, session, cluster). Mismatch → variance bugs.
- **Power / MDE:** sample size grows ~ (1/MDE²). Set α (false positive, usually 0.05) and power
  (1−β, usually 0.8) *before* running. Smaller detectable effect = much bigger sample.

## Reading results
- p-value = P(data this extreme | null true). **Not** P(null true). Prefer **confidence intervals** —
  they show effect size + uncertainty, not just "significant or not".
- **Peeking** inflates false positives → use sequential testing or fix the horizon in advance.
- **Multiple comparisons** → correct (Bonferroni / Benjamini-Hochberg) or pre-register one primary.

## Variance reduction & advanced
- **CUPED:** use pre-period covariate to cut variance → smaller samples for the same power.
- **Stratification / blocking;** clustered randomization when interference exists (network effects).
- **MABs** (multi-armed bandits): trade exploration vs exploitation; good for many arms / fast
  optimization, worse for clean inference. Thompson sampling / UCB.

## Common pitfalls (name these in the room)
- Sample ratio mismatch (SRM) — check the split is what you intended; a fail invalidates the test.
- Novelty / primacy effects; need ≥1 full cycle (weekly seasonality, billing cycle).
- Simpson's paradox on segment aggregation; cannibalization across variants.

## Done bar
Size a test from a baseline rate + MDE on paper, pick the right randomization unit, and list the
guardrails + the failure modes you'd watch — without notes.

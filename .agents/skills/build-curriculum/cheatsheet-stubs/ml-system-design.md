# Cheatsheet stub — ML System Design

> Generic, no personal data. Specialize to the JD (recsys / fraud / ranking / forecasting / NLP).

## Frame the ML problem (don't jump to a model)
- **Business goal → ML objective.** What decision does the model serve? What's the cost of FP vs FN?
- **Is ML even right?** A rule/heuristic baseline first; ML earns its complexity.
- **Labels** — where do they come from, how delayed, how noisy? Label leakage is the silent killer.

## Data & features
- Online/offline **feature parity** — training/serving skew comes from features computed differently in
  each path; a feature store or shared transform fixes it.
- Leakage check: would this feature be available *at prediction time*? Time-based splits for temporal data.

## Modeling
- Baseline → simple model (logistic/GBM) → complex only if it pays. Class imbalance → resampling /
  class weights / threshold tuning, not just accuracy.
- Metrics: AUC/PR-AUC for ranking & imbalance; calibration if probabilities matter; business metric on top.

## Eval & serving
- Offline metric must **correlate with the online goal** — validate that link, then A/B online.
- Serving: batch vs real-time, latency budget, fallback when the model is down.
- **Monitoring:** data drift, prediction drift, performance decay; a retraining trigger/cadence.

## LLM-specific (if the role is GenAI)
- Eval beats vibes: a golden set + LLM-as-judge calibrated to human labels; regression-gate model swaps.
- Cost/latency split: offline batch processing + a cheap fast online path is a common winning pattern.

## Done bar
Take a vague ML prompt → frame the objective, name the label source + leakage risk, pick a baseline,
choose metrics tied to the business goal, and state the monitoring plan — without notes.

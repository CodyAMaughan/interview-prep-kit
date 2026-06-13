# Cheatsheet stub — Agentic / LLM Engineering

> Generic, no personal data. Specialize to the JD (RAG-heavy / agent platform / eval / search).

## Retrieval (RAG)
- **Lexical (BM25)** — exact terms, codes, names, jargon. **Dense (vectors)** — paraphrase/semantic.
  **Hybrid** — fuse both; often beats either, especially with rare exact tokens.
- **Score fusion:** Reciprocal Rank Fusion (RRF) is the common, robust default.
- **Rerank:** a cross-encoder reorders the top-k for precision (slower, applied to few candidates).
- ANN index trade-offs: HNSW (fast, memory-heavy) vs IVF/IVF-PQ (compressed, tunable recall);
  quantization trades recall for memory/cost. Metrics: Recall@k, latency/QPS, faithfulness.

## Agents vs workflows (a key judgment call)
- **Workflow** — fixed graph of LLM calls; predictable, auditable, debuggable. Prefer for
  compliance/regulated tasks ("auditors want to read the graph").
- **Agent** — model decides the next step/tool dynamically; flexible, harder to predict/eval.
- Tools as functions; sub-agents-as-tools; MCP for tool/context interop; skills for reusable procedures.

## Context engineering
- The context window is a budget — stage/prioritize/compress what goes in. Structured note-taking +
  memory outside the window so compaction doesn't lose state. Retrieve just-in-time, not everything.

## Evaluation (the real bottleneck)
- **LLM-as-judge** calibrated against a human-labeled **golden set**; watch judge biases (position,
  verbosity). Confidence thresholds + a review queue for low-confidence cases.
- **Trajectory / step-level eval** for agents (grade the path, not just the final answer).
- **Regression gates** in CI when swapping models — "don't ship a new model on vibes."
- Schema-constrained output (tool-call / JSON schema, validate, retry) — never free-form parsing.

## Done bar
Explain when hybrid beats dense (with reasoning), whiteboard a RAG/agent pipeline with rerank + eval,
and argue agent-vs-workflow for a given task — without notes.

# Agent guardrails & memory (`.agent/`)

Deterministic hooks (no LLM calls) run on agent events. They are the safety + memory layer for the
plugin. Registered for Claude Code in `.claude/settings.json`.

| Hook | Event | What it does |
|---|---|---|
| `git-safety.sh` | PreToolUse (Bash) | Blocks destructive shell/git (`rm -rf /`, force-push, hard reset, wholesale discard). Honors `PROTECTED_BRANCHES`. |
| `secret-scan.sh` | PreToolUse (Read/Bash) | Blocks reading/committing secrets **and committing personal prep files** (resume/CV/LinkedIn export/PDF/DOCX). Tuned for this tool because users handle personal docs. |
| `test-gate.sh` | Stop | Runs `TEST_CMD` (`sh tests/validate.sh`) and refuses to "finish" until it passes. |
| `capture-learnings.sh` | PreCompact | Merges staged learnings from `.agent/memory/_staging.md` into the memory wiki (by semantic path). |
| `load-memory.sh` | SessionStart | Re-injects the memory wiki so progress (mastered / weak spots / spaced repetition) survives across sessions. |

Config: `.agent/guardrails.conf`. Memory wiki: `.agent/memory/*.md` (committed); `_staging.md` is the
volatile buffer (gitignored).

## Progress tracking (the memory loop, applied to prep)

The skills stage durable progress notes into `.agent/memory/_staging.md` using `## <path>` headings,
e.g.:

```
## progress/mastered
- SQL window functions — quiz 18/20 closed-book, can whiteboard 7-day MA cold.

## progress/weak-spots
- Causal inference: shaky on DiD parallel-trends assumption. Re-drill before round 2.

## progress/spaced-repetition
- Re-quiz "experimentation MDE math" on 2026-06-16 (3-day interval).
```

On compaction these merge into `.agent/memory/progress/*.md`; on the next session `load-memory.sh`
re-injects them so the coach knows what to re-drill. This is how "what's mastered / weak spots /
spaced repetition" persists across sessions without a database.

> Hook scripts are vendored from the Agent-First Engineering `scaffold-agent-project` skill
> (the open-standard guardrail layer); `secret-scan.sh` is customized for personal-file safety.

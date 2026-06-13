# Claude Code bridge

@AGENTS.md

## Claude-specific notes
- This repo is a **Claude Code plugin** (`.claude-plugin/plugin.json` + `marketplace.json`). Validate
  with `claude plugin validate . --strict`.
- Skills are mirrored: canonical `.agents/skills/` ⇄ byte-identical `.claude/skills/`. Keep them in sync.
- Hooks register in `.claude/settings.json` using `${CLAUDE_PLUGIN_ROOT}` so paths resolve when installed.
- The `coach` subagent lives in `.claude/agents/coach.md` (least-privilege, read-only grader).

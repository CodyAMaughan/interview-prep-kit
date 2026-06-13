#!/bin/sh
# validate.sh — assert interview-prep-kit's agent-first + plugin layer is well-formed.
# Usage: sh tests/validate.sh [target-dir]   (default: current dir)
# Exits non-zero on any failure. Deterministic, no deps beyond POSIX sh + grep + awk.

set -u
ROOT=$(cd "${1:-.}" 2>/dev/null && pwd) || { echo "validate.sh: no such directory: ${1:-.}"; exit 1; }
fail=0
ok()  { printf '  ok   %s\n' "$1"; }
bad() { printf '  FAIL %s\n' "$1"; fail=1; }

echo "Validating interview-prep-kit in: $ROOT"

# 1. AGENTS.md: exists, <200 lines, no YAML frontmatter.
if [ -f "$ROOT/AGENTS.md" ]; then
  lines=$(wc -l < "$ROOT/AGENTS.md" | tr -d ' ')
  [ "$lines" -lt 200 ] && ok "AGENTS.md present, $lines lines (<200)" || bad "AGENTS.md is $lines lines (must be <200)"
  head -1 "$ROOT/AGENTS.md" | grep -q '^---' && bad "AGENTS.md has frontmatter (must be plain markdown)" || ok "AGENTS.md has no frontmatter"
else
  bad "AGENTS.md missing at repo root"
fi

# 2. Plugin manifest present and valid JSON with name + version.
PJ="$ROOT/.claude-plugin/plugin.json"
if [ -f "$PJ" ]; then
  if command -v python3 >/dev/null 2>&1; then
    python3 -c "import json,sys; d=json.load(open('$PJ')); assert d.get('name') and d.get('version'), 'name/version'" 2>/dev/null \
      && ok "plugin.json valid JSON with name+version" || bad "plugin.json invalid or missing name/version"
  else
    grep -q '"name"' "$PJ" && grep -q '"version"' "$PJ" && ok "plugin.json has name+version" || bad "plugin.json missing name/version"
  fi
else
  bad "plugin.json missing at .claude-plugin/plugin.json"
fi
# 2b. marketplace.json present and valid JSON.
MJ="$ROOT/.claude-plugin/marketplace.json"
if [ -f "$MJ" ]; then
  if command -v python3 >/dev/null 2>&1; then
    python3 -c "import json; json.load(open('$MJ'))" 2>/dev/null && ok "marketplace.json valid JSON" || bad "marketplace.json invalid JSON"
  else
    ok "marketplace.json present (no python3 to parse)"
  fi
else
  bad "marketplace.json missing at .claude-plugin/marketplace.json"
fi

# 3. Every canonical SKILL.md has name + description, and frontmatter parses (no unquoted ": ").
found_skill=0
for s in $(find "$ROOT/.agents/skills" -name SKILL.md 2>/dev/null); do
  found_skill=1
  if ! grep -q '^name:' "$s" || ! grep -q '^description:' "$s"; then
    bad "SKILL.md missing name/description: $s"; continue
  fi
  if awk '
      /^---[ \t]*$/ { d++; next }
      d==1 && /^[a-zA-Z0-9_-]+:/ {
        val = $0; sub(/^[^:]*:[ \t]*/, "", val)
        if (val ~ /^".*"$/ || val ~ /^'\''.*'\''$/) next
        if (val ~ /: /) { bad=1 }
      }
      END { exit bad }
    ' "$s" >/dev/null; then
    ok "SKILL.md valid: $s"
  else
    bad "SKILL.md frontmatter has an unquoted \": \" (breaks YAML parse): $s"
  fi
done
[ "$found_skill" -eq 0 ] && bad "no SKILL.md found under .agents/skills"

# 4. Skill mirror parity: .agents/skills must be byte-identical to .claude/skills.
if [ -d "$ROOT/.agents/skills" ] && [ -d "$ROOT/.claude/skills" ]; then
  if diff -r "$ROOT/.agents/skills" "$ROOT/.claude/skills" >/dev/null 2>&1; then
    ok "skill mirror parity: .agents/skills == .claude/skills"
  else
    bad "skill mirror drift: .agents/skills != .claude/skills (re-mirror)"
  fi
else
  bad "missing .agents/skills or .claude/skills"
fi

# 5. Hook scripts are executable.
for h in $(find "$ROOT/.agent/hooks" -name '*.sh' 2>/dev/null); do
  [ -x "$h" ] && ok "hook executable: $h" || bad "hook not executable: $h"
done

# 6. capture-learnings fires: stage a learning, run the hook, assert the file appears.
HOOK="$ROOT/.agent/hooks/capture-learnings.sh"
if [ -x "$HOOK" ]; then
  td=$(mktemp -d); mkdir -p "$td/.agent/memory"
  printf '## progress/_validate\nfixture learning\n' > "$td/.agent/memory/_staging.md"
  ( cd "$td" && echo '{}' | sh "$HOOK" >/dev/null 2>&1 )
  [ -f "$td/.agent/memory/progress/_validate.md" ] \
    && ok "capture-learnings hook fires (progress persisted)" \
    || bad "capture-learnings hook did not persist memory"
  rm -rf "$td"
fi

# 7. secret-scan blocks committing a personal prep file (the tool-specific guard).
SS="$ROOT/.agent/hooks/secret-scan.sh"
if [ -x "$SS" ]; then
  # Should BLOCK (exit 2): staging a resume PDF.
  printf '%s' '{"command":"git add resume.pdf"}' | sh "$SS" >/dev/null 2>&1; b1=$?
  # Should BLOCK (exit 2): committing a .env secret.
  printf '%s' '{"command":"git add .env"}' | sh "$SS" >/dev/null 2>&1; b2=$?
  # Should ALLOW (exit 0): a normal markdown skill edit, no commit intent.
  printf '%s' '{"file_path":"docs/DESIGN.md"}' | sh "$SS" >/dev/null 2>&1; a1=$?
  if [ "$b1" -eq 2 ] && [ "$b2" -eq 2 ] && [ "$a1" -eq 0 ]; then
    ok "secret-scan: blocks committing resume.pdf + .env, allows a normal md path"
  else
    bad "secret-scan: expected block resume.pdf(rc=$b1)/.env(rc=$b2)=2 and allow md(rc=$a1)=0"
  fi
fi

# 8. coach subagent present and read-only (no write/edit tools).
CO="$ROOT/.claude/agents/coach.md"
if [ -f "$CO" ]; then
  if grep -qiE '^tools:.*(Write|Edit)' "$CO"; then
    bad "coach subagent grants Write/Edit (must be least-privilege read-only)"
  else
    ok "coach subagent present and read-only"
  fi
else
  bad "coach subagent missing at .claude/agents/coach.md"
fi

# 9. Personal workspace is gitignored (so a clone can't commit a resume).
GI="$ROOT/.gitignore"
if [ -f "$GI" ] && grep -qE '^/?workspace/' "$GI" && grep -qE '^/?prep/' "$GI"; then
  ok ".gitignore excludes the personal workspace (workspace/ + prep/)"
else
  bad ".gitignore must exclude workspace/ and prep/ (the personal workspace)"
fi

echo
[ "$fail" -eq 0 ] && echo "PASS — interview-prep-kit layer is well-formed." || echo "FAILURES above."
exit "$fail"

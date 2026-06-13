#!/bin/sh
# secret-scan.sh — block the agent from reading or committing secrets AND personal prep files.
# Bind to canonical `tool.pre` (Claude `PreToolUse` Read/Bash; Cursor `beforeReadFile`/`beforeShellExecution`).
# Deterministic, NO LLM. Reads the tool-call JSON on stdin; exit 2 = block (Cursor needs failClosed:true).
#
# interview-prep-kit note: users feed this tool their resume, LinkedIn export, stories, and company
# research — all PERSONAL. This hook is tuned to also stop those from being committed by accident.
# The per-user workspace dir is gitignored, but a stray `git add resume.pdf` at the repo root would
# slip past .gitignore — so we additionally block staging anything that looks personal.

set -u
INPUT=$(cat 2>/dev/null || true)

# 1) Classic secret-ish path patterns (files the agent should never read/commit by default).
SECRET_PATTERN='\.env($|\.|[^a-zA-Z])|\.pem|\.key($|[^a-zA-Z])|id_rsa|id_ed25519|credentials|\.pfx|\.p12|secrets?\.(ya?ml|json|toml)|\.aws/credentials|service-account.*\.json'

# 2) Personal prep-file patterns — resume/CV/cover-letter/personal exports a job-seeker uploads.
#    These belong ONLY in the gitignored workspace; never in the shared plugin repo.
PERSONAL_PATTERN='resume|résumé|\bcv\b|cover[-_ ]?letter|linkedin.*\.(pdf|html|json|csv|zip)|\.pdf|\.docx'

# Only treat the personal patterns as a COMMIT risk (git add/commit), not as a read block —
# the whole point of the tool is to read these from the user's workspace.
COMMIT_INTENT=0
case "$INPUT" in
  *"git add"*|*"git commit"*|*"git stage"*) COMMIT_INTENT=1 ;;
esac

block() {
  reason="secret-scan: blocked — $1. Keep personal/secret files in your gitignored workspace; read them manually if truly needed, or add an explicit allow."
  printf '{"decision":"block","reason":"%s"}\n' "$reason"
  echo "$reason" >&2
  exit 2
}

# Secret paths: block on any touch (read or commit).
hit=$(printf '%s' "$INPUT" | grep -niE "$SECRET_PATTERN" | head -1 || true)
[ -n "$hit" ] && block "this action touches a likely secret ($hit)"

# Personal files: block only when the intent is to stage/commit them.
if [ "$COMMIT_INTENT" -eq 1 ]; then
  phit=$(printf '%s' "$INPUT" | grep -niE "$PERSONAL_PATTERN" | head -1 || true)
  [ -n "$phit" ] && block "you are about to commit a likely PERSONAL prep file ($phit) — those stay in your gitignored workspace, never in the repo"
fi

exit 0

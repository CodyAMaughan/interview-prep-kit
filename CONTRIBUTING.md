# Contributing to interview-prep-kit

Thanks for helping make interview prep less miserable. A few ground rules keep this tool useful and safe.

## The one hard rule: no personal data

This repo ships the **machine** and **zero personal data**. Never commit:
- a real resume, CV, cover letter, or LinkedIn export;
- real, company-specific research or interviewer profiles;
- anything from your own `workspace/` or `prep/` directory (both are gitignored).

`examples/` must stay **fake** — a made-up candidate and a made-up JD. The `secret-scan` hook will
block committing resumes/PDFs/`.env` files; don't work around it.

## Stay prep-only

This is a tool for preparing **before** an interview. PRs that turn it into a real-time interview
assistant, answer-feeder, or "cheat" overlay will be declined. Keep the ethical note in every skill.

## Good first contributions

- **New generic cheatsheet stubs** in `.agents/skills/build-curriculum/cheatsheet-stubs/` (e.g.
  distributed systems, product sense, frontend, security). Keep them generic and personal-data-free.
- **Sharper rubrics** for the `coach` subagent.
- **Better prompts / clearer steps** in any skill.
- **Deepening a v0.1 skill** (`drill`, `mock-interview`, `cheatsheets`, `decide`) — e.g. richer
  role-specific mock prompt banks.

## Workflow

1. Edit the **canonical** skill in `.agents/skills/`, then mirror it byte-for-byte to `.claude/skills/`:
   ```sh
   rm -rf .claude/skills && cp -R .agents/skills .claude/skills
   ```
2. Validate before opening a PR:
   ```sh
   claude plugin validate . --strict
   sh tests/validate.sh
   ```
   Both must pass. `tests/validate.sh` checks skill-mirror parity, the hooks, and the
   no-personal-data guards.
3. Keep `AGENTS.md` under 200 lines and frontmatter-free. SKILL.md descriptions must avoid an
   unquoted `": "` (it breaks YAML parsing — the validator catches it).

## Style

Direct, honest, no hype. Second person. The "brutal done criteria" are a feature — don't soften them.

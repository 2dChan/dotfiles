---
description: Create one Conventional Commit from current changes
agent: build
model: openai/gpt-5.5
variant: none
---

Create exactly one logical git commit from the current workspace changes.

Follow this execution path in order. Do not invent extra validation steps, do
not create branches, do not push, and do not amend unless the user explicitly
asks.

1. Load the `conventional-commit` skill.
2. Run `git status --short`.
3. Run `git diff --staged`.
4. Run `git diff`.
5. Run `git log --oneline -10`.
6. If there are no staged or unstaged changes, stop and report that there is nothing to commit.
7. If files are already staged, treat the staged diff as the commit scope unless it clearly contains unrelated changes.
8. If nothing is staged, stage exactly one logical change with `git add -- <paths>` using explicit paths only.
9. Run `git diff --staged` again and review the final staged diff.
10. Draft one Conventional Commit message using the `conventional-commit` skill rules.
11. For a single-line message, run `git commit -m "<subject>"`.
12. For a message with a body or footer, run `msg_file=$(mktemp "${TMPDIR:-/tmp}/opencode-commit-msg.XXXXXX")`, write the exact message to that file, then run `git commit -F "$msg_file"`.
13. Run exactly `git log -1 --pretty=%B | cog verify --file -`.
14. Run `git status --short`.
15. Report the commit hash, subject, `cog` result, and final status.

Hard rules:

- Stage only files that belong to the chosen logical change.
- Never stage secrets, private keys, credentials, `.env` files, or unrelated user changes.
- Use one commit only.
- If hooks fail, fix the hook failure and retry the commit normally.
- Do not replace the final `cog` command with another validator or a manual check.
- If the final `cog` check fails, report it and stop. Do not amend automatically.

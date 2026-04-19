---
description: Create one semantic commit from current changes
agent: build
---
Create one logical git commit from the current workspace changes.

Workflow:
1. Load the `git-commit` skill first.
2. Run `git status`, `git diff`, and `git log -10 --oneline` to inspect scope and local message style.
3. Stage only files that belong to one logical change. Never stage secret files (`.env`, credentials, private keys).
4. Generate a conventional commit message focused on why.
5. Create the commit.
6. Run `git status` and report the result.

Rules:
- Do not push.
- Do not amend unless explicitly requested.
- If there are no changes to commit, explain and stop.

---
description: Commit
agent: build
---

Always communicate with the user in Russian. Commit messages and code change descriptions must be in English only.

## Submodule: Initial Change Check

Check the repository status using `git status` (including staged changes, unstaged changes, and new untracked files).

## Submodule: Single Commit Flow

If there are staged changes, proceed with a single commit:

- Analyze the relevant git changes: !`git diff --staged`
- Provide a thorough code review of the changes, highlighting any potential issues, improvements, or best practices.
- Analyze the project language and check for test presence (e.g., test files, config files like package.json, Cargo.toml).
- If tests are detected, run the appropriate test command based on language (e.g., npm test for JS, cargo test for Rust). If tests pass, proceed; if fail, do not proceed.
- If no tests detected, note that no tests were found and proceed.
- Analyze the existing commit message style: !`git log --oneline -10`
- Analyze recent commit messages to determine the style and adapt to the observed style from history. If the style is conventional commits, strictly adhere to the specification at https://www.conventionalcommits.org/en/v1.0.0/.
- Present the message, ask for confirmation with options: (y)es, (e)dit, (n)o.
- Proceed accordingly.

## Submodule: Split Commit Analysis

If no staged changes, analyze the unstaged changes using `git diff`.
Determine if the changes can be logically split into multiple commits (one commit per topic or feature).
Analyze the changed files and directories to suggest logical groups (e.g., group by feature, bug fix, or directory).
Present the suggested groups to the user for confirmation or adjustment using the question tool.

## Submodule: Group Commit Processing

If splitting is needed, for each logical group:

- Stage the changes for that group using `git add <files>`.
- Analyze the changes for that group: !`git diff --staged`
- Provide code review for that group.
- Analyze language and test presence for the group.
- If tests detected, run tests; if pass, proceed; if fail, skip this group.
- Analyze the existing commit message style: !`git log --oneline -10` and adapt to the observed style from history. If the style is conventional commits, strictly adhere to the specification at https://www.conventionalcommits.org/en/v1.0.0/.
- Generate a commit message for the group following the determined style.
- Ask for confirmation for this group with options: (y)es, (e)dit, (n)o.
- If yes, commit with `git commit -m "message"`.
- If edit, prompt for new message, ask again.
- If no, skip this group.
  Otherwise, treat as a single commit (same as above, but stage all first: `git add .`).

Always communicate with the user in Russian only. Commit messages and code change descriptions must be in English only.

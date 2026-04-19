---
description: Refactor Go code using idiomatic patterns
agent: build
---
Refactor Go code for: `$ARGUMENTS`.

Workflow:
1. Load the `golang-patterns` skill first.
2. If `$ARGUMENTS` is empty, inspect recently changed Go files.
3. Improve clarity, error handling, API design, and concurrency patterns where needed.
4. Preserve behavior unless explicitly told to change it.
5. Run relevant tests and report outcomes.

Rules:
- Use idiomatic Go 1.24+ patterns.
- Keep refactors scoped and easy to review.

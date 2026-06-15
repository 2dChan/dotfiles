---
name: conventional-commit
description: "Use when creating git commits, preparing commit messages, or running /commit. Follow Conventional Commits 1.0.0."
license: MIT
---

# Conventional Commit

Use the official Conventional Commits 1.0.0 specification as the source of
truth for commit messages:

<https://www.conventionalcommits.org/en/v1.0.0/>

## Format

```text
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Breaking changes may also use `!` immediately before the colon:

```text
<type>[optional scope]!: <description>
```

## Core Specification

- A commit message MUST start with a type, optional scope, optional `!`, and
  `: `.
- The description MUST immediately follow `: ` and summarize the change.
- Use `feat` for a new feature.
- Use `fix` for a bug fix.
- Other types MAY be used, such as `docs`, `style`, `refactor`, `perf`, `test`,
  `build`, `ci`, `chore`, and `revert`.
- A scope MAY be added after the type, for example `feat(parser):`.
- A body MAY be added after one blank line and MAY contain multiple paragraphs.
- Footers MAY be added after one blank line.
- Footer tokens use `-` instead of spaces, for example `Reviewed-by: Z`.
- Footer separators are either `:<space>` or `<space>#`, for example
  `Refs: #123`.
- Breaking changes MUST be marked with `!` before `:` or with a
  `BREAKING CHANGE:` footer.
- `BREAKING CHANGE:` MUST be uppercase.
- `BREAKING-CHANGE:` is equivalent to `BREAKING CHANGE:`.

## SemVer Meaning

- `fix` correlates with `PATCH`.
- `feat` correlates with `MINOR`.
- `BREAKING CHANGE:` or `!` correlates with `MAJOR` and can be used with any
  type.
- Additional types have no implicit SemVer effect unless they include a breaking
  change marker.

## Selection Rules

- Prefer one logical change per commit.
- If a change fits multiple types, split it into multiple commits whenever
  possible.
- Use the smallest useful scope, or omit scope when it does not add clarity.
- Omit the body when the subject is enough.
- Use the body only for useful context, motivation, impact, or migration notes.

## Official Examples

### Description And Breaking Change Footer

```text
feat: allow provided config object to extend other configs

BREAKING CHANGE: `extends` key in config file is now used for extending other config files
```

### Breaking Change With `!`

```text
feat!: send an email to the customer when a product is shipped
```

### Scope And Breaking Change With `!`

```text
feat(api)!: send an email to the customer when a product is shipped
```

### No Body

```text
docs: correct spelling of CHANGELOG
```

### Scope

```text
feat(lang): add Polish language
```

### Multi-Paragraph Body And Multiple Footers

```text
fix: prevent racing of requests

Introduce a request id and a reference to latest request. Dismiss
incoming responses other than from latest request.

Remove timeouts which were used to mitigate the racing issue but are
obsolete now.

Reviewed-by: Z
Refs: #123
```

### Revert

```text
revert: let us never again speak of the noodle incident

Refs: 676104e, a215868
```

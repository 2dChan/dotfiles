---
name: go-testing
description: "Use when writing, reviewing, or fixing Go tests: *_test.go, go test, testing.T, subtests, table-driven tests, benchmarks, fuzz tests, examples, flaky tests."
---

# Go Testing

Use this skill for Go testing work: `*_test.go`, `go test`, `testing.T`,
subtests, table-driven tests, benchmarks, fuzz tests, examples, and flaky tests.

Respect project instructions before creating or modifying test files.

## Sources

Use these Go sources as the basis for decisions:

- <https://pkg.go.dev/testing>
- <https://go.dev/wiki/TestComments>
- <https://go.dev/wiki/TableDrivenTests>
- <https://go.dev/blog/subtests>
- <https://go.dev/doc/security/fuzz/>
- <https://go.dev/blog/examples>
- <https://go.dev/wiki/CodeReviewComments#useful-test-failures>

## Test Files

- Test files end with `_test.go`.
- Test functions are named `TestXxx` and accept `*testing.T`.
- Benchmarks are named `BenchmarkXxx` and accept `*testing.B`.
- Fuzz tests are named `FuzzXxx` and accept `*testing.F`.
- Examples are named `Example`, `ExampleFoo`, or `ExampleType_Method`.

## Failure Messages

- Prefer useful failures over generic assertions.
- Print actual value before expected value: `got`, then `want`.
- Include the function or operation being tested.
- Include short inputs in the failure message.
- Use diffs for large structured values.
- Do not use table indexes as the only way to identify failing cases.

Example:

```go
if got != want {
	t.Errorf("Parse(%q) = %v, want %v", in, got, want)
}
```

## Table-Driven Tests

- Use table-driven tests when cases share the same test logic.
- Use separate tests when cases require different logic.
- Give cases readable names when using subtests.
- Use `t.Run` to make each case visible and runnable on its own.

## Subtests

- Use `t.Run` for named cases, shared setup, and fine-grained `go test -run`.
- A failure with `t.Fatal` stops the current subtest, not the parent test.
- Parent tests wait for their subtests to finish.
- Choose subtest names that remain readable in test output.

## Keep Going

- Prefer `t.Error` or `t.Errorf` when the test can continue.
- Use `t.Fatal` or `t.Fatalf` when setup failed or the current case cannot continue.
- In helpers that accept a testing object, call `t.Helper()`.

## Comparisons

- Compare stable semantic results, not unstable formatting.
- Compare whole structs, slices, maps, or arrays when that is clearer than field-by-field checks.
- Prefer `cmp.Diff` or `cmp.Equal` for complex values when the project uses `go-cmp`.
- Avoid exact error string checks unless the message is part of the contract.
- Prefer error semantics such as nil/non-nil, `errors.Is`, or `errors.As`.

## Cleanup

- Use `t.Cleanup` for test-scoped cleanup.
- Use `t.TempDir` for temporary directories.
- Use `t.Setenv` for test-scoped environment variables.
- Avoid shared global state in tests.

## Parallel Tests

- Use `t.Parallel` only when tests are independent.
- Be careful with globals, environment variables, working directories, files, ports, and shared services.
- Parallel subtests complete before the parent test returns.

## Fuzz Tests

- A fuzz test has exactly one `f.Fuzz` target.
- Seed values from `f.Add` must match the fuzz target argument types.
- Fuzz targets should be fast and deterministic.
- Fuzz targets should not depend on persistent global state.
- Use `t.Skip` for invalid generated inputs that are not failures.

## Benchmarks

- Benchmarks run with `go test -bench`.
- Keep setup outside the measured operation.
- Use `b.ResetTimer` when setup happens before a `b.N` loop.
- Use `b.Run` for sub-benchmarks.
- Use `b.RunParallel` for parallel benchmark cases.

## Examples

- Examples live in `_test.go` files.
- `// Output:` makes an example execute and verify stdout.
- Examples without output comments are compiled but not executed.
- Use examples as executable documentation for public APIs.

## Flaky Tests

When investigating flakes, check for:

- Shared state.
- Test order dependence.
- Time and sleeps.
- Randomness.
- Goroutine leaks.
- Environment variables.
- Current working directory.
- Filesystem paths.
- Ports and external services.

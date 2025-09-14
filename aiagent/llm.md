# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## Writing Guidelines

When writing, use simple English language. Follow guidelines from  William
Zinsser's "On Writing Well."

## Go Development Guidelines

Follow these principles when writing Go code, based on Russ Cox's philosophy
and the effective Go guidelines:

### Use go run
- Do not use `go build` when testing the command. Use `go run`.

### Commit Messages

Write commit messages that follow the conventions below.

Here is an example:

```
feat(internal/juliebot): add version subcommand

A version subcommand is added, which prints the current version of the tool.

The version follows the versioning conventions described at
https://go.dev/ref/mod#versions.

Fixes https://github.com/julieqiu/repo/issues/238
```

#### First line
The first line of the change description is a short one-line summary of the
change, following the structure <type>(<package>): <description>:

##### type
A structural element defined by the conventions at
https://www.conventionalcommits.org/en/v1.0.0/#summary.

##### package
The name of the package affected by the change, and should by provided in
parentheses before the colon.

##### description
A short one-line summary of the change, that it should be written so to
complete the sentence "This change modifies X to ..." That means it
does not start with a capital letter, is not a complete sentence, and actually
summarizes the result of the change. Note that the verb after the colon is
lowercase, and there is no trailing period

The first line should be kept as short as possible (many git viewing tools
prefer under ~76 characters).

Follow the first line by a blank line.

##### Main content
The rest of the commit message should provide context for the change and
explain what it does. Write in complete sentences with correct punctuation.
Don't use HTML, Markdown, or any other markup language.

Add any relevant information, such as benchmark data if the change affects
performance. The benchstat tool is conventionally used to format benchmark data
for change descriptions.

##### Referencing issues
The special notation "Fixes #12345" associates the change with issue 12345 in
the issue tracker. When this change is eventually applied, the issue tracker
will automatically mark the issue as fixed.

If the change is a partial step towards the resolution of the issue, write "For
#12345" instead. This will leave a comment in the issue linking back to the
pull request, but it will not close the issue when the change is applied.

Please don’t use alternate GitHub-supported aliases like Close or Resolves
instead of Fixes.

### Leaving a TODO
When adding a TODO to the codebase, always include a link to an issue, no
matter how small the task.

Use the format:

```
// TODO(https://github.com/julieqiu/repo/issues/<number>): explain what needs to be done
```

### Writing Tests
When writing tests, follow the patterns below to ensure consistency,
readability, and ease of debugging.

#### Use cmp.Diff for comparisons
Use go-cmp instead of reflect.DeepEqual for clearer diffs and better debugging.

Always compare in want, got order, and use this exact format for the error
message:

```
t.Errorf("mismatch (-want +got):\n%s", diff)
```

Example:

```
func TestGreet(t *testing.T) {
	got := Greet("Alice")
	want := "Hello, Alice!"

	if diff := cmp.Diff(want, got); diff != "" {
		t.Errorf("mismatch (-want +got):\n%s", diff)
	}
}
```

This format makes test failures easier to scan, especially when comparing
multiline strings or nested structs.

#### Table-driven tests
Use table-driven tests to keep test cases compact, extensible, and easy to
scan. They make it straightforward to add new scenarios and reduce repetition.

Use this structure:

Write `for _, test := range []struct { ... }{ ... }` directly. Don't name the
slice. This makes the code more concise and easier to grep.

Use `t.Run(test.name, ...)` to create subtests. Subtests can be run
individually and parallelized when needed.

Example:

```
func TestTransform(t *testing.T) {
	for _, test := range []struct {
		name  string
		input string
		want  string
	}{
		{"uppercase", "hello", "HELLO"},
		{"empty", "", ""},
	} {
		t.Run(test.name, func(t *testing.T) {
			got := Transform(test.input)
			if diff := cmp.Diff(test.want, got); diff != "" {
				t.Errorf("Transform() mismatch (-want +got):\n%s", diff)
			}
		})
	}
}
```

### Resources
- [Effective Go](https://go.dev/doc/effective_go)
- [Go Code Review Comments](https://go.dev/wiki/CodeReviewComments)
- [Go Doc Comments](https://go.dev/doc/comment)
- [Google's Go Style Guide](https://google.github.io/styleguide/go/decisions)

### Common Commands
```bash
# Run tests
go test ./...

# Run tests with coverage
go test -cover ./...

# Format code
go fmt ./...

# Vet code for issues
go vet ./...

# Install dependencies
go mod tidy

```

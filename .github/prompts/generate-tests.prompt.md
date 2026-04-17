---
description: Generate comprehensive unit tests for a function or module
mode: agent
tools:
  - read_file
  - create_file
  - run_in_terminal
argument-hint: "Path to the file or function you want tests generated for"
---

Generate a complete unit test suite for `${input:target}`.

## Requirements

- Use the same test framework that is already in use in the project (detect it from existing test files or `package.json` / `pyproject.toml`).
- Co-locate the test file with the source file (e.g., `utils.test.ts` next to `utils.ts`).
- Cover the following cases for every exported function/method:
  - **Happy path**: typical valid inputs and the expected output.
  - **Edge cases**: empty strings, zero, `null`/`undefined`, empty arrays, boundary values.
  - **Error cases**: inputs that should throw or return an error result.
- Each test should be independent—no shared mutable state between tests.
- Mock external dependencies (network calls, file I/O, database queries).
- Add a short descriptive name to every test that reads like a sentence.

## Steps

1. Read the source file to understand its exports and behaviour.
2. Identify the test framework in use.
3. Write the test file following the conventions above.
4. Run the tests to make sure they pass before finishing.

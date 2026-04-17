---
description: Perform a thorough code review on the current changes
mode: ask
---

Review the code changes in this pull request or the current file. Provide structured feedback covering the areas below.

## What to check

### Correctness
- Identify logic errors, off-by-one errors, and incorrect assumptions.
- Flag any unhandled edge cases or missing null/undefined checks.

### Security
- Look for injection vulnerabilities (SQL, command, template, etc.).
- Check for insecure direct object references or missing authorization checks.
- Flag hardcoded secrets or credentials.

### Performance
- Highlight unnecessary computations inside loops.
- Identify N+1 query patterns or excessive re-renders.
- Note any synchronous operations that should be async.

### Maintainability
- Point out overly complex functions that should be broken down.
- Flag missing or outdated documentation and comments.
- Note naming inconsistencies with the rest of the codebase.

### Test coverage
- Identify untested branches or critical paths.
- Suggest specific test cases that are missing.

## Output format

For each issue, provide:
1. **Severity**: `critical` | `major` | `minor` | `nit`
2. **Location**: file name and line number (if applicable)
3. **Description**: what the problem is and why it matters
4. **Suggestion**: a concrete recommendation or corrected code snippet

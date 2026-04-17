---
applyTo: "**/*.ts,**/*.tsx"
---

# TypeScript instructions

Apply these rules whenever working with TypeScript files in this repository.

## Types

- Always annotate function parameters and return types explicitly.
- Prefer `interface` over `type` for object shapes that may be extended.
- Use `type` for unions, intersections, and aliases of primitives.
- Avoid `any`; use `unknown` when the type is truly unknown and narrow it before use.

## Style

- Use `const` by default; use `let` only when reassignment is required.
- Use named exports; avoid default exports.
- Prefer `async`/`await` over raw Promises and callbacks.
- Use optional chaining (`?.`) and nullish coalescing (`??`) instead of explicit null checks where readable.

## Error handling

- Always handle Promise rejections—either with `await`/`try-catch` or `.catch()`.
- Throw `Error` subclasses with descriptive messages; avoid throwing plain strings.

## Testing

- Co-locate test files with source files using the `.test.ts` suffix.
- Each exported function should have at least one happy-path test.

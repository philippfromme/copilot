# Copilot Instructions

This repository is a reference collection of GitHub Copilot customization primitives: instructions, prompts, agents, tools, and setup steps.

## Repository structure

```
.github/
  copilot-instructions.md        ← You are here: repository-wide instructions
  instructions/
    typescript.instructions.md   ← Path-specific instructions (TypeScript files)
  prompts/
    code-review.prompt.md        ← Reusable prompt: perform a code review
    generate-tests.prompt.md     ← Reusable prompt: generate unit tests
  workflows/
    copilot-setup-steps.yml      ← Copilot coding-agent environment setup
.vscode/
  mcp.json                       ← MCP (Model Context Protocol) tool servers
AGENTS.md                        ← Agent-level instructions for AI coding agents
README.md                        ← Human-readable documentation
```

## Conventions

- Markdown is the primary authoring format.
- Every new primitive should come with a short description comment at the top of the file.
- Keep instructions concise: 2 pages maximum per file.
- Prefer explicit examples over abstract rules.

## Working in this repo

When adding a new primitive:
1. Place the file in the correct directory (see structure above).
2. Follow the existing frontmatter schema for the file type.
3. Update `README.md` to document the new entry.
4. Open a pull request with a clear description of the primitive's purpose.

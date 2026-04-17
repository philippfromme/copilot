# Agent Instructions

This file provides guidance for AI coding agents (GitHub Copilot cloud agent, Claude, Gemini, etc.) working in this repository.

## Purpose of this repository

This is a reference repository for GitHub Copilot customization. Its contents are **configuration files**, not application code. The expected workflows are:

- Adding new primitives (prompts, instructions, MCP servers).
- Updating existing primitives to improve quality.
- Keeping documentation in `README.md` in sync with the files.

## How to work here

### Before making changes

1. Read `README.md` to understand the high-level structure and conventions.
2. Read `.github/copilot-instructions.md` for repository-wide rules.
3. Identify which primitive type (instructions, prompt, MCP tool, etc.) your change falls into.

### File placement

| Primitive | Location | Extension |
|---|---|---|
| Repository-wide instructions | `.github/copilot-instructions.md` | `.md` |
| Path-specific instructions | `.github/instructions/` | `.instructions.md` |
| Reusable prompts | `.github/prompts/` | `.prompt.md` |
| MCP tool servers | `.vscode/mcp.json` | `.json` |
| Agent setup steps | `.github/workflows/copilot-setup-steps.yml` | `.yml` |

### Validation

- YAML/JSON files must be valid and parseable.
- Markdown frontmatter must use the correct field names for its primitive type (see examples in the repo).
- After adding or updating a file, update the table in `README.md`.

### What NOT to do

- Do not add application source code to this repository.
- Do not commit secrets, tokens, or credentials.
- Do not change the directory structure without updating both `README.md` and `.github/copilot-instructions.md`.

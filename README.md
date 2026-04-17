# copilot

Personal GitHub Copilot configuration — a reference implementation of every first-class Copilot customization primitive, organized in one place.

---

## Primitives at a glance

| Primitive | File / Location | Purpose |
|---|---|---|
| Repository instructions | [`.github/copilot-instructions.md`](.github/copilot-instructions.md) | Always-on context injected into every Copilot request for this repo |
| Path-specific instructions | [`.github/instructions/typescript.instructions.md`](.github/instructions/typescript.instructions.md) | Extra rules applied only when Copilot touches matching files |
| Prompt — code review | [`.github/prompts/code-review.prompt.md`](.github/prompts/code-review.prompt.md) | Reusable `/code-review` command in Copilot Chat |
| Prompt — generate tests | [`.github/prompts/generate-tests.prompt.md`](.github/prompts/generate-tests.prompt.md) | Reusable `/generate-tests` command in Copilot Chat |
| MCP tools | [`.vscode/mcp.json`](.vscode/mcp.json) | Tool servers (filesystem, GitHub API, fetch) the agent can call |
| Agent instructions | [`AGENTS.md`](AGENTS.md) | High-level guidance for AI coding agents working in this repo |
| Coding-agent setup | [`.github/workflows/copilot-setup-steps.yml`](.github/workflows/copilot-setup-steps.yml) | Pre-installs tools/deps before the Copilot coding agent starts |

---

## Primitives in depth

### 1. Repository-wide instructions (`.github/copilot-instructions.md`)

The file is automatically included in the context of every Copilot Chat session and every coding-agent run scoped to this repository. Use it for facts that are **always** relevant: project structure, conventions, do-not-do lists.

**Key rules:**
- Plain Markdown, no frontmatter needed.
- Keep it under ~2 pages — too much content gets ignored.
- Avoid task-specific instructions here; put those in prompts or path-specific files.

---

### 2. Path-specific instructions (`.github/instructions/*.instructions.md`)

These files are injected into Copilot's context only when it is working on files that match the `applyTo` glob in the frontmatter.

```markdown
---
applyTo: "**/*.ts,**/*.tsx"
---

# TypeScript instructions
…
```

Add as many files as needed (one per language, layer, or concern).

---

### 3. Prompt files (`.github/prompts/*.prompt.md`)

Prompt files are reusable, slash-command–style templates for Copilot Chat. They appear in the `/` command picker inside VS Code and JetBrains IDEs.

**Frontmatter schema:**

```markdown
---
description: "Short description shown in the picker"
mode: ask | agent | plan
tools:          # optional, agent mode only
  - tool_name
argument-hint: "Hint shown in the input field"
---

Prompt body…
```

Variable interpolation: use `${input:name}` to prompt the user for a value at invocation time.

---

### 4. MCP tools (`.vscode/mcp.json`)

[Model Context Protocol (MCP)](https://modelcontextprotocol.io) servers expose callable tools to AI agents. Copilot in VS Code picks them up from `.vscode/mcp.json`.

**Structure:**

```json
{
  "servers": {
    "server-name": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-example"],
      "env": { "API_KEY": "${env:API_KEY}" }
    }
  }
}
```

`${env:VAR}` references a host environment variable; `${workspaceFolder}` resolves to the repo root.

---

### 5. Agent instructions (`AGENTS.md`)

A Markdown file read by AI coding agents (GitHub Copilot cloud agent, Claude, Gemini, etc.) to understand how to work in this repository. Place it at the root or deeper in the directory tree — agents prefer the nearest `AGENTS.md` to the files they are touching.

No frontmatter required. Write it as if briefing a capable but new engineer.

---

### 6. Copilot coding-agent setup (`.github/workflows/copilot-setup-steps.yml`)

A GitHub Actions workflow with a job named **exactly** `copilot-setup-steps`. Its steps run in the agent's ephemeral environment before Copilot begins work — use it to install languages, package managers, and project dependencies so the agent can build and test changes reliably.

**Configurable job properties:**
- `runs-on` — runner label (standard, larger, or self-hosted)
- `permissions` — limit to what setup actually needs
- `steps` — any valid GitHub Actions steps
- `timeout-minutes` — maximum 59

---

## Adding a new primitive

1. Copy the closest existing example in the relevant directory.
2. Update the frontmatter and body for your use-case.
3. Add a row to the table at the top of this `README.md`.
4. Open a pull request — the `copilot-setup-steps` workflow will validate the YAML automatically.

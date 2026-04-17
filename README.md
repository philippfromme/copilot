# Copilot

Personal GitHub Copilot toolkit — skills, instructions, and prompts deployed to every VS Code workspace via symlinks.

## Quick start

```powershell
# Preview what will be linked
.\deploy.ps1 -WhatIf

# Deploy (requires Developer Mode on Windows)
.\deploy.ps1

# Remove all symlinks
.\undeploy.ps1
```

> **Prerequisite**: Enable Developer Mode in Windows Settings → For Developers. This allows symlink creation without admin privileges.

## What's in the box

| Type         | Source                           | Deployed to                    |
| ------------ | -------------------------------- | ------------------------------ |
| Skills       | [`skills/`](skills/)             | `~\.copilot\skills\`           |
| Instructions | [`instructions/`](instructions/) | `%APPDATA%\Code\User\prompts\` |
| Prompts      | [`prompts/`](prompts/)           | `%APPDATA%\Code\User\prompts\` |
| Agents       | [`agents/`](agents/)             | `%APPDATA%\Code\User\prompts\` |

## Current contents

### Skills

- **carbon-design-system** — IBM Carbon design system tokens, patterns, and component specs

### Instructions

- **typescript** — Type annotations, style, error handling rules for `*.ts`/`*.tsx`
- **carbon-design-system** — Carbon color tokens, spacing, typography, and component rules for CSS/SCSS/HTML/TSX/JSX

### Prompts

- **code-review** — Structured code review with severity levels
- **carbon-component** — Generate UI components using `@carbon/react` and Carbon tokens

### Agents

- **carbon-design-system** — IBM Carbon specialist agent for building compliant UI

## Adding new items

- **Skill**: Create a folder under `skills/<name>/` with a `SKILL.md` file
- **Instruction**: Add a `*.instructions.md` file to `instructions/`
- **Prompt**: Add a `*.prompt.md` file to `prompts/`
- **Agent**: Add a `*.agent.md` file to `agents/`

Then re-run `.\deploy.ps1` to link the new files.

## How it works

`deploy.ps1` creates symlinks from this repo into the locations VS Code reads:

| Target                         | Path                                                                                               |
| ------------------------------ | -------------------------------------------------------------------------------------------------- |
| Skills                         | `~\.copilot\skills\<name>` → `skills\<name>`                                                       |
| Instructions, Prompts & Agents | `%APPDATA%\Code\User\prompts\<file>` → `instructions\<file>`, `prompts\<file>`, or `agents\<file>` |

Because they're symlinks, any edits you make in this repo are immediately picked up by VS Code (after restart).

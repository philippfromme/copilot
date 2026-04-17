---
description: "Use when: creating or styling UI components, writing CSS/SCSS, choosing colors, fonts, spacing, or layout patterns with IBM Carbon. Ensures visual consistency following Carbon design system standards."
applyTo: "**/*.css,**/*.scss,**/*.html,**/*.tsx,**/*.jsx"
---

# IBM Carbon Design System

Apply these rules whenever writing CSS/SCSS or building UI for this project.

## Themes

- Carbon provides four themes: White (default), Gray 10, Gray 90, Gray 100.
- Always use Carbon color tokens (`$background`, `$text-primary`, `$layer-01`, etc.) — never hard-code hex values.
- Use the `Theme` component from `@carbon/react` for inline theming.

## Typography

- One typeface: **IBM Plex** (Sans, Serif, Mono).
- Sans: `'IBM Plex Sans', 'Helvetica Neue', Arial, sans-serif`.
- Mono: `'IBM Plex Mono', 'Menlo', 'DejaVu Sans Mono', Courier, monospace`.
- Use type tokens (`$body-short-01`, `$heading-02`, etc.) — not raw font sizes.
- Weights: Light (300), Regular (400), SemiBold (600).

## Colors

Use role-based tokens, not raw hex values:

| Token | Role |
| ----- | ---- |
| `$background` | Page background |
| `$text-primary` | Primary body text |
| `$text-secondary` | Labels, secondary text |
| `$interactive` | Interactive elements |
| `$link-primary` | Link color |
| `$border-strong` | Strong borders |
| `$border-subtle` | Subtle borders |
| `$support-error` | Error states |
| `$support-success` | Success states |

## Spacing

- Use Carbon spacing tokens: `$spacing-01` (2px) through `$spacing-13` (160px).
- Spacing is built on multiples of 2, 4, and 8.
- Do not use arbitrary spacing values.

## Layout

- Use the Carbon 2x Grid (16-column responsive grid).
- Breakpoints: `sm` (0–671px), `md` (672–1055px), `lg` (1056–1311px), `xlg` (1312–1583px), `max` (1584px+).
- Use `Grid`, `Row`/`Column` or `FlexGrid` components from `@carbon/react`.

## Components

- Use `@carbon/react` components (Button, DataTable, Modal, Notification, Header, etc.).
- Prefer existing Carbon components over custom implementations.

## Buttons

- Variants: Primary, Secondary, Tertiary, Ghost, Danger — each has a defined role.
- One primary button per screen. Labels use `{verb} + {noun}` formula.
- Labels are left-aligned, icons appear to the right.

## Principles

- Accessibility first: all components must meet WCAG 2.1 AA.
- Use Carbon's layering model for stacking UI elements.
- Do not introduce custom colors, fonts, or spacing without explicit approval.

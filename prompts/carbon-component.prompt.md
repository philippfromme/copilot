---
description: "Generate a UI component using IBM Carbon design system and @carbon/react"
argument-hint: "Describe the component to create (e.g. data table, modal, form, notification)"
agent: agent
---

Create a UI component based on the user's description, using `@carbon/react` components and IBM Carbon design system tokens.

## Requirements

- Use `@carbon/react` components whenever a matching component exists (Button, DataTable, Modal, Notification, TextInput, etc.).
- Use Carbon color tokens (`$background`, `$text-primary`, `$interactive`, etc.) — never hard-code hex values.
- Use **IBM Plex Sans** (`'IBM Plex Sans', 'Helvetica Neue', Arial, sans-serif`) for all text.
- Use Carbon spacing tokens (`$spacing-01` through `$spacing-13`) for all margins and padding.
- Use Carbon type tokens (`$body-short-01`, `$heading-02`, etc.) for typography.
- Use the Carbon 2x Grid (`Grid`, `Column`) for layout.
- Follow Carbon button variant rules: one primary per screen, `{verb} + {noun}` labels, left-aligned text.
- All components must meet WCAG 2.1 AA accessibility standards.

## Output

1. The React JSX using `@carbon/react` components and Carbon icons from `@carbon/icons-react`.
2. Any supplementary SCSS using Carbon tokens.
3. A brief note on which Carbon theme and components were used.

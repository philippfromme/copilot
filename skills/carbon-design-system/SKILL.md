---
name: carbon-design-system
description: "IBM Carbon design system tokens, patterns, and rules. Use when: creating or styling UI components, writing CSS, choosing colors, fonts, spacing, layout patterns, or using @carbon/react components. Ensures visual consistency across all pages and components following IBM Carbon standards."
argument-hint: "Describe the component or element to style"
---

# IBM Carbon Design System

Apply the IBM Carbon design system when writing CSS, building UI, or using `@carbon/react` components for this project. Reference files contain detailed specs — load them as needed.

## Reference Files

- [tokens.md](./references/tokens.md) — Colors, typography, spacing values
- [patterns.md](./references/patterns.md) — Layout patterns with code examples
- [components.md](./references/components.md) — Button, UI shell header, data table, modal, notification specs

## Procedure

1. **Read the relevant reference file(s)** before writing any CSS or markup.
2. **Use only documented tokens.** Do not introduce new colors, fonts, or spacing values without user approval.
3. **Follow the rules below.** They are non-negotiable.

## Rules

1. **Four themes available.** White (default), Gray 10, Gray 90, Gray 100. Use Carbon theme tokens — never hard-code color values.
2. **One typeface only.** IBM Plex (Sans, Serif, Mono). No other fonts.
3. **Use Carbon spacing tokens.** All spacing uses `$spacing-01` through `$spacing-13`. Do not invent custom spacing values.
4. **Use Carbon color tokens.** Reference tokens like `$background`, `$text-primary`, `$layer-01`, `$border-strong` — not raw hex values.
5. **Use the 2x Grid.** All layouts follow Carbon's 16-column responsive grid with built-in breakpoints.
6. **Use Carbon components from `@carbon/react`.** Prefer existing components over custom implementations.
7. **Buttons follow Carbon variants.** Primary, Secondary, Tertiary, Ghost, Danger — each has a defined role and emphasis level.
8. **Border-radius follows component specs.** Use Carbon's defined `$border-radius` tokens where applicable.
9. **Typography uses type tokens.** Use productive or expressive type sets (`$heading-01`, `$body-long-01`, etc.) — not raw font sizes.
10. **Accessibility first.** All components must meet WCAG 2.1 AA. Use Carbon's built-in accessible color contrast ratios.

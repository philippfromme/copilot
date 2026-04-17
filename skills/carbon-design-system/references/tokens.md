# Tokens

## Colors

Carbon uses role-based color tokens that adapt across themes. Never hard-code hex values — always use tokens.

### Core Color Tokens

| Token               | Role                       | White Theme Value | Gray 100 Theme Value |
| ------------------- | -------------------------- | ----------------- | -------------------- |
| `$background`       | Page background            | `#ffffff`         | `#161616`            |
| `$text-primary`     | Primary text               | `#161616`         | `#f4f4f4`            |
| `$text-secondary`   | Secondary/label text       | `#525252`         | `#c6c6c6`            |
| `$text-placeholder` | Placeholder text           | `#a8a8a8`         | `#6f6f6f`            |
| `$text-on-color`    | Text on interactive colors | `#ffffff`         | `#ffffff`            |
| `$link-primary`     | Primary links              | `#0f62fe`         | `#78a9ff`            |
| `$link-visited`     | Visited links              | `#8a3ffc`         | `#be95ff`            |
| `$icon-primary`     | Primary icons              | `#161616`         | `#f4f4f4`            |
| `$icon-secondary`   | Secondary icons            | `#525252`         | `#c6c6c6`            |
| `$interactive`      | Interactive elements       | `#0f62fe`         | `#4589ff`            |
| `$focus`            | Focus indicator            | `#0f62fe`         | `#ffffff`            |
| `$border-strong`    | Strong borders             | `#8d8d8d`         | `#6f6f6f`            |
| `$border-subtle`    | Subtle borders             | `#e0e0e0`         | `#393939`            |

### Layer Tokens

| Token       | Role                    |
| ----------- | ----------------------- |
| `$layer-01` | First layer background  |
| `$layer-02` | Second layer background |
| `$layer-03` | Third layer background  |
| `$field-01` | Input field on layer 01 |
| `$field-02` | Input field on layer 02 |
| `$field-03` | Input field on layer 03 |

### Interactive State Tokens

| Token                  | Role                       |
| ---------------------- | -------------------------- |
| `$layer-hover-01`      | Hover on layer 01          |
| `$layer-active-01`     | Active/pressed on layer 01 |
| `$layer-selected-01`   | Selected on layer 01       |
| `$background-hover`    | Background hover           |
| `$background-active`   | Background active          |
| `$background-selected` | Background selected        |

### Support Tokens

| Token              | Role              |
| ------------------ | ----------------- |
| `$support-error`   | Error state       |
| `$support-success` | Success state     |
| `$support-warning` | Warning state     |
| `$support-info`    | Information state |

## Typography

### Font Families

| Role           | Font             | Fallback Stack                                                                |
| -------------- | ---------------- | ----------------------------------------------------------------------------- |
| **Sans-serif** | `IBM Plex Sans`  | `'Helvetica Neue', Arial, sans-serif`                                         |
| **Serif**      | `IBM Plex Serif` | `Georgia, Times, serif`                                                       |
| **Monospace**  | `IBM Plex Mono`  | `'Menlo', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Courier, monospace` |

### Type Scale

| Step | rem   | px  |
| ---- | ----- | --- |
| 1    | 0.75  | 12  |
| 2    | 0.875 | 14  |
| 3    | 1     | 16  |
| 4    | 1.125 | 18  |
| 5    | 1.25  | 20  |
| 6    | 1.5   | 24  |
| 7    | 1.75  | 28  |
| 8    | 2     | 32  |
| 9    | 2.25  | 36  |
| 10   | 2.625 | 42  |
| 11   | 3     | 48  |

### Type Tokens (Productive Set)

| Token              | Size | Line Height | Weight   | Use                  |
| ------------------ | ---- | ----------- | -------- | -------------------- |
| `$label-01`        | 12px | 16px        | Regular  | Labels, helper text  |
| `$helper-text-01`  | 12px | 16px        | Regular  | Helper/hint text     |
| `$body-short-01`   | 14px | 18px        | Regular  | Short body copy      |
| `$body-long-01`    | 14px | 20px        | Regular  | Long-form body copy  |
| `$body-compact-01` | 14px | 18px        | Regular  | Compact body copy    |
| `$heading-01`      | 14px | 18px        | SemiBold | Smallest heading     |
| `$heading-02`      | 16px | 22px        | SemiBold | Second heading level |
| `$heading-03`      | 20px | 28px        | Regular  | Third heading level  |
| `$heading-04`      | 28px | 36px        | Regular  | Fourth heading level |
| `$heading-05`      | 32px | 40px        | Light    | Large heading        |

### Weights

| Weight   | Value | Usage                     |
| -------- | ----- | ------------------------- |
| Light    | 300   | Large headings            |
| Regular  | 400   | Body text, paragraphs     |
| SemiBold | 600   | Section headers, emphasis |

## Spacing

Carbon spacing is built on multiples of 2, 4, and 8.

### Spacing Scale

| Token         | rem   | px  |
| ------------- | ----- | --- |
| `$spacing-01` | 0.125 | 2   |
| `$spacing-02` | 0.25  | 4   |
| `$spacing-03` | 0.5   | 8   |
| `$spacing-04` | 0.75  | 12  |
| `$spacing-05` | 1     | 16  |
| `$spacing-06` | 1.5   | 24  |
| `$spacing-07` | 2     | 32  |
| `$spacing-08` | 2.5   | 40  |
| `$spacing-09` | 3     | 48  |
| `$spacing-10` | 4     | 64  |
| `$spacing-11` | 5     | 80  |
| `$spacing-12` | 6     | 96  |
| `$spacing-13` | 10    | 160 |

### Applying Spacing

```scss
margin: $spacing-03;
margin: $spacing-03 $spacing-01;
margin: $spacing-07 0 $spacing-04 0;
padding: $spacing-05 $spacing-03;
```

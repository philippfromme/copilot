# Layout Patterns

## 2x Grid

Carbon uses a responsive 16-column grid based on the IBM 2x Grid. All layouts should be built on this grid.

```scss
@use "@carbon/react/scss/grid";

// Wrap page content in the grid
// <div class="cds--grid">
//   <div class="cds--row">
//     <div class="cds--col-lg-8 cds--col-md-4 cds--col-sm-2">
//       Content
//     </div>
//   </div>
// </div>
```

### Breakpoints

| Breakpoint | Token | Width       | Columns | Margin |
| ---------- | ----- | ----------- | ------- | ------ |
| Small      | `sm`  | 0–671px     | 4       | 0      |
| Medium     | `md`  | 672–1055px  | 8       | 16px   |
| Large      | `lg`  | 1056–1311px | 16      | 16px   |
| X-Large    | `xlg` | 1312–1583px | 16      | 16px   |
| Max        | `max` | 1584px+     | 16      | 24px   |

### Gutter Modes

| Mode           | Gutter Size | Use Case                      |
| -------------- | ----------- | ----------------------------- |
| Wide (default) | 32px        | Most layouts                  |
| Narrow         | 16px        | Dense content areas           |
| Condensed      | 1px         | Data tables, structured lists |

```jsx
<Grid narrow>
  <Column lg={8} md={4} sm={2}>
    Content
  </Column>
</Grid>
```

## Theme Configuration

### Default Theme (White)

```scss
@use "@carbon/react";
```

### Switching Themes

```scss
@use "@carbon/react/scss/themes";
@use "@carbon/react/scss/theme" with (
  $theme: themes.$g100
);
```

### Inline Theming (in React)

```jsx
import { Theme } from "@carbon/react";

<Theme theme="g100">
  <ChildComponent />
</Theme>;
```

Use inline theming for high-contrast sections (e.g., dark UI shell on a light page).

## Layering Model

Components stack on layers. Each layer uses a corresponding set of layering tokens.

| Layer | Background Token | Field Token | Border Token        |
| ----- | ---------------- | ----------- | ------------------- |
| Base  | `$background`    | `$field-01` | `$border-strong-01` |
| 01    | `$layer-01`      | `$field-02` | `$border-strong-02` |
| 02    | `$layer-02`      | `$field-03` | `$border-strong-03` |
| 03    | `$layer-03`      | —           | —                   |

### Contextual Layering (React)

```jsx
import { Layer } from "@carbon/react";

<Layer>
  <ChildComponent /> {/* Uses layer 01 tokens */}
  <Layer>
    <ChildComponent /> {/* Uses layer 02 tokens */}
  </Layer>
</Layer>;
```

## Stacking (Spacing Between Components)

```jsx
import { Stack } from "@carbon/react";

<Stack gap={6}>
  {" "}
  {/* $spacing-06 = 24px */}
  <Component1 />
  <Component2 />
  <Component3 />
</Stack>;
```

## Links

```scss
// Links use $link-primary color with underline
a {
  color: $link-primary;
  text-decoration: underline;
}
```

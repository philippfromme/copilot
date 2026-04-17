# Components

All components come from `@carbon/react`. Prefer using Carbon components over custom implementations.

## Buttons

### Variants

| Variant       | Role                                  | Usage                                            |
| ------------- | ------------------------------------- | ------------------------------------------------ |
| **Primary**   | Principal call to action              | One per screen. High emphasis.                   |
| **Secondary** | Negative/cancel actions               | Always paired with primary.                      |
| **Tertiary**  | Independent or less prominent actions | Can be used alone or in groups.                  |
| **Ghost**     | Least prominent actions               | Supplementary actions, flush against containers. |
| **Danger**    | Destructive actions (delete, remove)  | Available in primary, tertiary, ghost styles.    |

### Usage (React)

```jsx
import { Button } from '@carbon/react';
import { Add } from '@carbon/icons-react';

<Button>Primary</Button>
<Button kind="secondary">Secondary</Button>
<Button kind="tertiary">Tertiary</Button>
<Button kind="ghost">Ghost</Button>
<Button kind="danger">Danger</Button>
<Button renderIcon={Add}>With icon</Button>
```

### Sizes

| Size  | Height | Use Case                                       |
| ----- | ------ | ---------------------------------------------- |
| `xs`  | 24px   | Constrained vertical space                     |
| `sm`  | 32px   | Paired with 32px inputs                        |
| `md`  | 40px   | Paired with 40px inputs                        |
| `lg`  | 48px   | Most common in products (default)              |
| `xl`  | 64px   | Bleeds to container edge (modals, side panels) |
| `2xl` | 80px   | Full-screen containers (large tearsheets)      |

### Button Rules

- Only one primary button per screen (except temporary flows).
- Labels use `{verb} + {noun}` formula (e.g., "Add user", "Delete item").
- Labels are always left-aligned, not centered.
- Icons appear to the right of the label, 16px size (20px for large expressive).
- In button groups, all buttons should be the same width.

## UI Shell Header

The header spans the full viewport width and is the topmost, persistent navigation element.

```jsx
import {
  Header,
  HeaderName,
  HeaderNavigation,
  HeaderMenuItem,
  HeaderGlobalBar,
  HeaderGlobalAction,
} from "@carbon/react";
import {
  Search,
  Notification,
  Switcher as SwitcherIcon,
} from "@carbon/icons-react";

<Header aria-label="Platform Name">
  <HeaderName href="/" prefix="IBM">
    [Platform]
  </HeaderName>
  <HeaderNavigation aria-label="Navigation">
    <HeaderMenuItem href="/page1">Link 1</HeaderMenuItem>
    <HeaderMenuItem href="/page2">Link 2</HeaderMenuItem>
  </HeaderNavigation>
  <HeaderGlobalBar>
    <HeaderGlobalAction aria-label="Search">
      <Search size={20} />
    </HeaderGlobalAction>
    <HeaderGlobalAction aria-label="Notifications">
      <Notification size={20} />
    </HeaderGlobalAction>
  </HeaderGlobalBar>
</Header>;
```

### Header Rules

- Header name is always preceded by "IBM" for IBM products.
- Left-to-right = product-to-global scope.
- Utility icons are right-aligned with no gaps.
- Icon order (right to left): Switcher, Account, Notifications, Help, Other, Search.
- Header links collapse into hamburger menu on small screens.

## Data Table

```jsx
import {
  DataTable,
  Table,
  TableHead,
  TableRow,
  TableHeader,
  TableBody,
  TableCell,
} from "@carbon/react";

const headers = [
  { key: "name", header: "Name" },
  { key: "status", header: "Status" },
];
const rows = [{ id: "1", name: "Item A", status: "Active" }];

<DataTable rows={rows} headers={headers}>
  {({ rows, headers, getTableProps, getHeaderProps, getRowProps }) => (
    <Table {...getTableProps()}>
      <TableHead>
        <TableRow>
          {headers.map((header) => (
            <TableHeader {...getHeaderProps({ header })}>
              {header.header}
            </TableHeader>
          ))}
        </TableRow>
      </TableHead>
      <TableBody>
        {rows.map((row) => (
          <TableRow {...getRowProps({ row })}>
            {row.cells.map((cell) => (
              <TableCell key={cell.id}>{cell.value}</TableCell>
            ))}
          </TableRow>
        ))}
      </TableBody>
    </Table>
  )}
</DataTable>;
```

## Modal

```jsx
import { Modal } from "@carbon/react";

<Modal
  open={isOpen}
  onRequestClose={() => setIsOpen(false)}
  modalHeading="Modal title"
  primaryButtonText="Confirm"
  secondaryButtonText="Cancel"
>
  <p>Modal content goes here.</p>
</Modal>;
```

## Notification

```jsx
import { InlineNotification, ToastNotification } from '@carbon/react';

<InlineNotification
  kind="error"
  title="Error"
  subtitle="Something went wrong."
/>

<ToastNotification
  kind="success"
  title="Success"
  subtitle="Action completed."
  timeout={5000}
/>
```

### Notification Kinds

| Kind      | Color Token        | Usage                        |
| --------- | ------------------ | ---------------------------- |
| `error`   | `$support-error`   | Errors requiring user action |
| `success` | `$support-success` | Confirmed successful actions |
| `warning` | `$support-warning` | Potential issues             |
| `info`    | `$support-info`    | Neutral information          |

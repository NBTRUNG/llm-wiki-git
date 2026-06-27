---
name: ui-interaction-patterns
description: UI interaction guidance for controls, states, keyboard behavior, menus, tabs, forms, tables, and workflow ergonomics.
date_ingested: 2026-06-27
status: active
source_type: web-research + project-file-back
source_urls:
  - https://www.w3.org/WAI/ARIA/apg/
confidence: medium
confidence_reviewed: 2026-06-27
---

# interaction patterns

## purpose

Use this guide when changing how users operate a UI: forms, navigation, filters,
tables, dialogs, menus, tabs, segmented controls, toolbars, drawers, command
buttons, or keyboard behavior.

## baseline

- Use familiar controls for familiar jobs.
- Make primary actions visible and predictable.
- Keep destructive or irreversible actions explicit and reversible when
  possible.
- Preserve keyboard and pointer operation.
- Make state changes visible where users need confirmation.
- Keep dense operational tools scan-friendly rather than marketing-like.

## control mapping

- Binary setting: checkbox, switch, or toggle.
- Small option set: segmented control, radio group, or tabs depending on
  whether the choice changes mode, value, or view.
- Large option set: select, combobox, command menu, or filter popover.
- Numeric value: input, stepper, or slider depending on precision.
- Repeated data: table, list, board, or grid with stable row/item behavior.
- Tool action: icon button with accessible name and tooltip when meaning is not
  obvious.
- Confirmation: modal/dialog only when the action needs interruption.

## state coverage

For touched interactions, account for:

- default;
- hover;
- focus;
- active/pressed;
- selected/current;
- disabled;
- loading;
- empty;
- error;
- permission denied when relevant.

## anti-patterns

- Using custom div controls where native controls would work.
- Making a mode change look like a one-time command.
- Hiding required actions behind hover-only affordances.
- Adding confirmation dialogs for low-risk actions while leaving high-risk
  actions ambiguous.
- Shipping keyboard behavior that differs from the visual model.

## related

- Accessibility: [[accessibility.md]]
- Visual quality: [[visual-quality.md]]
- Design-system components: [[design-system-components.md]]

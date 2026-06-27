---
name: ui-accessibility
description: Accessibility acceptance checks for UI implementation and review. Uses WCAG 2.2 and WAI-ARIA APG as baseline references.
date_ingested: 2026-06-27
status: active
source_type: web-research
source_urls:
  - https://www.w3.org/TR/WCAG22/
  - https://www.w3.org/WAI/ARIA/apg/
confidence: high
confidence_reviewed: 2026-06-27
---

# accessibility

## purpose

Use this guide when creating, changing, or reviewing user-facing UI.

Project accessibility requirements and legal/compliance rules win. When absent,
use WCAG 2.2 and WAI-ARIA Authoring Practices as the baseline.

## baseline checks

- Use native HTML controls before custom ARIA widgets.
- Every interactive control has an accessible name.
- Keyboard users can reach, operate, and leave every interactive element.
- Focus order follows the visual/task order.
- Focus is visible and not hidden behind author-created sticky headers,
  overlays, drawers, or popovers.
- Text and non-text contrast meet the project baseline.
- Errors are identified, described, and recoverable.
- Authentication and form workflows avoid forcing users to remember or re-enter
  information when a safer autocomplete, paste, password manager, or redundant
  entry avoidance path is appropriate.
- Responsive reflow does not hide controls or force incoherent overlap.
- Touch/pointer targets are usable for the project's density.
- Dragging interactions have a non-dragging alternative when the action matters.
- Motion respects reduced-motion expectations.
- ARIA roles, states, and properties match the actual behavior.

## wcag 2.2 watchpoints

For new or changed UI, explicitly check the WCAG 2.2 additions most likely to
be missed in product work:

- focus not obscured by fixed/sticky UI;
- focus appearance visible enough to locate the active control;
- dragging alternatives for reorder, resize, slider-like, or canvas actions;
- target size minimums or documented exceptions;
- accessible authentication and password-manager/paste support;
- redundant entry avoidance in multi-step forms.

## when to require deeper review

Require human or specialist review when the task adds or changes:

- authentication, payment, admin, healthcare, finance, education, or legally
  sensitive workflows;
- custom combobox, menu, dialog, tab, tree, grid, drag/drop, or rich text
  widgets;
- keyboard shortcuts, focus traps, overlays, or route transitions;
- color-only status communication or dense data tables.

## evidence

Acceptable evidence depends on risk:

- keyboard walkthrough notes;
- browser/screen-reader spot check;
- automated accessibility scan with manual follow-up for known gaps;
- screenshots for focus/error/empty/loading/responsive states;
- component tests for ARIA states where supported.

## anti-patterns

- Adding ARIA to a custom element when a native element would work.
- Hiding functionality from keyboard users.
- Using color alone for status or errors.
- Shipping an overlay that traps focus or loses focus on close.
- Treating an automated accessibility scan as complete proof.

## related

- Design-system guide: [[../project-docs/design_system.md]]
- Interaction patterns: [[interaction-patterns.md]]
- Visual quality: [[visual-quality.md]]

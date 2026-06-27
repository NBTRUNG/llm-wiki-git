---
name: ui-visual-quality
description: Visual QA guidance for responsive UI, state coverage, screenshots, layout stability, and text/no-overlap checks.
date_ingested: 2026-06-27
status: active
source_type: project-file-back
confidence: medium
confidence_reviewed: 2026-06-27
---

# visual quality

## purpose

Use this guide when a task changes visible UI, layout, component states, or
responsive behavior.

Visual quality is not decoration. It is part of output correctness because
users need to scan, compare, read, and operate the interface without overlap or
unexpected shifts.

## baseline checks

- Text fits inside controls and cards at target viewports.
- Controls do not overlap, clip, or jump when state changes.
- Loading, empty, error, disabled, selected, focus, hover, and active states are
  coherent for touched components.
- Responsive layouts preserve content priority and action availability.
- Fixed-format elements such as boards, grids, counters, tiles, and toolbars
  have stable dimensions.
- Visual hierarchy matches task importance; compact panels do not use hero
  scale type.
- Screenshots or browser checks cover the changed viewport(s).
- Accessibility basics are not sacrificed for visual polish.

## evidence

For user-facing UI work, prefer:

- desktop and mobile screenshots;
- browser route smoke;
- state screenshots for loading/error/empty/focus when applicable;
- note of viewport sizes checked;
- Playwright or equivalent screenshot checks when the repo supports them.

## anti-patterns

- Approving UI from code review only when layout changed materially.
- Relying on one desktop viewport for responsive work.
- Letting labels overflow buttons, tabs, cards, or sidebars.
- Adding decorative structure that competes with the primary workflow.
- Hiding broken state coverage behind a happy-path screenshot.

## related

- Accessibility: [[accessibility.md]]
- Web Vitals: [[../frontend/web-vitals.md]]
- Design-system components: [[design-system-components.md]]

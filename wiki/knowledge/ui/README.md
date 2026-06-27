---
name: ui-knowledge
description: UI and UX implementation knowledge for interaction patterns, accessibility, visual quality, responsive states, and design-system component contracts.
date_ingested: 2026-06-27
status: active
source_type: web-research
source_urls:
  - https://www.w3.org/TR/WCAG22/
  - https://www.w3.org/WAI/ARIA/apg/
  - https://www.designtokens.org/tr/drafts/format/
confidence: medium
confidence_reviewed: 2026-06-27
---

# ui knowledge

This folder owns UI/UX implementation knowledge: component behavior, visual
quality, accessibility, responsive states, and design-system contracts.

It complements frontend engineering:

- `ui/` = what the user sees, understands, and can operate.
- `frontend/` = how the browser/framework delivers it.

## index

- [[accessibility.md]] — WCAG/ARIA-oriented acceptance checks for UI work.
- [[visual-quality.md]] — responsive visual QA, state coverage, screenshots,
  and no-overlap rules.
- [[interaction-patterns.md]] — controls, keyboard behavior, states, and
  workflow ergonomics.
- [[design-system-components.md]] — component contract shape and token/component
  boundaries.

## when to use

Use this folder when a task touches:

- UI layout, component states, forms, navigation, modals, drawers, tabs, menus,
  tables, dashboards, or page workflows;
- visual design, responsive behavior, copy inside controls, density, or
  state/error/empty/loading presentation;
- accessibility, keyboard navigation, focus, labels, ARIA, contrast, or target
  size;
- design-system tokens, component contracts, or screenshots/visual proof.

For React/Next.js performance, also use [[../frontend/README.md]].

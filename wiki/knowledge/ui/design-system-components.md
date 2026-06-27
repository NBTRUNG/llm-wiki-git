---
name: design-system-components
description: Component contract guidance for design-system-backed UI work.
date_ingested: 2026-06-27
status: active
source_type: web-research + project-file-back
source_urls:
  - https://www.designtokens.org/tr/drafts/format/
  - https://www.w3.org/TR/WCAG22/
confidence: medium
confidence_reviewed: 2026-06-27
---

# design-system components

## purpose

Use this guide when adding, changing, or reviewing durable UI components and
their design-system contracts.

## component contract

Each durable component should define:

- purpose and when not to use it;
- props/inputs and emitted events;
- default, hover, focus, active, disabled, loading, selected, empty, and error
  states as applicable;
- keyboard behavior and focus management;
- accessible name, role, and state expectations;
- responsive and density behavior;
- semantic tokens consumed;
- visual and accessibility validation required before acceptance.

## token boundary

- Components consume semantic tokens, not raw palette accidents.
- Generated token outputs must not become canonical token sources.
- Component source, design-system docs, and UI maps should point to one
  canonical token contract.

## anti-patterns

- Calling a component reusable without documenting states and accessibility.
- Hardcoding raw colors and spacing inside component logic.
- Maintaining duplicate component contracts in design docs, UI maps, and code
  comments.
- Treating visual screenshots as a substitute for keyboard and state behavior.

## related

- Design-system guide: [[../project-docs/design_system.md]]
- Accessibility: [[accessibility.md]]
- Visual quality: [[visual-quality.md]]

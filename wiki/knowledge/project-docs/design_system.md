---
name: design-system-guide
description: Source-backed standard for creating or reviewing project design-system docs, tokens, component contracts, accessibility gates, and UI ownership maps.
date_ingested: 2026-06-11
status: active
source_type: web-research
source_urls:
  - https://www.designtokens.org/tr/drafts/format/
  - https://styledictionary.com/info/tokens/
  - https://www.w3.org/TR/WCAG22/
  - https://www.w3.org/WAI/ARIA/apg/
  - https://carbondesignsystem.com/guidelines/accessibility/overview/
confidence: medium
confidence_reviewed: 2026-06-11
---

# design system guide

## purpose

Use this guide when a project needs a durable design-system source of truth:
tokens, components, interaction patterns, accessibility expectations, and UI
ownership boundaries.

This guide is for product/application UIs, admin tools, design-system libraries,
and UI-heavy repos. It is not a branding mood board and not a replacement for
real component code.

## recommended repo files

Use project-specific names, but keep one owner for each concern.

```text
docs/design_system.md      stable design-system contract
ui_map/_CONTRACTS.md       optional canonical UI contract registry
ui_map/_UI_ROUTER.md       routes and ownership
ui_map/_UI_WORKFLOW.md     user journeys and page logic
ui_map/group-*.md          detailed page/panel maps
tokens/*.tokens.json       design tokens source, if tokens are used
```

If a repo declares `ui_map/_CONTRACTS.md` as the canonical contract registry,
`AGENTS.md` or the repo source map must say so explicitly. Do not maintain a
duplicate editable `docs/contracts.md` for the same UI contracts.

## design-system layers

Use four layers:

1. **Foundations** — color, typography, spacing, motion, elevation, radius,
   layout, iconography, density.
2. **Tokens** — named design decisions in a platform-neutral source format.
3. **Components and patterns** — reusable UI parts plus behavior, states,
   accessibility, and content rules.
4. **Product composition** — page templates, routes, workflows, and exceptions.

Do not call a component library a design system unless it also has rules,
accessibility expectations, ownership, and documentation.

## token rules

Design tokens should express design decisions, not raw implementation accidents.

Minimum token groups:

- color
- typography
- spacing
- size
- radius
- border
- shadow/elevation
- motion duration/easing
- z-index/layer

Use semantic tokens for UI use:

```text
color.background.surface
color.text.primary
color.text.danger
color.border.subtle
space.inline.md
motion.duration.fast
```

Raw palette tokens may exist, but components should consume semantic tokens.

The DTCG Design Tokens Format Module is useful as an interoperability reference,
but the 2025.10 document is a preview draft and says not to treat that preview
as authoritative. For production, record the exact token format version or tool
contract a repo accepts.

Style Dictionary or an equivalent translation tool may convert token sources
into platform-specific outputs. Generated outputs must be marked generated and
must not become the canonical token source.

## component contract shape

Each durable component should document:

- Purpose and when not to use it.
- Props/inputs and emitted events.
- States: default, hover, focus, active, disabled, loading, selected, error,
  empty.
- Keyboard behavior.
- ARIA role/name/state expectations when native HTML is not enough.
- Responsive/density behavior.
- Theming tokens consumed.
- Validation and screenshots required before acceptance.

Prefer native HTML semantics. Use ARIA patterns only when a native element cannot
represent the interaction.

## accessibility gates

Use WCAG 2.2 as the default web accessibility baseline unless the project has a
stricter legal or product requirement.

Minimum gates:

- Keyboard access and visible focus.
- No keyboard trap.
- Text contrast and non-text contrast checked.
- Target size and pointer alternatives checked for dense controls.
- Error identification and recovery.
- Motion respects reduced-motion expectations.
- Screen-reader names for interactive controls.
- Meaningful order after responsive changes.

Accessibility is part of design-system acceptance, not a post-implementation
cleanup task.

## UI-heavy project rule

For UI-heavy projects, add a source-map section that says where the canonical UI
truth lives:

```text
Canonical UI contracts:
Canonical route map:
Canonical workflow map:
Canonical token source:
Canonical component docs:
Generated outputs:
```

This prevents agents from guessing between `docs/contracts.md`, `ui_map/`,
component source, and design files.

## review checklist

- One canonical contract registry is declared.
- Token source is separated from generated outputs.
- Semantic tokens exist for component consumption.
- Components document states, keyboard behavior, accessibility, and validation.
- WCAG 2.2 baseline is named or an accepted stricter baseline is linked.
- Route/workflow ownership is clear for UI-heavy repos.
- Screenshots or visual checks are required for user-facing UI changes.
- Design decisions that affect architecture or contracts have ADRs.

## anti-patterns

- Treating a Figma file as the only source of truth for implemented UI.
- Creating raw color/spacing constants directly inside components.
- Maintaining multiple editable contract registries.
- Shipping a component without keyboard and screen-reader behavior.
- Using ARIA to patch avoidable non-semantic markup.
- Letting generated token outputs drift from token source.
- Calling visual polish complete without viewport and state coverage.

## relationship to LLM-Wiki

- Architecture skill guide: [[architecture_skill.md]]
- Project architecture doc guide: [[architecture.md]]
- Contracts guide: [[contracts.md]]
- Review checklist: [[review_checklist.md]]
- UI-heavy read planning should point agents to the canonical UI contract paths
  declared by the repo.

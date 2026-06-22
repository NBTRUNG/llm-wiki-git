# Validation: architecture skill and design-system web research ingest

Date: 2026-06-11

## scope

User requested internet research before continuing, to update architecture-skill
and design-system guidance for LLM-Wiki.

Implemented:

- Added `wiki/knowledge/project-docs/architecture_skill.md`.
- Added `wiki/knowledge/project-docs/design_system.md`.
- Added `templates/design_system.template.md`.
- Updated catalogs in `index.md`, `wiki/knowledge/README.md`,
  `wiki/knowledge/project-docs/README.md`, and `templates/README.md`.

## sources used

Architecture:

- C4 model official site: `https://c4model.com/`
- arc42 documentation: `https://docs.arc42.org/home/`
- ADR GitHub organization: `https://adr.github.io/`
- CNCF Platforms White Paper:
  `https://tag-app-delivery.cncf.io/whitepapers/platforms/`
- OpenTelemetry docs:
  `https://opentelemetry.io/docs/what-is-opentelemetry/`

Design system:

- Design Tokens Format Module 2025.10:
  `https://www.designtokens.org/tr/drafts/format/`
- Style Dictionary token docs: `https://styledictionary.com/info/tokens/`
- WCAG 2.2: `https://www.w3.org/TR/WCAG22/`
- WAI-ARIA Authoring Practices Guide: `https://www.w3.org/WAI/ARIA/apg/`
- Carbon accessibility overview:
  `https://carbondesignsystem.com/guidelines/accessibility/overview/`

## important source notes

- DTCG Design Tokens Format Module 2025.10 is a preview draft and explicitly
  says not to treat that preview as authoritative. LLM-Wiki records it as an
  interoperability reference, not a binding production standard.
- WCAG 2.2 is recorded as the default accessibility baseline for web UI unless a
  concrete repo declares a stricter legal/product baseline.
- OpenTelemetry is recorded as instrumentation/export/collection framework and
  toolkit, not a telemetry backend.

## validation

Command:

```text
bash harness/feedback-loop-lint.sh
```

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```

## result

Implemented locally. The new knowledge guides are source-backed and indexed.

## gaps

- No real project has consumed the new design-system guide yet; confidence is
  `medium` until first project feedback.
- The guide does not choose a specific UI framework or component library.

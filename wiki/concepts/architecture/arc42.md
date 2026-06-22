---
name: arc42
description: 12-section template for software architecture documentation. All sections optional; use what fits the project. Use when writing or reviewing architecture.md for a real repo.
source_type: external-research
source_urls:
  - https://arc42.org/overview
  - https://docs.arc42.org
  - https://github.com/arc42/arc42-template
date_ingested: 2026-05-23
confidence: medium
confidence_reviewed: 2026-05-23
applicable_contexts: pending first project use
status: active
---

# arc42

Open-source template for architecture documentation, created by Dr. Gernot
Starke and Dr. Peter Hruschka. Tool-agnostic, scalable from small to enterprise
projects.

**Key rule:** every section is optional. The template is a cabinet — empty
drawers are fine. Fill what is meaningful for this project, leave the rest.

## the 12 sections

| # | Section | Purpose |
|---|---|---|
| 1 | Introduction and goals | Requirements summary, top 3-5 quality goals, key stakeholders |
| 2 | Architecture constraints | Technical and organizational constraints that bind design decisions |
| 3 | Context and scope | System boundary, external interfaces, communication partners |
| 4 | Solution strategy | Fundamental decisions and approaches that shape the architecture |
| 5 | Building block view | Hierarchical decomposition into modules, components, classes |
| 6 | Runtime view | How blocks interact at runtime — sequences, processes, scenarios |
| 7 | Deployment view | Environments, infrastructure, channels, processors |
| 8 | Crosscutting concepts | Patterns and conventions applied across the system (logging, auth, error handling, i18n) |
| 9 | Architecture decisions | Important decisions with rationale — use ADRs (see [[adr.md]]) |
| 10 | Quality requirements | Quality goals as scenarios (see [[quality-attributes.md]]) |
| 11 | Risks and technical debt | Known risks, technical debt, things the team feels miserable about |
| 12 | Glossary | Domain and technical terms, translation reference |

## key principles

- **Optional**: do not force every section. A start-up may need only 1, 3, 5, 9.
- **Flexible order**: write sections in any order the project needs.
- **Tool-agnostic**: works in wiki, Markdown, Asciidoc, Word, Confluence, anything.
- **Scalable**: same template for a hobby project and a 100-engineer system.

## when to use arc42

- New repo needs a baseline `wiki/architecture.md`.
- Existing architecture doc is unstructured and onboarding is painful.
- Team wants a shared vocabulary for architecture conversations.

## when NOT to use arc42

- Project is too small to have meaningful architecture (a single script).
- Team already has working documentation that newcomers can follow.
- Adopting arc42 would replace better existing structure with worse.

## mapping to C4 and ADR

| arc42 section | Maps to |
|---|---|
| 3 Context and scope | C4 Level 1 (see [[c4-model.md]]) |
| 5 Building block view | C4 Level 2 + Level 3 (see [[c4-model.md]]) |
| 7 Deployment view | C4 deployment diagrams |
| 9 Architecture decisions | ADRs (see [[adr.md]]) |
| 10 Quality requirements | Quality attribute scenarios (see [[quality-attributes.md]]) |

## anti-patterns

- Filling sections with placeholder text because the template has a slot.
- Treating the section order as mandatory.
- Letting section 9 become a feature list rather than decisions with rationale.
- Letting section 11 become aspirational risk ("we should improve testing")
  rather than concrete debt.

## sources

- Official: https://arc42.org/overview
- Docs: https://docs.arc42.org
- GitHub: https://github.com/arc42/arc42-template

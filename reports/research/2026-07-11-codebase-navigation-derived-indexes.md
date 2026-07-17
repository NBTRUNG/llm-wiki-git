# Research brief - Codebase navigation and derived indexes

Topic: Managing codebase navigation without documentation write amplification
Date: 2026-07-11
Owner: LLM-Wiki
Cadence reason: ad hoc, explicitly requested after U17 tiny-task evidence
Status: promoted

## decision need

- Decide what a manually maintained code map should own, what should be derived
  from source, and when specialized indexing infrastructure has enough ROI.
- Target doc: `wiki/knowledge/project-docs/codebase_navigation.md`.

## search/tool bounds

- Primary/official Google, Meta, Microsoft, GitHub, and Backstage sources.
- Focus: source-of-truth, symbol/search indexes, incrementality, ownership, and
  documentation discovery.
- Excluded: choosing an indexing vendor, implementing a U17 indexer, and
  treating vendor-scale architecture as a default for small repositories.
- Complete consulted-source log:
  `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-11-codebase-navigation-derived-indexes-sources.md`.

## sources checked

| Source | Type | Relevance |
| --- | --- | --- |
| Google monorepo paper | primary research | Common code source-of-truth plus specialized infrastructure |
| Google developer code-search study | primary research | Human search behavior and familiar-code landmark use |
| Google Code Search/Kythe | official engineering | Build-derived definition/reference graph |
| Meta Glean | official engineering | Central/incremental fact index and stable symbol identity |
| Microsoft LSP/LSIF | official specification | Portable semantic navigation and stored artifact graph |
| GitHub code navigation | official documentation | Automatically extracted symbols/definitions/references |
| Backstage Catalog/TechDocs | official project documentation | Higher-level ownership/discovery/docs layer |

## findings

| Finding | Confidence | Classification | Applies when | Do not apply when |
| --- | --- | --- | --- | --- |
| Code stays authoritative; navigation indexes are derived and rebuildable. | high | candidate-update | Symbol/reference navigation | An index is being mistaken for live code truth |
| Stable symbol/semantic IDs tolerate movement better than manual line offsets. | high | candidate-update | Code regions have names/selectors/comments or parser identities | Dynamic/string-only relationships need textual/runtime fallback |
| Incremental indexing bounds refresh work to changes plus dependency fanout. | medium-high | candidate-update | Index cost is material and dependency extraction exists | Small repo where on-demand search is cheaper |
| Humans use familiar landmarks as a cognitive cache, but memory is local and can become stale. | medium | candidate-update | Experienced maintainer navigation | Shared/onboarding/audit truth |
| Component catalogs/docs and code-symbol indexes solve different levels of discovery. | high | candidate-update | Multi-layer navigation design | One file is expected to duplicate all layers |

## promoted guidance

- A semantic map changes only when topology, stable identifiers, ownership,
  contracts, major dependencies, or verifier routes change.
- Ordinary internal code edits do not require updating every map.
- File/line spans are optional revision-qualified hints or generated output.
- Specialized index infrastructure requires repeated evidence that existing
  LSP/IDE/search plus semantic maps are insufficient.

## validation plan

- Verify the guide names canonical/semantic/derived/conversation-memory layers.
- Verify it contains update/no-update rules and an ROI escalation ladder.
- Run active Markdown link and feedback-loop lint.
- In U17, test the model on 3-5 comparable tiny tasks before changing the
  repo's map schema or building a generator.

## reviewer decision

- Decision: promote.
- Reason: explicit human request, primary sources, and direct U17 evidence;
  guidance remains tool-neutral and does not authorize new infrastructure.
- Validation report:
  `reports/validation/2026-07-11-codebase-navigation-management.md`.

## next review

- Revisit after repeated stale-map incidents, measurable navigation delay, or
  a real derived-index prototype/evaluation.

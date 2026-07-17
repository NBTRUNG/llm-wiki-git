---
name: codebase-navigation
description: Manage codebase discovery with authoritative code, stable semantic maps, disposable derived indexes, and evidence-gated automation instead of per-task documentation write amplification.
source_type: current-source-research-plus-project-evidence
source_project: llm-wiki and UniversityWeb-U17
date_ingested: 2026-07-11
date_updated: 2026-07-11
confidence: medium
confidence_reviewed: 2026-07-11
applicable_contexts:
  - repositories using code maps, UI maps, data maps, or agent task packets
  - multi-agent or rotating-maintainer codebases
  - codebase navigation and derived-index ROI decisions
status: active
revision_trigger: Review after repeated stale-map misses, material navigation delay, a derived-index pilot, or a change in repository scale/language/tooling.
source_evidence:
  - /home/admindebian/Agent-Platform/raw/projects/llm-wiki/research/2026-07-11-codebase-navigation-derived-indexes-sources.md
  - reports/research/2026-07-11-codebase-navigation-derived-indexes.md
  - /home/admindebian/UniversityWeb-U17/reports/agent/deepseek-20260711/U17-UI-FIX-20260711-result.md
---

# Codebase navigation and derived-index management

## intent

Help humans and agents reach the smallest correct code region without making
map/report maintenance cost exceed the code change itself.

## four layers

```text
Authoritative source code
  -> durable semantic maps
    -> disposable derived indexes
      -> session/task working context
```

| Layer | Owns | Update rule |
| --- | --- | --- |
| Authoritative code | Executable behavior, declarations, contracts implemented in code | Normal code review/test workflow |
| Semantic map | Stable workflow/page/panel/module IDs, ownership, primary paths/symbols, cross-map relationships, verifier routes | Update only when those semantics/topology change |
| Derived index | Line spans, definitions/references, call/dependency graph, symbol outline, search database | Generate from a pinned revision; rebuild or mark stale |
| Working context | Current task hypothesis, snippets, tool output, conversation memory | Release after the work unit; checkpoint durable state only |

Do not make one Markdown map perform all four jobs.

## the write-amplification problem

Let a work unit change code and potentially touch `F` dependent documentation
or index artifacts. The important quantity is not just changed code lines; it
is total maintenance work:

```text
work-unit cost = code + required validation + required semantic docs
               + manual index upkeep + report/checkpoint cost
```

An optional diagnostic is:

```text
documentation amplification = manual map/index lines changed / code lines changed
```

Preserve the units and denominator. A high value is a review signal, not proof
that documentation is waste: one contract-line change can legitimately require
large evidence. For a tiny internal edit with unchanged topology, however,
forced updates to several maps are likely duplication.

## what the semantic code map owns

A code map is a routing layer, not a hand-written parser output. Prefer cards
like:

| Field | Meaning |
| --- | --- |
| Stable code ID | Workflow/page/panel/module identity |
| Primary paths | Smallest source files likely to contain the behavior |
| Server symbols/anchors | Controller/service/method/property or exact search signature |
| Markup/UI anchors | Selector, panel ID, route, component, stable comment |
| Client symbols | Functions, event handlers, state transitions |
| Dependencies | Data IDs, contracts, shared helpers, external calls |
| Verifier | Smallest proof and escalation conditions |

Link to UI and data maps instead of copying their full descriptions. UI maps
own visible behavior and interaction contracts; data maps own logical/raw data
coordinates; code maps own execution topology and navigation.

## update/no-update rule

Update the semantic map when a change:

- adds/removes/renames a stable workflow, page, panel, route, module, service,
  public symbol, or owner;
- moves responsibility between files/modules or changes a material dependency;
- changes a public/data/security contract or the minimum verifier route;
- invalidates the search anchors agents use to enter the code.

Do not update the semantic map merely because:

- internal lines moved;
- a local condition, copy string, style, or implementation detail changed;
- a function body changed while its responsibility/identity/dependencies stayed
  stable;
- a generated line span or symbol index can be rebuilt.

The result report should say `semantic map impact: none` or name the exact
changed semantic row. It should not rewrite every map after every task.

## stable identity and panel-anchor standard

Line numbers are coordinates at one revision. Inserting `Delta` lines above a
region shifts all later line coordinates by `Delta`, potentially invalidating
several manual rows. Manually maintained semantic maps must not store line
offsets or line ranges. If a future tool derives spans from a pinned revision,
those spans belong to a disposable generated artifact, not the code/UI/data
map.

Prefer stable navigation identities, in order:

1. language symbol or qualified name;
2. route/component/panel ID;
3. exact source comment or stable search signature;
4. selector when it is already an implementation contract.

Every new project should assign a stable panel/component ID when its UI map is
created and make the implementation exactly searchable before acceptance. A
component/file/symbol may already provide that identity. Mixed Razor/template
surfaces should use minimal source comments:

```text
PANEL:<id>
PANEL:<id>:DATA
PANEL:<id>:VIEW
PANEL:<id>:CLIENT
```

Use only the roles that exist. One coherent region needs one marker, not
`BEGIN`/`END` pairs or comments on every function.

For an already deployed repository, prefer source comments that do not change
the rendered DOM/runtime contract. Backfill only through an explicitly approved
bounded rollout or when a panel is touched. Do not add `data-panel-id`, rename
symbols, move functions, or refactor merely to satisfy navigation. Retired IDs
remain retired and must not be reused.

When a stable anchor is absent, add a meaningful name/comment only if it also
improves code clarity. Do not litter runtime code with markers solely to satisfy
an index.

## how large organizations separate the problem

- Repository/source control keeps authoritative code.
- LSP, parsers, compiler/build facts, and code-search systems derive symbols,
  definitions, references, spans, and dependency facts.
- Incremental systems refresh changes plus affected dependency fanout instead
  of rewriting a full index manually.
- Component catalogs and docs-like-code systems expose ownership, services,
  APIs, and documentation at a higher level than source symbols.
- Text search remains a fallback for dynamic/string-based relationships that a
  semantic graph may miss.

The reusable principle is separation of ownership, not copying a Big Tech
platform into a small repo.

## human memory and agent context

Experienced maintainers remember approximate landmarks and likely names. This
is a useful local cognitive cache: it improves the next search query. It is not
shared source of truth, becomes stale after refactors/parallel changes, and is
unavailable to a fresh agent.

Externalize only the high-value shared landmarks: stable IDs, responsibility,
ownership, relationships, invariants, and verifier routes. Let code search and
derived indexes recover volatile coordinates.

## automation ladder and ROI gate

Use the smallest layer that meets measured needs:

1. Stable semantic map plus exact text/symbol search.
2. Existing IDE/LSP/GitHub symbol navigation.
3. Small on-demand generator for a pinned revision; output is derived and
   disposable.
4. Shared/incremental multi-language index only when repeated evidence shows
   local tools cannot meet freshness, coverage, or latency needs.

Consider a specialized system after repeated observations of stale-map misses,
slow first-edit time, duplicated indexing across many agents, cross-language
reference gaps, or material IDE/repository indexing delay. Include build,
storage, permissions, freshness, operational ownership, failure mode, and
regeneration cost in the decision. An index must inherit source-code access
controls and must not expose secrets or private code more broadly.

### recommendation gate for an indexing system

Do not build a file watcher, offset generator, parser/index database,
propagation checker, or shared symbol service merely because files are large.
Open an indexing proposal only when a measured pilot shows the current
`stable ID/comment + exact search + LSP/IDE` route is insufficient.

Minimum evidence before a proposal:

- at least 5 representative work units using the stable-anchor route;
- at least 2 recurring navigation failure classes, such as stale/missing
  anchors, repeated wrong-region reads, unresolved cross-language references,
  or materially delayed first edit;
- accepted outcomes/validation show that the problem is navigation rather than
  unclear packets, missing maps, oversized mixed surfaces, or agent
  noncompliance;
- one named consumer and one operational owner;
- a pinned source revision model, freshness target, rebuild/rollback path,
  access-control boundary, storage/runtime estimate, and failure behavior;
- a comparison against the next smaller option: existing LSP/IDE support or a
  one-shot disposable generator.

Start with a time-bounded prototype over one workflow/language. Promote only
when repeated tasks improve first-edit/navigation cost without weakening
correctness, security, validation, or recovery. Remove the prototype if its
maintenance/freshness burden exceeds the measured navigation benefit.

## evaluation contract

Compare alternatives on a common task set:

- accepted outcome and validation strength (hard guardrails);
- task-specific files/lines or bytes read;
- time to first correct edit;
- search attempts and wrong-region opens;
- stale/missing anchor events;
- semantic-map updates and minutes spent maintaining them;
- index freshness/failure/rebuild time when automation exists;
- human onboarding and agent handoff success.

Use at least several comparable tasks before promotion. Separate measured
results from inference and do not combine dimensions into an invented score.

## recommendation

For small/medium repos, use manually curated stable semantic maps plus existing
symbol/text navigation. Do not maintain offsets. Build a disposable generator
or shared index only after the evidence gate above proves repeated friction and
justifies its write, operational, freshness, and trust-boundary cost.

## related

- [bounded_change_fast_path.md](bounded_change_fast_path.md)
- [knowledge_cache_discipline.md](knowledge_cache_discipline.md)
- [data_map.md](data_map.md)
- [navigation_maps.md](navigation_maps.md)
- [../math/functions-rates-and-measurement.md](../math/functions-rates-and-measurement.md)
- [../../../templates/code_map.template.md](../../../templates/code_map.template.md)

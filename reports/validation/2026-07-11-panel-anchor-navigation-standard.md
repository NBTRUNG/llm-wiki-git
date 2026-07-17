# Validation - Stable panel-anchor navigation standard

- Date: 2026-07-11
- Task: LLMWIKI-086
- Decision owner: human/integration owner, explicitly approved
- Workflow used: Architecture Skill -> Change Impact Map -> Real Repo Work rollout
- Actual deviations: U17 files were staged and copied because the active
  workspace write root is LLM-Wiki; no U17 runtime View was changed

## Outcome

Finalized the codebase-navigation standard:

- no manual offsets in semantic code/UI/data maps;
- new projects assign stable panel/component identities at creation;
- mixed template surfaces use minimal `PANEL:<id>[:ROLE]` source comments;
- already deployed repos use comment-only bounded/touched backfill without DOM
  attributes or refactoring;
- internal implementation edits do not update maps unless semantic identity,
  responsibility, ownership, dependency, contract, or verifier changes;
- stable large files are not refactored merely because of line count.

Updated code-map, UI-group, result-report, and Bounded Change projections. U17
received the explicitly approved comment-only policy and ready Homepage B1-B6
packet `U17-PANEL-INDEX-B-016`. No Razor View, runtime code, deployment output,
or live system was changed.

## Indexing-system recommendation gate

The guide now blocks file watcher, offset generator, parser/index database,
automatic propagation checker, and shared symbol-service work at current scale.
An indexing proposal requires:

- at least 5 representative stable-anchor work units;
- at least 2 recurring navigation failure classes;
- evidence that navigation, not packet/map/agent compliance, is the cause;
- a named consumer and operational owner;
- pinned revision, freshness, rebuild/rollback, access-control, cost, and
  failure-mode design;
- comparison with existing LSP/IDE support or a one-shot disposable generator.

The first implementation must be a time-bounded one-workflow/language
prototype and must improve navigation/first-edit cost without weakening hard
outcome, validation, security, or recovery constraints.

## Impact review

- Canonical: `wiki/knowledge/project-docs/codebase_navigation.md` and shared
  Bounded Change targeted-read/report behavior.
- Templates: code map, UI group map, Bounded Change profile, agent result report.
- Explicit real-repo rollout: U17 repo rules, bounded profile, code-map policy,
  task/TICK/test/status, and validation evidence.
- Unchanged: workflow identities/catalog, source ownership, Agent Platform
  gateway/runtime, existing U17 Views, other real repos, and generated indexes.

## Checks

- Manual offsets removed from canonical/template contract: pass.
- Stable comment roles and no-BEGIN/END rule: pass.
- New-project versus deployed-repo behavior: pass.
- Semantic map update/no-update predicate: pass.
- Indexing recommendation/evidence/reversal gate: pass.
- U17 packet allowed/forbidden/stop/build/report contract: pass.
- LLM-Wiki and U17 projection registries: aligned.
- U17 runtime application changes: none.
- Active Markdown/link lint: pass; see command result in session handoff.

## Next gate

The human starts DeepSeek Flash/OpenCode with task
`U17-PANEL-INDEX-B-016`. Codex and the human review its report before creating
Shell, Programs, or Content packets. The packet must stop on unknown
relationships rather than infer them.

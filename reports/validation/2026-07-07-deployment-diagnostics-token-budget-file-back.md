# Validation Report: Deployment Diagnostics Token-Budget File-Back

Date: 2026-07-07

## scope

Implemented LLMWIKI-063: promote the UniversityWeb U17 publish/deploy
token-overuse audit into reusable Operations Pack guidance.

Source evidence:

```text
/home/admindebian/UniversityWeb-U17/reports/agent/codex-20260707-token-audit/publish-token-overuse-audit.md
```

## changed files

- `wiki/knowledge/operations/deployment-diagnostics.md`
- `wiki/knowledge/operations/deployment-readiness.md`
- `wiki/knowledge/operations/README.md`
- `wiki/knowledge/project-docs/agent_session_packs.md`
- `active.md`
- `TICK.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/tasks_archive.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## promoted guidance

- Diagnostic logs should be redirected to `/tmp`, searched with `rg`, and read
  through small line windows instead of pasted whole.
- After two command variants fail without new information, checkpoint before
  trying more variants.
- User-provided time/token caps are hard checkpoint triggers.
- For `.NET` publish failures where build passes, check process locks,
  SDK/runtime, `.csproj` `ProjectReference` graph, and publish-specific targets
  before broad diagnostic analysis.
- Deployment validation is split into build/test/publish, package/config/secret
  scan, runtime smoke, and database backup/verification; do not repeat expensive
  levels unless later changes affect that layer.
- Tool output should be capped and filtered by default.

## ROI note

The selected change was a narrow Operations Pack file-back instead of changing
Phase 1 workflow cards. The lesson is release/debug specific, and routing it
through the Operations / Release Pack gives future deploy sessions the guidance
without increasing the global session-start surface.

## validation

Commands:

```text
bash harness/feedback-loop-lint.sh
```

Result:

```text
Summary: 0 failure(s), 0 warning(s)
```

## residual risk

The U17 repo-local deployment docs were not edited in this file-back. The next
discussion should decide whether U17 should add a local pointer to
`wiki/knowledge/operations/deployment-diagnostics.md`.

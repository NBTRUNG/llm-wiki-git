# validation report

Date: 2026-05-21
Scope: Project status format alignment
Task/story: Align project status guide and template with expanded real-repo `docs/project_status.md`
Validator: Codex

## source

- Project: LLM-Wiki
- Source-of-truth files:
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/project_status.md`
  - `/home/admindebian/LLM-Wiki/templates/project_status.template.md`
  - `/home/admindebian/LLM-Wiki/harness/project-bootstrap.md`
- Commit/build/version: local working tree, no commit requested

## commands run

```text
grep -R -n "Project:\|Last updated\|Updated by\|Overall status\|Current phase\|Phase started\|## Done\|## Current state\|Source of truth\|## Active tasks\|## Next steps\|## Latest validation\|## Risks and blockers\|## Recent decisions\|## Notes for next agent\|## Change log\|GLOBAL_RULES.md\|AI_CODEX.md" templates/project_status.template.md wiki/knowledge/project-docs/project_status.md
grep -R -n "current status and next step\|## in progress\|## blockers\|## risks$\|source of truth is now" templates/project_status.template.md wiki/knowledge/project-docs/project_status.md harness/project-bootstrap.md
```

## results

| check | result | notes |
| --- | --- | --- |
| Header metadata | passed | Template includes Project, Last updated, Updated by, Overall status, Current phase, and Phase started. |
| Expanded sections | passed | Template includes Done, Current state, Active tasks, Next steps, Latest validation, Risks and blockers, Recent decisions, Notes for next agent, and Change log. |
| Active tasks table | passed | Template and guide define `ID / Owner / Status / Since / Evidence / Blocker`. |
| Risks table | passed | Template and guide define `Risk / Impact / Status / Owner`. |
| Next-agent notes | passed | Template references `AGENTS.md`, `GLOBAL_RULES.md`, `AI_CODEX.md`, assigned task/status files, agent result reports, and integration owner rollup. |
| Old status shape removed | passed | Old standalone `in progress`, `blockers`, and `risks` sections were not found in the checked files. |
| Bootstrap validation | passed | Project bootstrap now expects the expanded project status shape. |

## evidence

- Project status guide:
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/project_status.md`
- Project status template:
  - `/home/admindebian/LLM-Wiki/templates/project_status.template.md`
- Bootstrap validation:
  - `/home/admindebian/LLM-Wiki/harness/project-bootstrap.md`

## gaps

- Tests not run: no application code was changed.
- Known issues: shell startup prints `/home/admindebian/.profile: line 29: export: QT-IM-MODULE=fcitx: not a valid identifier`; this did not affect validation commands.
- Residual risk: existing real repo `docs/project_status.md` files may still need migration to this expanded format.

## decision

- implemented

Canonical project status shape now includes:

1. Header metadata.
2. Done.
3. Current state with explicit source of truth.
4. Active tasks table.
5. Next steps.
6. Latest validation.
7. Risks and blockers table.
8. Recent decisions table.
9. Notes for next agent.
10. Change log.

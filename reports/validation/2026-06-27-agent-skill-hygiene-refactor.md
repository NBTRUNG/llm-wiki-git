# Validation report: agent skill hygiene refactor

Date: 2026-06-27

## scope

Implemented `LLMWIKI-036`: backed up and refactored local agent skill folders so
active skills carry behavior/procedure and route to LLM-Wiki canonical
knowledge instead of duplicating architecture/frontend rule catalogs.

## backup

Backup created before live edits:

```text
archive/agent-skill-backups/2026-06-27/architecture-skill
archive/agent-skill-backups/2026-06-27/vercel-react-best-practices
```

## live skill changes

Updated:

```text
/home/admindebian/.agents/skills/architecture-skill/SKILL.md
/home/admindebian/.agents/skills/architecture-skill/references/software-arch.md
/home/admindebian/.agents/skills/architecture-skill/references/system-arch.md
/home/admindebian/.agents/skills/architecture-skill/references/web-arch.md
/home/admindebian/.agents/skills/architecture-skill/scripts/scaffold.sh
/home/admindebian/.agents/skills/vercel-react-best-practices/SKILL.md
```

Removed from active Vercel React skill after backup:

```text
/home/admindebian/.agents/skills/vercel-react-best-practices/AGENTS.md
/home/admindebian/.agents/skills/vercel-react-best-practices/README.md
/home/admindebian/.agents/skills/vercel-react-best-practices/rules/
```

The removed rule catalog remains available in the backup path above.

## behavior now enforced

- `architecture-skill` routes to LLM-Wiki session packs, architecture guides,
  architecture patterns, contracts, and operations knowledge.
- `architecture-skill` requires options/trade-offs and human/Lead/ADR
  confirmation before implementing new patterns or scaffolds.
- Architecture legacy reference files are pointer stubs, not knowledge copies.
- `scaffold.sh` refuses to run unless `ARCH_DECISION_CONFIRMED=yes`.
- Generated scaffold ADR files default to `Status: Proposed` through
  `ADR_STATUS="${ADR_STATUS:-Proposed}"`.
- `vercel-react-best-practices` routes to LLM-Wiki frontend/UI knowledge and no
  longer carries the active Vercel rule catalog.

## validation

| Check | Command | Result |
| --- | --- | --- |
| Architecture skill metadata | `python3 /home/admindebian/.codex/skills/.system/skill-creator/scripts/quick_validate.py /home/admindebian/.agents/skills/architecture-skill` | pass |
| Vercel React skill metadata | `python3 /home/admindebian/.codex/skills/.system/skill-creator/scripts/quick_validate.py /home/admindebian/.agents/skills/vercel-react-best-practices` | pass |
| Scaffold shell syntax | `bash -n /home/admindebian/.agents/skills/architecture-skill/scripts/scaffold.sh` | pass |
| Scaffold pre-decision guard | `/home/admindebian/.agents/skills/architecture-skill/scripts/scaffold.sh api /tmp/skill-scaffold-should-not-create` | pass; exited 2 and refused before creating scaffold |

## notes

This work edits local skill folders outside LLM-Wiki. LLM-Wiki records the
backup and evidence, but the live skill source of truth is the local
`/home/admindebian/.agents/skills/` directory.

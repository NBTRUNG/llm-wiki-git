# validation report

Date: 2026-05-21
Scope: Task packet format alignment
Task/story: Align LLM-Wiki task guide, template, and harness with delegated task format
Validator: Codex

## source

- Project: LLM-Wiki
- Source-of-truth files:
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/tasks.md`
  - `/home/admindebian/LLM-Wiki/templates/tasks.template.md`
  - `/home/admindebian/LLM-Wiki/harness/task-packet.md`
  - `/home/admindebian/LLM-Wiki/harness/task-decomposition.md`
  - `/home/admindebian/LLM-Wiki/templates/implementation_plan.template.md`
  - `/home/admindebian/LLM-Wiki/harness/project-bootstrap.md`
- Commit/build/version: local working tree, no commit requested

## commands run

```text
grep -R -n "Suggested owner\|Fallback owner\|Assigned owner\|Review owner\|Parallelizable\|File ownership group\|Review status\|Required read files\|Exact input\|Exact output\|Forbidden write targets\|Forbidden side effects\|Agent report path\|Evidence path" wiki/knowledge/project-docs/tasks.md templates/tasks.template.md harness/task-packet.md harness/task-decomposition.md templates/implementation_plan.template.md harness/project-bootstrap.md
grep -R -n "### input\|### output\|## intake\|## product contract\|Files/directories to read\|Files/directories to create" templates/tasks.template.md harness/task-packet.md harness/task-decomposition.md templates/implementation_plan.template.md
```

## results

| check | result | notes |
| --- | --- | --- |
| Required delegated-task fields | passed | Guide, task template, and task packet include owner/review/parallel/write-boundary/evidence fields from the example. |
| Old packet shape removed | passed | Old `intake`, `product contract`, `### input`, and `### output` sections were not found in the task template/packet set. |
| Task decomposition alignment | passed | Decomposition guide now requires owner, review owner, file ownership group, exact input/output, forbidden targets, and evidence paths. |
| Implementation plan summary alignment | passed | Task summary table now includes owner, review owner, file group, parallelizable, ACID, and evidence columns. |
| Bootstrap alignment | passed | Project bootstrap now tells agents to create tasks with metadata, dependencies, required reads, exact input/output, write boundaries, ACID, acceptance criteria, and evidence paths. |

## evidence

- Task guide:
  - `/home/admindebian/LLM-Wiki/wiki/knowledge/project-docs/tasks.md`
- Task template:
  - `/home/admindebian/LLM-Wiki/templates/tasks.template.md`
- Task packet harness:
  - `/home/admindebian/LLM-Wiki/harness/task-packet.md`

## gaps

- Tests not run: no application code was changed.
- Known issues: shell startup prints `/home/admindebian/.profile: line 29: export: QT-IM-MODULE=fcitx: not a valid identifier`; this did not affect validation commands.
- Residual risk: existing real-repo `docs/tasks.md` files may still need migration to the new task packet shape.

## decision

- implemented

Canonical executable task shape now includes:

1. Metadata with owner/review/parallel/file-ownership status.
2. Dependencies and contract references.
3. Context and ACID check.
4. Required read files.
5. Exact input and exact output.
6. Allowed and forbidden write targets.
7. Forbidden side effects.
8. Acceptance criteria.
9. Validation evidence, agent report path, and evidence path.
10. Notes/blockers.

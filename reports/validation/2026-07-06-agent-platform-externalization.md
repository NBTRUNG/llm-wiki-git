# 2026-07-06 Agent Platform externalization validation

## task

LLMWIKI-055: Move the local Agent Platform runtime out of the LLM-Wiki vault so
raw snapshots, derived indexes, WAP proposals, audit logs, gateway scripts, and
machine-readable maps live under `/home/admindebian/Agent-Platform`.

## changed files

- `/home/admindebian/Agent-Platform/README.md`
- `/home/admindebian/Agent-Platform/gateway/llmwiki_auditor.py`
- `agent-platform/README.md`
- `index.md`
- `wiki/projects/llm-wiki/docs/project_index.md`
- `wiki/projects/llm-wiki/docs/source_inventory.md`
- `wiki/projects/llm-wiki/docs/workflow_map.md`
- `wiki/projects/llm-wiki/docs/data_map.md`
- `wiki/projects/llm-wiki/docs/source_of_truth_rules.md`
- `wiki/projects/llm-wiki/docs/change_queue.md`
- `wiki/projects/llm-wiki/docs/tasks.md`
- `wiki/projects/llm-wiki/docs/test_matrix.md`
- `reports/validation/README.md`

## result

- Active platform root: `/home/admindebian/Agent-Platform`
- LLM-Wiki stub pointer: `agent-platform/README.md`
- Raw namespace: `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/`
- Test run proposal:
  `/home/admindebian/Agent-Platform/wap/proposals/2026-07-06TMIGRATE00Z-llm-wiki-evidence-audit.md`
- Post-pointer-update run proposal:
  `/home/admindebian/Agent-Platform/wap/proposals/2026-07-06TMIGRATE01Z-llm-wiki-evidence-audit.md`

## validation commands

```text
python3 /home/admindebian/Agent-Platform/gateway/llmwiki_auditor.py run --root /home/admindebian/LLM-Wiki --timestamp 2026-07-06TMIGRATE00Z
python3 /home/admindebian/Agent-Platform/gateway/llmwiki_auditor.py run --root /home/admindebian/LLM-Wiki --timestamp 2026-07-06TMIGRATE01Z
python3 -c "import json, pathlib; p=pathlib.Path('/home/admindebian/Agent-Platform/audit/events.jsonl'); [json.loads(line) for line in p.read_text().splitlines() if line.strip()]; print('jsonl ok')"
bash harness/feedback-loop-lint.sh
```

## status

- External auditor runs passed and created migration smoke proposals before and
  after canonical pointer updates.
- Script compile passed.
- Machine-readable map JSON validation passed.
- Audit JSONL validation passed.
- `bash harness/feedback-loop-lint.sh` passed with `0 failure(s), 0 warning(s)`.
- LLM-Wiki now retains only `agent-platform/README.md` as a pointer; active
  platform runtime files live under `/home/admindebian/Agent-Platform`.

## human review note

Review target for later:

1. Confirm the separation is conceptually correct:
   - LLM-Wiki remains the knowledge/workflow vault.
   - `/home/admindebian/Agent-Platform` owns raw snapshots, extracted indexes,
     gateway scripts, WAP proposals, audit logs, and machine-readable maps.
   - Real project repos such as UniversityWeb-17 should keep only pointers to
     raw/platform locations, not raw data.
2. Confirm the project namespace convention:
   - LLM-Wiki pilot raw:
     `/home/admindebian/Agent-Platform/raw/projects/llm-wiki/`
   - Future UniversityWeb-17 raw:
     `/home/admindebian/Agent-Platform/raw/projects/universityweb-u17/`
3. Confirm LLM-Wiki only keeps a pointer:
   - `agent-platform/README.md`
   - no local `agent-platform/raw/`, `agent-platform/gateway/`,
     `agent-platform/wap/`, `agent-platform/audit/`, or `agent-platform/maps/`.
4. Confirm whether old historical validation reports should remain with their
   original `agent-platform/...` paths. Current decision: keep them unchanged as
   historical evidence, while active project maps/tasks now point to the
   external platform.
5. Decide the next pilot project:
   - keep testing on LLM-Wiki only;
   - or add a UniversityWeb-17 project namespace and create its source
     inventory/workflow/data maps.

Human confirmation recorded later in the session:

- Confirmed: keep raw separated from LLM-Wiki and project repos.
- Confirmed: use Agent Platform project namespaces for raw/evidence runtime.
- Confirmed: LLM-Wiki remains the knowledge/workflow/pointer layer.
- Confirmed: real project repos keep their own source-of-truth docs and tasks.
- Confirmed: historical validation reports may remain as historical evidence;
  active maps and rollups should point to current platform paths.

Suggested review commands:

```text
find /home/admindebian/LLM-Wiki/agent-platform -type f | sort
find /home/admindebian/Agent-Platform -maxdepth 4 -type f | sort
bash /home/admindebian/LLM-Wiki/harness/feedback-loop-lint.sh
python3 /home/admindebian/Agent-Platform/gateway/llmwiki_auditor.py run --root /home/admindebian/LLM-Wiki
```

Expected state:

```text
/home/admindebian/LLM-Wiki/agent-platform/README.md
/home/admindebian/Agent-Platform/README.md
/home/admindebian/Agent-Platform/gateway/llmwiki_auditor.py
/home/admindebian/Agent-Platform/raw/projects/llm-wiki/
/home/admindebian/Agent-Platform/wap/proposals/
/home/admindebian/Agent-Platform/audit/events.jsonl
```

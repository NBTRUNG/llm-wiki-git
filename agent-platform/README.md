# Agent Platform Pointer

The active Agent Platform root is outside this LLM-Wiki vault:

```text
/home/admindebian/Agent-Platform
```

LLM-Wiki keeps this pointer so agents can discover the platform boundary, but
it does not own raw snapshots, extracted indexes, WAP proposals, audit logs, or
gateway scripts.

## Active Platform Paths

```text
/home/admindebian/Agent-Platform/raw/projects/<project-id>/
/home/admindebian/Agent-Platform/wap/proposals/
/home/admindebian/Agent-Platform/audit/events.jsonl
/home/admindebian/Agent-Platform/gateway/
/home/admindebian/Agent-Platform/maps/
```

## Rule

- LLM-Wiki is the knowledge/workflow vault.
- Agent Platform is the raw/gateway/WAP/audit runtime.
- Real project repos keep source-of-truth code and project docs.
- Raw evidence is namespaced in Agent Platform by project id and is not stored
  inside project repos or inside this wiki.

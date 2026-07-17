---
name: runtime-deployment-models
description: Runtime and deployment model guidance for VPS, PaaS, containers, Kubernetes, serverless, edge, and managed services.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
confidence: medium
confidence_reviewed: 2026-07-01
---

# Runtime And Deployment Models

Choose the simplest deployment model that satisfies reliability, security,
operations, cost, and team-skill constraints.

## Model Fit

| Model | Prefer When | Avoid When |
| --- | --- | --- |
| VPS/VM | Small app, simple ops, full control needed | Team lacks patching/backup discipline |
| PaaS/App Service | Standard web app, managed runtime useful | Custom network/runtime needs dominate |
| Container on single host | Reproducible packaging, modest ops | Orchestration is needed |
| Kubernetes | Many services, scaling, platform team, shared patterns | One/few apps, no platform ownership |
| Serverless | Event-driven, bursty, minimal server ops | Long-running stateful workloads |
| Edge | Latency-sensitive global request handling | Data locality/consistency is unclear |

## Checks

- Runtime support status.
- Deployment owner and rollback owner.
- Secrets/config path.
- Logs/metrics/traces path.
- Backup/restore path for stateful dependencies.
- Cost and operational skill fit.


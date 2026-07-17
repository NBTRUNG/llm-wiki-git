---
name: platform-infrastructure-pack
description: Platform and infrastructure pack for runtime, environment, network, containers, CI/CD, IaC, cloud, and deployment substrate decisions.
date_ingested: 2026-07-01
status: active
source_type: web-research + distilled-practice
source_urls:
  - https://12factor.net/
  - https://kubernetes.io/docs/concepts/overview/
  - https://docs.docker.com/get-started/docker-overview/
confidence: medium
confidence_reviewed: 2026-07-04
---

# Platform / Infrastructure Pack

Use this pack when work changes runtime, deployment substrate, containers,
networking, reverse proxies, CI/CD, IaC, environment config, secrets, queues,
storage, or cloud/platform services.

Vendor and technology overlays such as SQL Server, Linux, Windows Server, AWS,
Azure, GCP, Docker, or Kubernetes should be separate trigger-based files when a
real project needs them.

## Read Order

| Intent | Read |
| --- | --- |
| Choose or review deployment substrate | [runtime-deployment-models.md](runtime-deployment-models.md) |
| Containers or local/prod parity | [containers-runtime.md](containers-runtime.md) |
| Config, secrets, environments | [configuration-secrets-environments.md](configuration-secrets-environments.md) |
| Network/proxy/TLS/DNS/load balancing | [networking-edge.md](networking-edge.md), then [../reliability-sre/capacity-performance.md](../reliability-sre/capacity-performance.md) when capacity or failover is involved |
| CI/CD or IaC | [cicd-iac.md](cicd-iac.md) |

## Output

Report:

```text
Target environment:
Runtime/support status:
Network/public entrypoints:
Config/secrets boundary:
Build/deploy path:
Rollback path:
Observability/log path:
Vendor/technology overlays needed:
```

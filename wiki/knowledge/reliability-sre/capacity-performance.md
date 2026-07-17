---
name: capacity-performance
description: Capacity and performance guidance for load, bottlenecks, saturation, resource limits, and scalability evidence.
date_ingested: 2026-07-01
status: active
source_type: distilled-practice
source_urls:
  - https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/welcome.html
  - https://cloud.google.com/load-balancing/docs/choosing-load-balancer
  - https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/load-balancing-overview
confidence: medium
confidence_reviewed: 2026-07-04
---

# Capacity And Performance

## Checks

- Expected users, requests, jobs, data volume, and growth are named.
- Bottlenecks are identified before optimization.
- CPU, memory, disk, network, DB connections, queue depth, and external quotas
  are considered where relevant.
- Caches have invalidation and correctness rules.
- Load/performance claims have repeatable evidence or are marked as estimates.

## Load Balancing

Use load balancing when multiple backends can safely serve the same workflow
and traffic needs availability, capacity, regional routing, or maintenance
flexibility.

Before selecting a load balancer, name:

```text
Traffic type: HTTP(S) | TCP | UDP | gRPC | mixed
Entry: public | private | service-to-service
Scope: single-zone | regional | cross-region | global
Backend type: VM | container | serverless | external | hybrid
Session/state requirement:
Health check:
Connection draining/shutdown behavior:
TLS termination and backend encryption:
Failure mode:
Observability:
```

Prefer stateless or externally-stored session state before horizontal scaling.
If sticky sessions are required, document why, how failover behaves, and what a
backend loss does to in-flight work.

## Capacity Model

For load balancing and scaling changes, record both average and peak behavior:

- expected requests/jobs per second;
- burst multiplier and duration;
- p95/p99 latency target;
- backend concurrency limit;
- database/queue/external-service bottleneck;
- autoscaling signal and cooldown;
- overload behavior: shed, queue, degrade, or fail closed;
- rollback or traffic-shift path.

Load balancing does not remove downstream bottlenecks. It can amplify database,
cache, queue, or third-party quota saturation when backend count increases.

## Report

```text
Load assumption:
Bottleneck:
Measurement:
Limit/quota:
Mitigation:
Residual risk:
```

## Anti-Patterns

- Adding more app instances while the database connection pool, lock, queue, or
  third-party API is the real bottleneck.
- Health checks that only prove the process is alive, not that dependencies
  required for the workflow are usable.
- Sticky sessions without a failover and drain story.
- Autoscaling from a noisy metric that lags the real saturation point.
- Reporting average latency while p95/p99 or hot tenants fail.

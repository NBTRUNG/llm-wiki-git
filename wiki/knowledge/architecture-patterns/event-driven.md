---
name: event-driven-architecture
description: Asynchronous event production, detection, and consumption. Use for high-throughput async workflows, integrations, and decoupling. Requires designing compensating transactions before production.
source_type: external-research
source_urls:
  - https://www.redpanda.com/blog/how-to-choose-right-architecture-pattern
  - https://www.geeksforgeeks.org/software-engineering/types-of-software-architecture-patterns/
date_ingested: 2026-05-23
confidence: medium
confidence_reviewed: 2026-05-23
applicable_contexts: pending first project use
status: active
---

# Event-driven architecture

Components communicate by producing and consuming **events** — immutable
records of something that happened. Producers do not know which consumers
exist; consumers do not know which producer emitted what.

```
Producer A ──► [event bus / broker] ──► Consumer X
Producer B ──►                       ──► Consumer Y
                                     ──► Consumer Z
```

Typical brokers: Kafka, RabbitMQ, AWS SNS/SQS, Google Pub/Sub, NATS,
EventBridge.

## strengths

- **Loose coupling**: producers do not care who consumes; consumers do not
  care who produced. Adding a new consumer does not require touching
  producers.
- **High throughput**: async processing absorbs spikes without blocking
  callers.
- **Replay**: persisted event streams (Kafka) let consumers re-process
  history when logic changes.
- **Multiple processing patterns**: same event consumed by an analytics
  pipeline, a notification service, and an audit log.

## weaknesses

- **Eventual consistency**: state across consumers is not synchronous.
  "User signed up" event triggers email send, profile creation, analytics —
  these complete at different times. UI must handle "not yet there" gracefully.
- **Hard to reason about**: tracing a user action across multiple consumers
  needs distributed tracing; a debugger is not enough.
- **Compensating transactions are mandatory**: if step 3 in a 5-step saga
  fails, you must roll back steps 1 and 2. Designing these *after* the first
  production incident costs much more than designing them upfront.
- **Schema evolution is hard**: an event consumed by 10 services cannot
  change shape without coordinating 10 deployments.
- **Operational tooling required**: you need the broker, dead-letter queues,
  monitoring, replay tooling, and runbooks.

## when to use

- Throughput spikes that overload synchronous APIs.
- Integrations across systems with different uptimes/SLAs.
- Domain naturally event-shaped (order placed, payment processed, shipment
  dispatched).
- Multi-consumer needs: one action triggers many downstream effects.
- Audit log / replay requirement.

## when NOT to use

- Strong synchronous consistency required (e.g., a banking transfer must be
  visible everywhere before the API responds).
- Simple CRUD app with no async needs.
- Team without operational maturity for the broker.
- Domain that does not naturally decompose into events ("update the user's
  email" is rarely an event, just a command).

## anti-patterns

- **Anemic event**: event contains just an ID, forcing every consumer to
  call back to the producer's database. Loses decoupling.
- **Saga without compensation**: a multi-step workflow that has no rollback
  for partial failure.
- **Event used as command**: "DoTheThingEvent" — events should describe
  what happened (past tense), not request action (imperative).
- **No dead-letter handling**: failed messages disappear; the system
  silently loses data.
- **Versioning via "v2" field forever**: schema evolution is a real
  discipline; ad-hoc field-add over years becomes unmanageable.
- **Combining synchronous layered thinking with events**: assuming the
  consumer has processed the event by the time the producer's call returns.
  Race conditions in production.

## key patterns to design upfront

- **Idempotency keys**: every consumer must handle duplicate delivery.
- **Compensating action per saga step**: for every successful step in a
  multi-step workflow, define how to undo it.
- **Dead-letter queue**: where messages go after N retries.
- **Schema registry**: versioned event schemas with backward and forward
  compatibility rules.
- **Tracing**: correlation IDs propagated through every event so a flow can
  be reconstructed.

## combinations

- **Event-driven + Microservices**: classic pairing. Services emit events;
  other services consume. Reduces sync coupling but adds eventual
  consistency.
- **Event-driven + Hexagonal**: event producer/consumer are adapters; the
  domain stays clean and synchronous.
- **Event-driven + CQRS**: read model is updated by consuming events;
  write model emits them. Requires event-driven foundation — CQRS without
  events leaves the read model with no update mechanism.

## sources

- Redpanda — choosing architecture patterns: https://www.redpanda.com/blog/how-to-choose-right-architecture-pattern
- GeeksforGeeks software architecture patterns: https://www.geeksforgeeks.org/software-engineering/types-of-software-architecture-patterns/
- Martin Fowler — Event-Driven Architecture: https://martinfowler.com/articles/201701-event-driven.html

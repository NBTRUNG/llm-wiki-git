---
name: code-quality
description: Readable, correct, surgical code. Naming, function shape, error handling, types, banned patterns. Use when writing or reviewing repo code.
date_ingested: 2026-05-23
status: active
---

# code quality guide

## purpose

Use this guide when writing or reviewing repo code. It generalizes the useful
parts of coding standards without making any single language or framework
mandatory.

Repo-specific style, linters, formatters, and architecture rules always win.

## priorities

Default priority order:

```text
readable -> correct -> fast -> clever
```

Readable code should make the intent clear from names, structure, and tests.
Use comments for the reason behind a non-obvious choice, not to narrate what a
simple line does.

## naming

Prefer names that reveal role and intent:

- functions: verb plus object or outcome, such as `get_user_by_email`;
- booleans: predicate names, such as `is_enabled` or `has_permission`;
- counters and limits: include the unit or bound, such as `max_retry_count`;
- constants: named constants instead of magic numbers.

Avoid throwaway names such as `data`, `item`, `x`, `flag`, or `process` unless
the local context makes the meaning obvious.

```
✅ GOOD
get_user_by_email(email)
calculate_monthly_revenue(transactions)
is_payment_confirmed
MAX_LOGIN_ATTEMPTS = 5

❌ BAD
process(data)        — what does it process?
handle()             — handle what?
x = 3                — what is 3?
flag = True          — what flag?
```

## function shape

Keep functions small enough to review and test.

Use these as warning signs, not universal hard limits:

- more than one responsibility;
- deeply nested branches;
- long parameter lists;
- hidden I/O mixed with pure calculation;
- error handling spread across unrelated concerns.

When a function grows, first split by behavior or boundary. Do not create an
abstraction just because a function is long.

```
✅ GOOD — one job per function, clear boundaries
def create_order(user_id, items):
    validate_items(items)
    total = calculate_total(items)
    return persist_order(user_id, items, total)

❌ BAD — one function doing everything, too many params
def create_order(user_id, items, discount_code, shipping_addr, payment_method, note):
    if items:
        for item in items:
            if item.quantity > 0 and item.price > 0:
                # 50 more lines mixed with validation, calculation, and I/O
```

## error handling

Good error handling:

- catches specific errors;
- preserves useful context;
- logs operationally useful details without leaking secrets;
- returns or raises errors that callers can act on;
- does not silently swallow failures.

Avoid broad catch-all handlers unless they add context and rethrow or convert to
a deliberate failure contract.

```
✅ GOOD — specific errors, useful context
try:
    user = user_repo.get_by_id(user_id)
except UserNotFoundError:
    logger.warning("User not found", extra={"user_id": user_id})
    raise NotFoundError(code="USR_001")

❌ BAD — swallows error, no context
try:
    user = get_user(user_id)
except:
    return None

❌ BAD — catches everything, loses context
except Exception as e:
    print(f"Error: {e}")
    return {"error": "something went wrong"}
```

## dependencies and imports

- Prefer repo-local helpers, clients, and abstractions already in use.
- Add dependencies only when the task needs them and the repo process allows it.
- Keep imports organized according to the repo formatter or language convention.
- Avoid import-time side effects that make tests or tooling harder.

```
✅ GOOD — organized: stdlib first, then third-party, then local
import os
from datetime import datetime

import fastapi
from sqlalchemy import AsyncSession

from app.models.user import User

❌ BAD — wildcard imports, imports inside functions
from app.models import *
def some_function():
    import pandas as pd   # don't import inside functions
```

## types and contracts

Use type annotations, schemas, interfaces, or contracts when the repo stack
supports them.

At boundaries, make inputs and outputs explicit:

- API/request/response schemas;
- DTOs/view models;
- domain commands/events;
- config objects;
- result/error types.

```
✅ GOOD — types make the contract explicit
async def get_active_users(
    db: AsyncSession,
    page: int = 1,
    per_page: int = 20,
) -> tuple[list[User], int]:
    ...

❌ BAD — no types, no contract
async def get_users(db, page=1, per_page=20):
    ...
```

## banned or high-risk patterns

| Pattern | Risk | Prefer |
| --- | --- | --- |
| debug prints left in production code | noisy logs and leaked data | repo logger or remove before finish |
| magic numbers or strings | unclear behavior | named constants or config |
| raw SQL string interpolation | injection risk | parameterized query or ORM safe API |
| direct unvalidated environment reads | unclear startup failures | typed settings/config validation |
| mutable default arguments | shared state bugs | explicit initialization |
| hidden network calls in unit-level code | slow/flaky tests | injected client or mockable boundary |

## done signal

Code quality is acceptable when the smallest task-specific change is readable,
matches local patterns, has relevant validation, and leaves no debug artifacts
or unrelated refactors behind.
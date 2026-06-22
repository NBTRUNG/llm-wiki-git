---
name: security-baseline
description: Practical security baseline for code-level controls. Secrets, input validation, auth, credentials, abuse controls, logging, supply chain. Cross-references OWASP Top 10 2025.
date_ingested: 2026-05-23
status: active
---

# security baseline guide

## purpose

Use this guide when a task touches authentication, authorization, user input,
secrets, config, logging, uploads, external services, production deployment, or
data protection.

It is a baseline. Project-specific threat models, compliance rules, and repo
security docs override it.

For broader concepts see:

- OWASP Top 10 2025 (vulnerability vocabulary): [[../../concepts/security/owasp-top-10.md]]
- STRIDE threat modeling (design-time enumeration): [[../../concepts/security/stride.md]]
- Defense in depth (layered controls): [[../../concepts/security/defense-in-depth.md]]
- Zero trust (identity-centric verification): [[../../concepts/security/zero-trust.md]]

## OWASP Top 10 2025 mapping

| OWASP 2025 | This guide section |
|---|---|
| A01 Broken Access Control | `authentication and authorization` |
| A02 Security Misconfiguration | `secret management`, `dependency and supply-chain checks` |
| A03 Software Supply Chain Failures | `dependency and supply-chain checks` |
| A04 Cryptographic Failures | `credentials and passwords`, `secret management` |
| A05 Injection | `input validation` |
| A06 Insecure Design | (use STRIDE at design time; see linked concept) |
| A07 Authentication Failures | `authentication and authorization`, `credentials and passwords` |
| A08 Software or Data Integrity Failures | `dependency and supply-chain checks` |
| A09 Security Logging & Alerting Failures | `logging and observability` |
| A10 Mishandling of Exceptional Conditions | error handling in [[code-quality.md]] |

## source of truth

Security behavior for an active repo belongs in that repo:

- `AGENTS.md` or `REPO_RULES.md`;
- `docs/contracts.md`;
- `docs/decisions.md`;
- `docs/test_matrix.md`;
- security-specific docs when present;
- code and configuration.

LLM-Wiki should provide reusable checks and patterns only.

## secret management

- Never hardcode real secrets, tokens, keys, passwords, or connection strings.
- Keep `.env` and local secret files out of version control.
- Use placeholders in examples.
- Validate required config at startup.
- Do not print secrets in logs, test output, screenshots, or reports.

```
✅ GOOD — read from typed config that fails fast if missing
class Settings:
    database_url: str       # validated at startup
    jwt_secret: str         # app crashes clearly if missing

settings = Settings()

❌ BAD — hardcoded in source
DATABASE_URL = "postgresql://admin:password123@prod-db:5432/app"
JWT_SECRET = "mysecret"

❌ BAD — unvalidated env read
import os
db_url = os.environ["DATABASE_URL"]  # cryptic crash if missing
```

## input validation

Validate every external input at the boundary:

- request bodies;
- query and route parameters;
- uploaded files;
- webhooks;
- message queue payloads;
- environment/config values;
- imported CSV/JSON/XML or CMS content.

Validation should check type, shape, length, allowed values, and encoding where
relevant.

```
✅ GOOD — validate all input at the boundary
class CreateUserRequest:
    email: EmailStr              # format validated
    password: str(min_length=8)  # length validated
    name: str(max_length=100)

@route.post("/users")
def create_user(data: CreateUserRequest):  # framework validates before this runs
    ...

❌ BAD — trust raw input
@route.post("/users")
def create_user(data: dict):    # nothing validated
    db.execute(f"INSERT INTO users VALUES ('{data['email']}')")  # injection risk
```

## authentication and authorization

- Authentication proves identity.
- Authorization proves the identity can perform the action.
- Check authorization at the server boundary and again near sensitive domain
  behavior when useful.
- Verify ownership or tenant boundary before returning or mutating data.
- Avoid relying only on client-side checks.

```
✅ GOOD — auth enforced at endpoint, ownership checked
@route.get("/orders/{order_id}")
def get_order(order_id, current_user = Depends(get_authenticated_user)):
    order = order_repo.get_by_id(order_id)
    if order.user_id != current_user.id:
        raise ForbiddenError(code="AUTH_002")
    return order

❌ BAD — no auth, anyone can call
@route.get("/admin/users")
def list_all_users():
    return user_repo.get_all()

❌ BAD — auth exists but no ownership check
@route.get("/orders/{order_id}")
def get_order(order_id, current_user = Depends(get_authenticated_user)):
    return order_repo.get_by_id(order_id)  # returns any user's order
```

## credentials and passwords

- Store passwords only with a modern password hashing algorithm and per-password salt.
- Do not log passwords, reset tokens, access tokens, refresh tokens, API keys, or payment details.
- Expire short-lived tokens deliberately and rotate long-lived secrets.
- Use the platform's recommended credential store for production.

```
✅ GOOD — bcrypt with work factor, constant-time comparison
def hash_password(plain: str) -> str:
    return bcrypt.hashpw(plain.encode(), bcrypt.gensalt(rounds=12))

def verify_password(plain: str, hashed: str) -> bool:
    return bcrypt.checkpw(plain.encode(), hashed.encode())

❌ BAD — weak hash, plain text
hashed = hashlib.md5(password.encode()).hexdigest()  # MD5 is broken
user.password = request.password                       # storing plain text
```

## abuse controls

Add abuse controls where a public or unauthenticated endpoint can be automated:

- rate limits;
- bot/spam controls;
- request size limits;
- file type and file size limits;
- idempotency keys for payment or mutation endpoints;
- audit logs for sensitive actions.

```
✅ GOOD — explicit rate limit on auth endpoints
@route.post("/auth/login")
@rate_limit("5/minute")   # prevents brute force
def login(request, data: LoginRequest):
    ...

❌ BAD — no rate limit on login
@route.post("/auth/login")
def login(request, data: LoginRequest):  # attacker can try unlimited passwords
    ...
```

## logging and observability

Logs should help operate the system without leaking data.

Prefer:

- request IDs or correlation IDs;
- stable error codes;
- hashed or redacted identifiers when needed;
- event names and coarse context.

```
✅ GOOD — enough context, no secrets
logger.info("Login succeeded", extra={"user_id": user.id, "ip": request.client_ip})
logger.warning("Login failed", extra={"email_hash": hash_email(email), "ip": ip})

❌ BAD — logging secrets and sensitive data
logger.debug(f"Login: email={email}, password={password}")
logger.info(f"Token: {access_token}")
logger.error(f"Payment card: {card_number}")
```

## dependency and supply-chain checks

When adding or upgrading dependencies:

- confirm the dependency is necessary;
- prefer maintained packages with active security response;
- run the repo's dependency audit when available;
- document new external services or trust boundaries in decisions/contracts.

## security evidence

For security-relevant tasks, record at least one of:

- tests for denied access, invalid input, and edge cases;
- config/readback proof;
- static scan or dependency audit output;
- manual review notes with paths checked;
- reason a stronger check could not run.
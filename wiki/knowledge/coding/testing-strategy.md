---
name: testing-strategy
description: Proof layers, test structure, error coverage, integration tests. Tests prove behavior, not exercise code. Use when creating or reviewing tests.
date_ingested: 2026-05-23
status: active
confidence_reviewed: 2026-07-01
---

# testing strategy guide

## purpose

Use this guide when creating, reviewing, or validating tests for repo work.

It generalizes the useful parts of testing policy while letting each repo set its
own framework, coverage thresholds, and CI commands.

## testing principle

Tests should prove the behavior required by the task, not merely exercise code.

Each task should identify:

- behavior being changed;
- expected success path;
- important error or edge paths;
- contract or integration boundary affected;
- command or manual check that proves the result.

## proof layers

| Layer | Best for |
| --- | --- |
| Unit | Pure logic, services, helpers, validation rules |
| Integration | database, CMS, API route, provider, filesystem, queue, auth boundary |
| E2E | user-visible workflow through the app surface |
| Platform | build, runtime, deployment, config, migrations, asset pipeline |
| Manual review | visual checks, content review, UX judgment, constrained local-only proof |

Use the narrowest layer that proves the risk. Add broader layers when behavior
crosses process, network, database, CMS, browser, or deployment boundaries.

## test structure

Name tests by scenario and expected result.

```
✅ GOOD — name reveals scenario and expected outcome
test_create_user_with_valid_data_returns_user_object
test_login_with_wrong_password_raises_authentication_error
test_get_order_by_nonexistent_id_returns_not_found

❌ BAD — name reveals nothing
test_user
test_1
test_login
```

Good test shape:

```
Arrange → Act → Assert
```

```
✅ GOOD — clear three-part structure, meaningful assertions
def test_get_user_by_email_found_returns_user(mock_user_repo):
    # Arrange
    expected = UserFactory.build(email="test@example.com")
    mock_user_repo.get_by_email.return_value = expected

    # Act
    result = service.get_by_email("test@example.com")

    # Assert
    assert result.id == expected.id
    assert result.email == "test@example.com"
    assert "password" not in result  # never leak sensitive fields

❌ BAD — no meaningful assertion
def test_get_user(mock_repo):
    mock_repo.get_by_email.return_value = User()
    result = service.get_by_email("x")
    assert result is not None   # proves nothing useful
```

## error and edge case testing

Every risky change needs at least one error test.

```
✅ GOOD — tests error path with specific assertion
def test_get_user_by_email_not_found_raises_error(mock_user_repo):
    mock_user_repo.get_by_email.return_value = None

    with pytest.raises(UserNotFoundError) as exc:
        service.get_by_email("ghost@example.com")

    assert exc.value.code == "USR_001"

❌ BAD — only happy path, no error coverage
def test_create_user_success():
    response = client.post("/users", json={"email": "a@b.com", "password": "12345678"})
    assert response.status_code == 201
    # no test for: duplicate email, missing fields, short password, invalid email
```

## integration and API testing

```
✅ GOOD — tests real HTTP, real test DB, multiple cases
def test_login_valid_credentials_returns_token(client, test_db):
    # Arrange
    create_user_in_db(test_db, email="test@example.com", password="correct")

    # Act
    response = client.post("/auth/login", json={
        "email": "test@example.com",
        "password": "correct"
    })

    # Assert
    assert response.status_code == 200
    data = response.json()
    assert "access_token" in data
    assert data["token_type"] == "bearer"

def test_login_wrong_password_returns_401(client, test_db):
    create_user_in_db(test_db, email="test@example.com", password="correct")

    response = client.post("/auth/login", json={
        "email": "test@example.com",
        "password": "wrong"
    })

    assert response.status_code == 401
    assert response.json()["code"] == "AUTH_001"

❌ BAD — only happy path, no integration test at all
# Task says "implement login endpoint"
# Evidence: "it works when I test manually"
```

## coverage targets

Coverage numbers are repo policy, not LLM-Wiki law.

Useful defaults by risk:

- critical business rules: high branch and error-path coverage;
- public API or form endpoints: success, validation failure, auth failure, and permission failure;
- utility functions: representative normal and edge cases;
- config/migration/build changes: platform proof or documented dry-run.

Do not chase coverage by adding trivial assertions.

## forbidden or weak test patterns

| Pattern | Why it is weak | Prefer |
| --- | --- | --- |
| `assert true` or no meaningful assertion | proves nothing | assert output, state, error, or call contract |
| real external API calls in normal CI | flaky, slow, costly | mocks, fakes, test containers, contract tests |
| sleeps for timing | slow and unreliable | fake clock, polling with timeout, event hooks |
| hardcoded shared IDs | conflicts between tests | factories or isolated fixtures |
| only happy-path tests for risky changes | misses common failures | add relevant error and boundary cases |

## validation reporting

Record:

- commands run;
- result;
- important paths checked;
- framework/runtime/package versions when behavior depends on current release
  behavior, security patch level, or official support lifecycle;
- tests not run and why;
- residual risk.

For docs-only changes, use file existence, link/readback checks, and manual
consistency review.

## AI and tool-use test notes

When a task exposes AI agents, tool calling, MCP servers, generated code,
retrieval, or prompt-driven automation, include negative-path proof where
practical:

- unauthorized tool call denied;
- out-of-scope filesystem/network/data access denied;
- malformed or adversarial model output validated before downstream use;
- sensitive prompts/context not logged by default;
- human approval required for destructive or production-affecting actions.

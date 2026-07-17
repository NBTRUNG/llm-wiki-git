---
name: repo-code-rules
description: Long-form rules for code, review, test, and docs work inside a real project repo. Canonical Coding Pack content loaded directly by eligible P2 agents or through validated task-named P0/P1 projections.
date_ingested: 2026-05-23
status: active
---

# repo code rules

## purpose

File nay quy dinh cach lam code, review, test, va cap nhat docs trong project repo that.

Dung file nay khi user yeu cau:

- sua code trong repo;
- review code;
- refactor;
- fix bug;
- them test;
- cap nhat CMS/config/build/runtime cua project da co repo;
- phan cong agents lam implementation trong repo.

Khong dung file nay de quan ly active focus cua LLM-Wiki. LLM-Wiki rules nam tai:

```text
global-rules.md
```

Related guides:

- `../project-docs/agent_session_packs.md`
- `agent-coding-workflow.md`
- `karpathy-guidelines.md`
- `code-quality.md`
- `output-quality.md`
- `implementation-quality-matrix.md`
- `security-baseline.md`
- `testing-strategy.md`

## source of truth in repo work

Khi project da co repo that:

1. Repo docs va repo files la source of truth.
2. LLM-Wiki project note chi la link map/history.
3. `active.md` cua LLM-Wiki khong phai current project status.
4. Neu repo co `AGENTS.md`, doc file do truoc khi sua code.
5. Neu repo co task/status/test matrix docs, cap nhat chung trong repo.

Typical repo read order:

1. Repo `AGENTS.md`
2. Repo short rule file neu co, vi du `REPO_RULES.md`
3. Repo quick AI/context file neu co, vi du `AI_CODEX.md`
4. Check capability fit and assigned projection with
   `wiki/knowledge/project-docs/agent_capability_tiers.md`
5. Classify session pack with `wiki/knowledge/project-docs/agent_session_packs.md`
6. Canonical Coding Pack directly for eligible `P2` work, or the approved
   task-named `P0/P1` projection for lower-tier code/review/test work:
   `wiki/knowledge/coding/agent-coding-workflow.md`,
   `karpathy-guidelines.md`, `repo-code-rules.md`, `code-quality.md`,
   `output-quality.md`, `implementation-quality-matrix.md`,
   `security-baseline.md`, `testing-strategy.md`, and `agent-coding-risks.md`
7. Neu la delegated agent: `agents/<agent>/AGENT.md`
8. Files trong task `Required read files`

Repo-specific instructions luon thang file rule chung nay.

## coding-session bootstrap

Delegated and Lead agents doing implementation work must use the canonical
Coding Pack. Eligible `P2` agents read it directly once; `P0/P1` agents use an
approved task-named projection that preserves all mandatory constraints. If no
validated projection exists, the lower-tier agent stops or hands off.

The full Coding Pack is:

```text
wiki/knowledge/coding/agent-coding-workflow.md
wiki/knowledge/coding/karpathy-guidelines.md
wiki/knowledge/coding/repo-code-rules.md
wiki/knowledge/coding/code-quality.md
wiki/knowledge/coding/output-quality.md
wiki/knowledge/coding/implementation-quality-matrix.md
wiki/knowledge/coding/security-baseline.md
wiki/knowledge/coding/testing-strategy.md
wiki/knowledge/coding/agent-coding-risks.md
```

The canonical cross-repo projection for qualified `C2-C3` bounded coding work
is `P1-BOUNDED-CODING` at
`wiki/knowledge/coding/bounded-coding-core.md`. Repo capsules and maps compose
with it but do not replace it or create a repo-specific projection.

Read the assigned pack/projection once, not once per micro-task. Re-read only after compaction,
handoff to a new agent, file changes, or exact-wording conflict.

Narrow exceptions:

- status/report-only work;
- catalog/index/link cleanup with no implementation guidance change;
- docs-only edits unrelated to implementation behavior;
- typo or copy fixes that do not touch behavior, contracts, UI layout, command
  semantics, or validation evidence.

Repo `REPO_RULES.md` should contain mandatory short capsules for quick recall.
They are repo coordinates and stricter local rules. They are not a lower-tier
Coding Pack projection unless a separate canonical projection contract
explicitly says so. For ordinary bounded `C2-C3` coding, the task names
`P1-BOUNDED-CODING` and separately names the required repo capsules.

Security baseline is always part of the Coding Pack. For every coding result,
report security impact, areas touched, risk found, and whether human review is
needed. Trigger the Security Deep Pack from
`wiki/knowledge/project-docs/agent_session_packs.md` when auth, permissions,
sensitive data, secrets, uploads, callbacks, deployment, dependencies, raw
SQL/HTML, external services, or performance/security trade-offs are involved.

## coding style

Mac dinh ap dung Karpathy-inspired style:

- think before coding;
- simplicity first;
- surgical changes;
- goal-driven execution.

Reference local:

```text
raw/andrej-karpathy-skills-main/
```

### think before coding

- Khong assume am tham khi behavior co rui ro.
- Neu yeu cau mo ho va co the gay sai behavior, hoi lai.
- Neu co nhieu cach hieu, neu ngan gon trade-off.
- Neu co assumption, noi ro.
- Neu cach don gian hon ton tai, uu tien cach don gian.

### simplicity first

- Viet it code nhat co the de giai quyet dung van de.
- Khong them feature ngoai yeu cau.
- Khong tao abstraction cho logic chi dung mot lan.
- Khong them dependency/config/cong nghe moi neu task khong can.
- Senior engineer nhin vao khong nen thay over-engineered.

### surgical changes

- Chi cham vao phan can cham.
- Khong drive-by refactor.
- Khong reformat file/region khong lien quan.
- Match style cua repo hien co.
- Khong revert/sua thay doi khong phai cua minh tru khi user yeu cau ro.

### goal-driven execution

- Bug fix: tai hien loi neu co the, sua, roi verify.
- Validation: test input dung va sai lien quan.
- Refactor: chung minh behavior khong doi.
- Feature: co acceptance criteria va validation.
- Done nghia la behavior duoc chung minh hoac missing proof duoc ghi ro.

## before editing code

- Doc repo instructions va source-of-truth docs lien quan.
- Kiem tra worktree/changes neu repo co git; khong revert unrelated changes.
- Xac dinh task ID/status docs neu repo co quy uoc.
- Neu cham shared aliases/routes/helpers/components/API/CMS names, doc/cap nhat `docs/contracts.md` truoc.
- Xac dinh verification se chay truoc khi sua neu task khong trivial.

## during code work

- Lam dung task duoc yeu cau.
- Giu thay doi nho, reviewable.
- Dung helper/API/pattern san co cua repo truoc khi tao cach moi.
- Khi them logic moi, uu tien ham don gian truoc abstraction phuc tap.
- Error handling phai ro rang; khong catch loi roi im lang.
- Log/debug output tam thoi phai duoc xoa neu do chinh minh tao ra.
- Khong hardcode secret, credential, hoac path may cuc bo neu khong ghi ro local-only.

## large UI/code surface policy

Large files are managed by operational risk, not aesthetics. A large fused file
can be acceptable, even long-term, when security is understood, performance is
acceptable or improved, ownership is clear, the file is stable, and changing it
would cost more than leaving it alone.

Do not refactor a working performance/security-stable surface merely because
the file is large. Refactor only for payoff: security issue, performance
regression, recurring bugs, hard-to-review changes, duplicate behavior drift,
high merge conflict rate, or a new task that materially extends that surface.

But before adding new behavior to a large view/component/page, stop and check:

- Does one file mix server-side data lookup, markup, CSS, and client-side JS?
- Is API/service logic duplicated in a view/template?
- Is the same parsing, filtering, fallback, media, or formatting rule repeated
  in production and diagnostic paths?
- Will this change push a new file beyond about 300 lines, or materially extend
  an inherited file beyond about 500 lines?

If yes, either keep the change extremely small or raise a refactor-plan blocker.
For new work, avoid creating large mixed-concern files. If doing so is the best
delivery shape for performance or schedule, record the reason and future
boundary in the task packet.

For server-rendered web apps, prefer these boundaries:

```text
template/Razor = shell and semantic markup
service/API/adapter = data lookup, normalization, filtering, DTOs, fallback
CSS/static asset = presentation
JS/static asset = client state, search/filter/drawer/fetch behavior
```

For a fused surface that has just fixed performance, defer structural refactor
until it has run cleanly for the agreed stabilization window, often 1-2 weeks.
After that window, leaving it as-is is acceptable if security, performance, and
operability are good. If a payoff trigger appears, refactor with a
no-behavior-change invariant: extract JS/CSS, keep the template as shell, and
do not change API routes, DTOs, visual design, copy, or user-visible behavior.

## tests and verification

Bien moi task thanh muc tieu kiem tra duoc:

- Bug fix: reproduction plus passing check.
- Code change: unit/integration/build/test lien quan.
- UI/workflow: route/browser/manual evidence neu can.
- Config/security: review/test/readback evidence.
- Docs-only: path/link/readback checks.

Neu khong chay duoc test, ghi ro ly do va cach kiem tra thay the.

## repo documentation updates

Sau khi accept implementation result hoac hoan thanh mot don vi cong viec co y nghia, cap nhat repo docs ngay trong cung turn neu repo co:

- `docs/tasks.md`
- `docs/test_matrix.md`
- `docs/project_status.md`
- `docs/agent_status.md`
- `docs/contracts.md`
- `docs/decisions.md`

Khong de accepted implementation chi nam trong `reports/agent/`.

Khong doi den cuoi phien moi cap nhat status. Neu het token, mat pin, hoac bi gian doan, repo docs phai da noi duoc task nao da xong, task nao chua accept, va next action la gi.

`reports/agent/` la packet/result/history. Neu can assignment board, dung file repo-level nhu:

```text
docs/agent_status.md
```

## multi-agent work in repo

- Chi giao task khi input/output/write scope/validation/forbidden side effects ro.
- Codex/main owns repo-wide rollup docs: `docs/tasks.md`, `docs/project_status.md`, `docs/test_matrix.md`, `docs/contracts.md`, and `docs/agent_status.md`.
- Delegated agents work from one local control card, `agents/<agent>/AGENT.md`, and update its agent-owned checkpoint sections.
- Delegated agents report first through `AGENT.md` `result handoff`.
- Delegated agents create result reports under `reports/agent/<agent>/<task-id>-result.md` only when the packet requires it or the report threshold is met.
- In Human-orchestrated mode, delegated agents may write shared files only when
  the human, Lead, or integration owner grants explicit shared-file write
  delegation naming file, section/rows, operation, lock owner, review target,
  and rollback note.
- Khong cho agents edit cung file group song song neu chua split ownership.
- Bounded implementation packets phai list contracts can cover.
- Agent handoff/report phai co:
  - files changed;
  - validation evidence;
  - forbidden files respected;
  - risks/blockers;
  - contract coverage checklist.
- Lead integrator phai review va cap nhat repo docs truoc khi mark implemented.
- Moi agent/lead phai checkpoint status ngay sau khi mot assignment thay doi trang thai: active, paused, blocked, implemented, rejected, hay needs-review.

## safety

- Khong chay destructive command nhu reset hard, checkout overwrite, rm ngoai yeu cau ro.
- Khong them public login/forms/upload/sensitive-data flow neu project boundary khong cho phep.
- Khong them dependency/CDN/external service neu task khong can va chua co review.
- Khong dua secret vao repo.

## anti-patterns

| Principle | Anti-pattern | Fix |
| --- | --- | --- |
| Coding-session bootstrap | Agent self-selects either a tiny capsule or full pack without capability fit | Use the task-assigned validated projection; `P2` may load full pack, `P0/P1` stop if no valid projection exists |
| Think before coding | Tu assume format, fields, scope | Hoi hoac ghi assumption khi rui ro |
| Simplicity first | Them framework/strategy/plugin cho logic nho | Dung mot ham ro rang den khi phuc tap that |
| Surgical changes | Sua style/refactor lan rong khi fix bug | Chi sua dong can cho task |
| Goal-driven execution | "Improve code" chung chung | Dinh nghia check/test cu the |
| Evidence | Mark done khi chi moi code | Ghi proof hoac missing proof |

## relationship with LLM-Wiki

- Neu project status/task thay doi trong repo, update repo docs.
- Chi update LLM-Wiki khi:
  - repo path/source-of-truth link thay doi;
  - workflow/rule/harness chung thay doi;
  - reusable lesson can duoc tong quat hoa vao knowledge;
  - user yeu cau sync planning history.
- Khong mirror moi repo task vao LLM-Wiki `active.md`.

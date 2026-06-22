# project brief

## problem

AI assistants lose context, read the wrong files, jump into unrelated active projects, over-read the wiki, or edit the wrong source of truth when working across multiple projects and knowledge sources.

Without a disciplined LLM-Wiki, project knowledge, decisions, tasks, validation, and reusable insights become scattered across chat history, repo docs, notes, and ad hoc folders.

## goal

Build LLM-Wiki as a persistent knowledge and project operating system for AI-assisted work.

The system should let AI:

- read only relevant context;
- identify source of truth before editing;
- manage project lifecycle from idea to repo;
- use harness rules for scoped work and evidence;
- compile project docs and raw sources into long-term knowledge;
- accumulate insights over time.

## users / stakeholders

- Primary users: admindebian working with AI agents.
- Operators/admins: admindebian.
- Reviewers/decision makers: admindebian.

## scope

In scope:

- Constitution and source-of-truth rules.
- Program for ingest/query/lint/compile.
- Global AI rules with Karpathy-inspired coding style.
- Harness operating guide.
- Reusable templates.
- Raw/wiki/reports/logs folder skeleton.
- Pre-repo project source-of-truth for LLM-Wiki itself.
- Rules for migrating pre-repo project docs into a future repo.

Out of scope:

- Implementing project-specific product features.
- Migrating existing external projects before LLM-Wiki foundation is stable.
- Automating compile/lint with scripts before manual workflow is proven.
- Using LLM-Wiki compiled summaries as source of truth after a project repo exists.

## requirements

### functional requirements

- FR1: LLM-Wiki must define a clear source-of-truth hierarchy.
- FR2: LLM-Wiki must support selective reading to reduce token load.
- FR3: LLM-Wiki must distinguish raw sources, compiled wiki, harness, templates, project docs, reports, and logs.
- FR4: Pre-repo projects must use the same file structure expected in future repos.
- FR5: After repo migration, old source-of-truth files must be deleted from LLM-Wiki and replaced by pointer/index only.
- FR6: Harness must classify requests, choose risk lanes, create task packets, map proof, and define done criteria.
- FR7: Program must define ingest, query, file-back, lint, and compile operations.

### non-functional requirements

- Performance: AI should not read the full wiki by default.
- Reliability: source-of-truth rules must prevent duplicate status/tasks/decisions.
- Security: raw sources are read-only by default; secrets must not be committed into wiki.
- Privacy/data: uncertain extracted data must be marked `needs-review`.
- Accessibility: files should be plain Markdown with stable lowercase paths.
- Maintainability: each file should have a clear role and avoid duplicated responsibilities.

## eval metrics

- Functional metric: AI can answer which files to read and edit for each request type.
- Quality metric: no duplicate source-of-truth project docs remain after migration.
- Operational metric: a new project can be created from templates with the standard structure.
- User/business metric: future sessions resume without re-explaining the LLM-Wiki model.

## acceptance criteria

- [x] `llm-wiki-constitution.md` exists and defines source-of-truth hierarchy.
- [x] `program.md` exists and defines ingest/query/lint/compile operations.
- [x] `global-rules.md` exists and includes Karpathy-inspired coding style.
- [x] `templates/` contains project and validation templates.
- [x] `harness/` contains canonical lowercase operating guides.
- [x] `raw/`, `wiki/`, `reports/`, and `logs/` skeleton folders exist.
- [x] `wiki/projects/llm-wiki/` source-of-truth docs are complete.
- [x] `wiki/index.md` compiles or links the LLM-Wiki project view.
- [x] First wiki lint report is created.
- [x] Karpathy source is available under `raw/andrej-karpathy-skills-main/`.
- [x] Manual project bootstrap workflow exists in `harness/project-bootstrap.md`.

## constraints

- Technical: plain Markdown and local filesystem first.
- Time: build incrementally, avoid premature automation.
- Budget: no paid services required.
- Compliance/security: raw sources are read-only by default.
- Team: solo developer + AI agents.

## assumptions

- LLM-Wiki remains local-first for now.
- Obsidian-style links are acceptable for navigation.
- Automation should come after the manual process stabilizes.
- Existing legacy files can remain until explicitly migrated.

## open questions

- Should `projects/` legacy notes be migrated into `wiki/projects/` or kept as compatibility pointers?
- Should migrated real-repo concept work be deleted from LLM-Wiki after the repo becomes source of truth?
- Should old local log/history files be removed once durable validation reports exist?
- Should automated lint/link checking be added now or after more manual use?

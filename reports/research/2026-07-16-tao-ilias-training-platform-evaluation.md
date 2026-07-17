# TAO and ILIAS Training Platform Evaluation Research

Date: 2026-07-16

Status: concept research complete; hands-on Docker evidence pending

## decision question

How should TAO Community Edition and ILIAS be evaluated for a training system
in which TAO is the specialist examination candidate and ILIAS is the LMS plus
training-delivery/administration candidate?

This research does not select the final architecture. It establishes product,
edition, workflow, and deployment boundaries for a comparable Docker test.

## official sources checked

### TAO

- [TAO product overview](https://userguide.taotesting.com/user-documentation/latest/public/what-is-tao)
- [TAO versions](https://userguide.taotesting.com/user-documentation/latest/public/tao-versions)
- [TAO Community Edition](https://www.taotesting.com/products/community-edition/)
- [TAO CE installation guide](https://www.taotesting.com/community/installation-guide/)
- [TAO user documentation index](https://userguide.taotesting.com/user-documentation/latest/public)
- [Publishing a test as a delivery](https://userguide.taotesting.com/user-documentation/latest/public/publishing-a-test)
- [Creating a session](https://userguide.taotesting.com/user-documentation/latest/public/creating-a-new-session)
- [Delivering tests via test centers](https://userguide.taotesting.com/user-documentation/latest/public/delivering-tests-via-test-centers)

### ILIAS

- [ILIAS official overview](https://www.ilias.de/en/about-ilias/)
- [ILIAS for universities](https://www.ilias.de/en/lms-ilias-solutions-university/)
- [ILIAS 11 overview and download](https://www.ilias.de/en/download-ilias/)
- [Official ILIAS repository](https://github.com/ILIAS-eLearning/ILIAS)
- [ILIAS 11 installation guide in the release branch](https://github.com/ILIAS-eLearning/ILIAS/blob/release_11/docs/configuration/install.md)

## verified findings

### TAO

- TAO is assessment-first. Its published cycle is Rostering -> Authoring ->
  Delivery -> Results.
- Authoring covers items, tests, scoring rules, test sections, time limits,
  navigation, preview, QTI import/export, and content banking.
- A published Delivery is a frozen executable form of a test. Session planning,
  candidate assignment, monitoring, scoring, and reporting surround it.
- The current documentation describes a product family. Portal, Advance,
  Grader, and Insights must not be assumed to be available in TAO CE merely
  because they appear in the shared user guide.
- Older TAO Core Test Center documentation is explicitly marked deprecated.
  It can inform domain vocabulary but cannot prove the current CE workflow.
- TAO CE has an official Docker Compose evaluation path. The guide states at
  least 4 GB memory for Docker Desktop and requires immediate replacement of
  default administrator and demo-user passwords.
- TAO CE core is advertised under AGPLv3. Any modified network-served use needs
  a license review before adoption.

### ILIAS

- ILIAS is an LMS and integrated learning/work environment with courses,
  learning modules, tests, study programmes, groups, portfolios, surveys,
  collaboration, learning progress, and granular access control.
- It supports SCORM 1.2/2004, IMS QTI, IMS LTI, LOM, and XML/CSV/Excel export,
  but exact versions and round-trip fidelity remain test questions.
- ILIAS can express study/training programmes and course delivery. Official
  university examples also show campus-management systems creating courses and
  assigning learners into ILIAS. Therefore ILIAS must not be assumed to replace
  admissions, registrar, tuition, statutory records, or institution-wide
  scheduling without direct evidence.
- The official repository showed release 11.2 on 2026-07-16. The `release_11`
  installation guide specifies PHP 8.3/8.4, MariaDB/MySQL, Apache/nginx, and
  optional Java, Node, search, certificate, chat, and media components.
- The official installation path is a conventional Linux/web stack. A Docker
  environment is valid for evaluation, but a third-party image is evidence
  about that packaging, not automatically about an officially supported ILIAS
  production topology.

## comparison boundary

```text
TAO   = specialist assessment lifecycle and exam execution candidate
ILIAS = learning environment, course/program delivery, progress, and
        operational training-administration candidate
SIS/training system of record = separate question unless the Docker test proves
        the required institutional records and workflows
```

## principal uncertainty

The largest risk is not feature absence; it is testing a commercial TAO module
while believing it is CE, or treating ILIAS course/program administration as a
complete institutional student/training information system. Every observation
must record product, edition, version/tag, image source, enabled plugins, and
configuration.

## Math Pack audit

The current Math Pack already contains a reasoning controller and useful logic
inside `proof-techniques.md`: quantified statements, implication, equivalence,
necessary/sufficient conditions, counterexamples, deduction, induction, and
proof obligations.

The missing area is a compact formal-logic layer: syntax versus semantics,
propositional and predicate inference rules, validity/satisfiability,
soundness-versus-completeness boundaries, fallacy checks, and when SAT/SMT or a
proof assistant is the correct verifier. Temporal, deontic, non-monotonic, and
logic-programming topics do not yet have a demonstrated consumer.

Recommendation: add one future `formal-logic-and-inference.md` inside
`wiki/knowledge/math/` after a real task or bounded research pass. Do not create
a new top-level folder yet. Split into a subfolder only when at least three
independently triggered logic guides have real consumers.

## stop record

- Current official product/workflow/deployment boundaries are sufficient to
  design the hands-on evaluation.
- Further web research before Docker use has lower decision value than direct
  evidence from the exact editions and versions under test.
- Next evidence should be screenshots, configuration exports, workflow notes,
  timings, logs, and feature/edition gaps from the two Docker environments.


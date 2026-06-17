# Inventory And Topology P06 - Topology And Relationship Development Tasks

Suite: OSS Engineering, Inventory, And Fulfillment

App: Inventory And Topology

App slug: `inventory-and-topology`

Implementation repository: `ts-oss-eng-inventory-and-topology`

Phase: P06 - Topology And Relationship

Phase file: `P06-topology-and-relationship.md`

Phase rationale: Build the Topology And Relationship capability cluster for Inventory And Topology, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work.

Phase exit gate: Inventory And Topology can execute the Topology And Relationship workflows through UI, API, `inventory_topology` persistence, outbox events, audit evidence, and release tests.

Out of scope for this phase: Runtime bootstrap is in P01; unrelated feature clusters and post-launch operations remain in their own phases.

Source tracker: [development-task-tracker.md](development-task-tracker.md)

Repository strategy: [TelcoSuite Repository Strategy](../../../../repository-strategy.md)

## Phase Coverage

- [Topology And Relationship](../features/topology-and-relationship.md)

## Phase Tasks

### DT-03-inventory-and-topology-P06-T001: Build Topology And Relationship API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P06 - Topology And Relationship |
| Priority | P0 |
| Source evidence | [Topology And Relationship](../features/topology-and-relationship.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Topology And Relationship |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/TopologyAndRelationshipController.java`, `inventory_topology.topology_and_relationship`, `contracts/events/TopologyImpactChanged.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/topology-and-relationship` |
| Dependencies | DT-03-inventory-and-topology-P01-T013 |
| Outputs | `TopologyAndRelationshipController`, `TopologyAndRelationshipService`, `inventory_topology.topology_and_relationship` migration, `TopologyImpactChanged` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/topology-and-relationship` using TMF638, TMF639, TMF642, TMF655, TMF703, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Topology And Relationship` state in `inventory_topology.topology_and_relationship` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `TopologyImpactChanged` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/topology-and-relationship`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.topology_and_relationship.id`, and appends `TopologyImpactChanged` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/topology-and-relationship/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Topology And Relationship` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.topology_and_relationship` is required.

#### Definition Of Done

- `TopologyAndRelationshipController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.topology_and_relationship` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/topology-and-relationship`, `inventory_topology.topology_and_relationship`, and `TopologyImpactChanged`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/topology-and-relationship` return `403` and write a denial audit row instead of exposing `Topology And Relationship` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.topology_and_relationship` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `TopologyImpactChanged` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Topology And Relationship` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.topology_and_relationship` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `TopologyAndRelationshipService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/topology-and-relationship` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.topology_and_relationship` columns and indexes; event replay tests validate `contracts/events/TopologyImpactChanged.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P06-T002: Build Topology And Relationship workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P06 - Topology And Relationship |
| Priority | P1 |
| Source evidence | [Topology And Relationship](../features/topology-and-relationship.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Topology And Relationship |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/topology-and-relationship/`, `tests/e2e/topology-and-relationship.spec.ts`, Grafana panel `topology-and-relationship`, and `docs/operations-runbook.md#topology-and-relationship` |
| Dependencies | DT-03-inventory-and-topology-P06-T001 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/topology-and-relationship/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/topology-and-relationship`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Topology And Relationship` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `topology-and-relationship` refreshes, then it shows the metric and links to `docs/operations-runbook.md#topology-and-relationship`.

#### Definition Of Done

- `frontend/src/app/pages/topology-and-relationship/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/topology-and-relationship.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Topology And Relationship` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Topology And Relationship` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/topology-and-relationship.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P06-T003: Prove Topology And Relationship release gate, replay, and handoff evidence

| Field | Value |
| --- | --- |
| Phase | P06 - Topology And Relationship |
| Priority | P1 |
| Source evidence | [Topology And Relationship](../features/topology-and-relationship.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Topology And Relationship |
| Build area | Test/Ops/Release/Event |
| Target artifact | `tests/release/topology-and-relationship.spec.ts`, `docs/release-notes/topology-and-relationship.md`, Grafana dashboard `topology-and-relationship`, and replay fixtures |
| Dependencies | DT-03-inventory-and-topology-P06-T002 |
| Outputs | Release-gate test, replay/reconciliation evidence, accessibility/security/performance reports, dashboard/runbook links, support handoff notes |
| Missing evidence | No |

#### Implementation Notes

- Create a release-gate checklist for `topology-and-relationship` covering Topology And Relationship, with happy path, assisted path, negative path, edge cases, event replay, data reconciliation, security, accessibility, performance, and support evidence.
- Record producer and consumer acknowledgements for phase events, reconcile `inventory_topology.event_outbox`, and link replay fixtures and correlation IDs.
- Update `docs/operations-runbook.md`, `docs/release-notes/topology-and-relationship.md`, and `development-task-tracker.md` with release evidence and unresolved blockers.

#### Acceptance Criteria

1. Given all tasks in `P06-topology-and-relationship.md` are complete, when `tests/release/topology-and-relationship.spec.ts` runs, then it returns exit code `0` and links evidence for UI, API, data, event, security, ops, and test gates.
2. Given a consumer rejects an event from `topology-and-relationship`, when replay is triggered, then the replay fixture preserves `$.correlationId`, `$.eventId`, and consumer acknowledgement state.
3. Given release notes are generated, when support reviews `docs/release-notes/topology-and-relationship.md`, then open blockers, rollback steps, runbook links, and ownership contacts are present.

#### Definition Of Done

- `tests/release/topology-and-relationship.spec.ts`, replay fixtures, dashboard/runbook links, and release notes are committed.
- Accessibility, security, contract, migration, event replay, performance, and operational-readiness evidence is linked from the tracker.
- Open blockers have owner, due date, target increment, and rollback or removal criteria.

#### Negative Scenarios

- Do not mark the phase Done if event replay, reconciliation, accessibility, security, or downstream acknowledgement evidence is missing.
- Do not release `topology-and-relationship` with unresolved cross-app writes, direct schema coupling, or stale source authority assumptions.
- Do not suppress failed release gates; record failures with owner, due date, and target increment.

#### Edge Cases

- Coordinated release gates may require downstream app windows; record scheduling, owner, and fallback route in release notes.
- Historical backfill, replay, bulk update, or migration repair runs must include preview, partial failure report, and rollback evidence.
- High-volume launch periods require dashboard thresholds, alert owners, queue back-pressure, and support escalation paths.

#### Test Expectations

- `tests/release/topology-and-relationship.spec.ts`, `mvn test`, OpenAPI/event replay tests, Flyway checks, Playwright/Cypress E2E, accessibility, security, and k6/performance gates pass.
- `docker compose config`, clean-checkout smoke, `helm lint`, Kubernetes dry-run, dashboard JSON validation, and runbook link checks pass.
- Tracker evidence links command output, PRs, screenshots, replay payloads, dashboards, release notes, and support handoff notes.

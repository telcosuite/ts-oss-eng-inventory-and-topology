# Inventory And Topology P05 - Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery Development Tasks

Suite: OSS Engineering, Inventory, And Fulfillment

App: Inventory And Topology

App slug: `inventory-and-topology`

Implementation repository: `ts-oss-eng-inventory-and-topology`

Phase: P05 - Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery

Phase file: `P05-reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity.md`

Phase rationale: Build the Reservation And Assignment, Resource Inventory, Resource Pool And Capacity, Service Inventory capability cluster for Inventory And Topology, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work.

Phase exit gate: Inventory And Topology can execute the Reservation And Assignment, Resource Inventory, Resource Pool And Capacity, Service Inventory workflows through UI, API, `inventory_topology` persistence, outbox events, audit evidence, and release tests.

Out of scope for this phase: Runtime bootstrap is in P01; unrelated feature clusters and post-launch operations remain in their own phases.

Source tracker: [development-task-tracker.md](development-task-tracker.md)

Repository strategy: [TelcoSuite Repository Strategy](../../../../repository-strategy.md)

## Phase Coverage

- [Reservation And Assignment](../features/reservation-and-assignment.md)
- [Resource Inventory](../features/resource-inventory.md)
- [Resource Pool And Capacity](../features/resource-pool-and-capacity.md)
- [Service Inventory](../features/service-inventory.md)

## Phase Tasks

### DT-03-inventory-and-topology-P05-T001: Build Reservation And Assignment API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P05 - Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery |
| Priority | P0 |
| Source evidence | [Reservation And Assignment](../features/reservation-and-assignment.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Reservation And Assignment |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/ReservationAndAssignmentController.java`, `inventory_topology.reservation_and_assignment`, `contracts/events/ReservationAndAssignmentStateChangedEvent.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/reservation-and-assignment` |
| Dependencies | DT-03-inventory-and-topology-P01-T013 |
| Outputs | `ReservationAndAssignmentController`, `ReservationAndAssignmentService`, `inventory_topology.reservation_and_assignment` migration, `ReservationAndAssignmentStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/reservation-and-assignment` using TMF639, TMF641, TMF652, TMF685, TMF716, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Reservation And Assignment` state in `inventory_topology.reservation_and_assignment` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `ReservationAndAssignmentStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/reservation-and-assignment`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.reservation_and_assignment.id`, and appends `ReservationAndAssignmentStateChangedEvent` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/reservation-and-assignment/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Reservation And Assignment` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.reservation_and_assignment` is required.

#### Definition Of Done

- `ReservationAndAssignmentController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.reservation_and_assignment` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/reservation-and-assignment`, `inventory_topology.reservation_and_assignment`, and `ReservationAndAssignmentStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/reservation-and-assignment` return `403` and write a denial audit row instead of exposing `Reservation And Assignment` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.reservation_and_assignment` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `ReservationAndAssignmentStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Reservation And Assignment` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.reservation_and_assignment` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `ReservationAndAssignmentService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/reservation-and-assignment` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.reservation_and_assignment` columns and indexes; event replay tests validate `contracts/events/ReservationAndAssignmentStateChangedEvent.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P05-T002: Build Reservation And Assignment workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P05 - Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery |
| Priority | P1 |
| Source evidence | [Reservation And Assignment](../features/reservation-and-assignment.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Reservation And Assignment |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/reservation-and-assignment/`, `tests/e2e/reservation-and-assignment.spec.ts`, Grafana panel `reservation-and-assignment`, and `docs/operations-runbook.md#reservation-and-assignment` |
| Dependencies | DT-03-inventory-and-topology-P05-T001 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/reservation-and-assignment/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/reservation-and-assignment`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Reservation And Assignment` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `reservation-and-assignment` refreshes, then it shows the metric and links to `docs/operations-runbook.md#reservation-and-assignment`.

#### Definition Of Done

- `frontend/src/app/pages/reservation-and-assignment/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/reservation-and-assignment.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Reservation And Assignment` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Reservation And Assignment` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/reservation-and-assignment.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P05-T003: Build Resource Inventory API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P05 - Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery |
| Priority | P0 |
| Source evidence | [Resource Inventory](../features/resource-inventory.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Resource Inventory |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/ResourceInventoryController.java`, `inventory_topology.resource_inventory`, `contracts/events/ResourceInventoryCreated.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-inventory` |
| Dependencies | DT-03-inventory-and-topology-P05-T001 |
| Outputs | `ResourceInventoryController`, `ResourceInventoryService`, `inventory_topology.resource_inventory` migration, `ResourceInventoryCreated` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-inventory` using TMF634, TMF639, TMF687, TMF703, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Resource Inventory` state in `inventory_topology.resource_inventory` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `ResourceInventoryCreated` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-inventory`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.resource_inventory.id`, and appends `ResourceInventoryCreated` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-inventory/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Resource Inventory` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.resource_inventory` is required.

#### Definition Of Done

- `ResourceInventoryController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.resource_inventory` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-inventory`, `inventory_topology.resource_inventory`, and `ResourceInventoryCreated`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-inventory` return `403` and write a denial audit row instead of exposing `Resource Inventory` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.resource_inventory` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `ResourceInventoryCreated` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Resource Inventory` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.resource_inventory` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `ResourceInventoryService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-inventory` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.resource_inventory` columns and indexes; event replay tests validate `contracts/events/ResourceInventoryCreated.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P05-T004: Build Resource Inventory workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P05 - Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery |
| Priority | P1 |
| Source evidence | [Resource Inventory](../features/resource-inventory.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Resource Inventory |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/resource-inventory/`, `tests/e2e/resource-inventory.spec.ts`, Grafana panel `resource-inventory`, and `docs/operations-runbook.md#resource-inventory` |
| Dependencies | DT-03-inventory-and-topology-P05-T003 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/resource-inventory/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/resource-inventory`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Resource Inventory` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `resource-inventory` refreshes, then it shows the metric and links to `docs/operations-runbook.md#resource-inventory`.

#### Definition Of Done

- `frontend/src/app/pages/resource-inventory/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/resource-inventory.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Resource Inventory` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Resource Inventory` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/resource-inventory.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P05-T005: Build Resource Pool And Capacity API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P05 - Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery |
| Priority | P0 |
| Source evidence | [Resource Pool And Capacity](../features/resource-pool-and-capacity.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Resource Pool And Capacity |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/ResourcePoolAndCapacityController.java`, `inventory_topology.resource_pool_and_capacity`, `contracts/events/ResourcePoolCreated.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-pool-and-capacity` |
| Dependencies | DT-03-inventory-and-topology-P05-T003 |
| Outputs | `ResourcePoolAndCapacityController`, `ResourcePoolAndCapacityService`, `inventory_topology.resource_pool_and_capacity` migration, `ResourcePoolCreated` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-pool-and-capacity` using TMF639, TMF685, TMF716, TMF771, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Resource Pool And Capacity` state in `inventory_topology.resource_pool_and_capacity` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `ResourcePoolCreated` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-pool-and-capacity`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.resource_pool_and_capacity.id`, and appends `ResourcePoolCreated` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-pool-and-capacity/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Resource Pool And Capacity` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.resource_pool_and_capacity` is required.

#### Definition Of Done

- `ResourcePoolAndCapacityController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.resource_pool_and_capacity` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-pool-and-capacity`, `inventory_topology.resource_pool_and_capacity`, and `ResourcePoolCreated`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-pool-and-capacity` return `403` and write a denial audit row instead of exposing `Resource Pool And Capacity` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.resource_pool_and_capacity` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `ResourcePoolCreated` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Resource Pool And Capacity` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.resource_pool_and_capacity` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `ResourcePoolAndCapacityService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/resource-pool-and-capacity` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.resource_pool_and_capacity` columns and indexes; event replay tests validate `contracts/events/ResourcePoolCreated.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P05-T006: Build Resource Pool And Capacity workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P05 - Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery |
| Priority | P1 |
| Source evidence | [Resource Pool And Capacity](../features/resource-pool-and-capacity.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Resource Pool And Capacity |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/resource-pool-and-capacity/`, `tests/e2e/resource-pool-and-capacity.spec.ts`, Grafana panel `resource-pool-and-capacity`, and `docs/operations-runbook.md#resource-pool-and-capacity` |
| Dependencies | DT-03-inventory-and-topology-P05-T005 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/resource-pool-and-capacity/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/resource-pool-and-capacity`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Resource Pool And Capacity` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `resource-pool-and-capacity` refreshes, then it shows the metric and links to `docs/operations-runbook.md#resource-pool-and-capacity`.

#### Definition Of Done

- `frontend/src/app/pages/resource-pool-and-capacity/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/resource-pool-and-capacity.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Resource Pool And Capacity` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Resource Pool And Capacity` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/resource-pool-and-capacity.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P05-T007: Build Service Inventory API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P05 - Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery |
| Priority | P0 |
| Source evidence | [Service Inventory](../features/service-inventory.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Service Inventory |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/ServiceInventoryController.java`, `inventory_topology.service_inventory`, `contracts/events/ServiceInventoryCreated.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/service-inventory` |
| Dependencies | DT-03-inventory-and-topology-P05-T005 |
| Outputs | `ServiceInventoryController`, `ServiceInventoryService`, `inventory_topology.service_inventory` migration, `ServiceInventoryCreated` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/service-inventory` using TMF638, TMF639, TMF641, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Service Inventory` state in `inventory_topology.service_inventory` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `ServiceInventoryCreated` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/service-inventory`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.service_inventory.id`, and appends `ServiceInventoryCreated` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/service-inventory/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Service Inventory` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.service_inventory` is required.

#### Definition Of Done

- `ServiceInventoryController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.service_inventory` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/service-inventory`, `inventory_topology.service_inventory`, and `ServiceInventoryCreated`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/service-inventory` return `403` and write a denial audit row instead of exposing `Service Inventory` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.service_inventory` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `ServiceInventoryCreated` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Service Inventory` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.service_inventory` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `ServiceInventoryService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/service-inventory` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.service_inventory` columns and indexes; event replay tests validate `contracts/events/ServiceInventoryCreated.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P05-T008: Build Service Inventory workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P05 - Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery |
| Priority | P1 |
| Source evidence | [Service Inventory](../features/service-inventory.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Service Inventory |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/service-inventory/`, `tests/e2e/service-inventory.spec.ts`, Grafana panel `service-inventory`, and `docs/operations-runbook.md#service-inventory` |
| Dependencies | DT-03-inventory-and-topology-P05-T007 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/service-inventory/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/service-inventory`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Service Inventory` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `service-inventory` refreshes, then it shows the metric and links to `docs/operations-runbook.md#service-inventory`.

#### Definition Of Done

- `frontend/src/app/pages/service-inventory/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/service-inventory.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Service Inventory` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Service Inventory` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/service-inventory.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P05-T009: Prove Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery release gate, replay, and handoff evidence

| Field | Value |
| --- | --- |
| Phase | P05 - Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery |
| Priority | P1 |
| Source evidence | [Reservation And Assignment](../features/reservation-and-assignment.md), [Resource Inventory](../features/resource-inventory.md), [Resource Pool And Capacity](../features/resource-pool-and-capacity.md), [Service Inventory](../features/service-inventory.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Reservation And Assignment And Resource Inventory And Resource Pool And Capacity Delivery |
| Build area | Test/Ops/Release/Event |
| Target artifact | `tests/release/reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity.spec.ts`, `docs/release-notes/reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity.md`, Grafana dashboard `reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity`, and replay fixtures |
| Dependencies | DT-03-inventory-and-topology-P05-T002, DT-03-inventory-and-topology-P05-T004, DT-03-inventory-and-topology-P05-T006, DT-03-inventory-and-topology-P05-T008 |
| Outputs | Release-gate test, replay/reconciliation evidence, accessibility/security/performance reports, dashboard/runbook links, support handoff notes |
| Missing evidence | No |

#### Implementation Notes

- Create a release-gate checklist for `reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity` covering Reservation And Assignment, Resource Inventory, Resource Pool And Capacity, Service Inventory, with happy path, assisted path, negative path, edge cases, event replay, data reconciliation, security, accessibility, performance, and support evidence.
- Record producer and consumer acknowledgements for phase events, reconcile `inventory_topology.event_outbox`, and link replay fixtures and correlation IDs.
- Update `docs/operations-runbook.md`, `docs/release-notes/reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity.md`, and `development-task-tracker.md` with release evidence and unresolved blockers.

#### Acceptance Criteria

1. Given all tasks in `P05-reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity.md` are complete, when `tests/release/reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity.spec.ts` runs, then it returns exit code `0` and links evidence for UI, API, data, event, security, ops, and test gates.
2. Given a consumer rejects an event from `reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity`, when replay is triggered, then the replay fixture preserves `$.correlationId`, `$.eventId`, and consumer acknowledgement state.
3. Given release notes are generated, when support reviews `docs/release-notes/reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity.md`, then open blockers, rollback steps, runbook links, and ownership contacts are present.

#### Definition Of Done

- `tests/release/reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity.spec.ts`, replay fixtures, dashboard/runbook links, and release notes are committed.
- Accessibility, security, contract, migration, event replay, performance, and operational-readiness evidence is linked from the tracker.
- Open blockers have owner, due date, target increment, and rollback or removal criteria.

#### Negative Scenarios

- Do not mark the phase Done if event replay, reconciliation, accessibility, security, or downstream acknowledgement evidence is missing.
- Do not release `reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity` with unresolved cross-app writes, direct schema coupling, or stale source authority assumptions.
- Do not suppress failed release gates; record failures with owner, due date, and target increment.

#### Edge Cases

- Coordinated release gates may require downstream app windows; record scheduling, owner, and fallback route in release notes.
- Historical backfill, replay, bulk update, or migration repair runs must include preview, partial failure report, and rollback evidence.
- High-volume launch periods require dashboard thresholds, alert owners, queue back-pressure, and support escalation paths.

#### Test Expectations

- `tests/release/reservation-and-assignment-and-resource-inventory-and-resource-pool-and-capacity.spec.ts`, `mvn test`, OpenAPI/event replay tests, Flyway checks, Playwright/Cypress E2E, accessibility, security, and k6/performance gates pass.
- `docker compose config`, clean-checkout smoke, `helm lint`, Kubernetes dry-run, dashboard JSON validation, and runbook link checks pass.
- Tracker evidence links command output, PRs, screenshots, replay payloads, dashboards, release notes, and support handoff notes.

# Inventory And Topology P04 - Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery Development Tasks

Suite: OSS Engineering, Inventory, And Fulfillment

App: Inventory And Topology

App slug: `inventory-and-topology`

Implementation repository: `ts-oss-eng-inventory-and-topology`

Phase: P04 - Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery

Phase file: `P04-numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning.md`

Phase rationale: Build the Numbering, IP, SIM/eSIM, And Identifier Resource, Operational Inventory Planning, Physical Plant And Facility Inventory, Product Inventory capability cluster for Inventory And Topology, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work.

Phase exit gate: Inventory And Topology can execute the Numbering, IP, SIM/eSIM, And Identifier Resource, Operational Inventory Planning, Physical Plant And Facility Inventory, Product Inventory workflows through UI, API, `inventory_topology` persistence, outbox events, audit evidence, and release tests.

Out of scope for this phase: Runtime bootstrap is in P01; unrelated feature clusters and post-launch operations remain in their own phases.

Source tracker: [development-task-tracker.md](development-task-tracker.md)

Repository strategy: [TelcoSuite Repository Strategy](../../../../repository-strategy.md)

## Phase Coverage

- [Numbering, IP, SIM/eSIM, And Identifier Resource](../features/numbering-ip-sim-esim-and-identifier-resource.md)
- [Operational Inventory Planning](../features/operational-inventory-planning.md)
- [Physical Plant And Facility Inventory](../features/physical-plant-and-facility-inventory.md)
- [Product Inventory](../features/product-inventory.md)

## Phase Tasks

### DT-03-inventory-and-topology-P04-T001: Build Numbering, IP, SIM/eSIM, And Identifier Resource API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P04 - Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery |
| Priority | P0 |
| Source evidence | [Numbering, IP, SIM/eSIM, And Identifier Resource](../features/numbering-ip-sim-esim-and-identifier-resource.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Numbering, IP, SIM/eSIM, And Identifier Resource |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/NumberingIpSimEsimAndIdentifierResourceController.java`, `inventory_topology.numbering_ip_sim_esim_and_identifier_resource`, `contracts/events/NumberingIpSimEsimAndIdentifierResourceStateChangedEvent.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/numbering-ip-sim-esim-and-identifier-resource` |
| Dependencies | DT-03-inventory-and-topology-P01-T013 |
| Outputs | `NumberingIpSimEsimAndIdentifierResourceController`, `NumberingIpSimEsimAndIdentifierResourceService`, `inventory_topology.numbering_ip_sim_esim_and_identifier_resource` migration, `NumberingIpSimEsimAndIdentifierResourceStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/numbering-ip-sim-esim-and-identifier-resource` using TMF639, TMF640, TMF685, TMF716, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Numbering, IP, SIM/eSIM, And Identifier Resource` state in `inventory_topology.numbering_ip_sim_esim_and_identifier_resource` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `NumberingIpSimEsimAndIdentifierResourceStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/numbering-ip-sim-esim-and-identifier-resource`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.numbering_ip_sim_esim_and_identifier_resource.id`, and appends `NumberingIpSimEsimAndIdentifierResourceStateChangedEvent` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/numbering-ip-sim-esim-and-identifier-resource/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Numbering, IP, SIM/eSIM, And Identifier Resource` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.numbering_ip_sim_esim_and_identifier_resource` is required.

#### Definition Of Done

- `NumberingIpSimEsimAndIdentifierResourceController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.numbering_ip_sim_esim_and_identifier_resource` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/numbering-ip-sim-esim-and-identifier-resource`, `inventory_topology.numbering_ip_sim_esim_and_identifier_resource`, and `NumberingIpSimEsimAndIdentifierResourceStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/numbering-ip-sim-esim-and-identifier-resource` return `403` and write a denial audit row instead of exposing `Numbering, IP, SIM/eSIM, And Identifier Resource` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.numbering_ip_sim_esim_and_identifier_resource` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `NumberingIpSimEsimAndIdentifierResourceStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Numbering, IP, SIM/eSIM, And Identifier Resource` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.numbering_ip_sim_esim_and_identifier_resource` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `NumberingIpSimEsimAndIdentifierResourceService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/numbering-ip-sim-esim-and-identifier-resource` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.numbering_ip_sim_esim_and_identifier_resource` columns and indexes; event replay tests validate `contracts/events/NumberingIpSimEsimAndIdentifierResourceStateChangedEvent.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P04-T002: Build Numbering, IP, SIM/eSIM, And Identifier Resource workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P04 - Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery |
| Priority | P1 |
| Source evidence | [Numbering, IP, SIM/eSIM, And Identifier Resource](../features/numbering-ip-sim-esim-and-identifier-resource.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Numbering, IP, SIM/eSIM, And Identifier Resource |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/numbering-ip-sim-esim-and-identifier-resource/`, `tests/e2e/numbering-ip-sim-esim-and-identifier-resource.spec.ts`, Grafana panel `numbering-ip-sim-esim-and-identifier-resource`, and `docs/operations-runbook.md#numbering-ip-sim-esim-and-identifier-resource` |
| Dependencies | DT-03-inventory-and-topology-P04-T001 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/numbering-ip-sim-esim-and-identifier-resource/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/numbering-ip-sim-esim-and-identifier-resource`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Numbering, IP, SIM/eSIM, And Identifier Resource` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `numbering-ip-sim-esim-and-identifier-resource` refreshes, then it shows the metric and links to `docs/operations-runbook.md#numbering-ip-sim-esim-and-identifier-resource`.

#### Definition Of Done

- `frontend/src/app/pages/numbering-ip-sim-esim-and-identifier-resource/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/numbering-ip-sim-esim-and-identifier-resource.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Numbering, IP, SIM/eSIM, And Identifier Resource` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Numbering, IP, SIM/eSIM, And Identifier Resource` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/numbering-ip-sim-esim-and-identifier-resource.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P04-T003: Build Operational Inventory Planning API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P04 - Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery |
| Priority | P0 |
| Source evidence | [Operational Inventory Planning](../features/operational-inventory-planning.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Operational Inventory Planning |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/OperationalInventoryPlanningController.java`, `inventory_topology.operational_inventory_planning`, `contracts/events/AssignmentReadinessChanged.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/operational-inventory-planning` |
| Dependencies | DT-03-inventory-and-topology-P04-T001 |
| Outputs | `OperationalInventoryPlanningController`, `OperationalInventoryPlanningService`, `inventory_topology.operational_inventory_planning` migration, `AssignmentReadinessChanged` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/operational-inventory-planning` using TMF639, TMF685, TMF716, TMF771, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Operational Inventory Planning` state in `inventory_topology.operational_inventory_planning` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `AssignmentReadinessChanged` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/operational-inventory-planning`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.operational_inventory_planning.id`, and appends `AssignmentReadinessChanged` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/operational-inventory-planning/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Operational Inventory Planning` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.operational_inventory_planning` is required.

#### Definition Of Done

- `OperationalInventoryPlanningController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.operational_inventory_planning` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/operational-inventory-planning`, `inventory_topology.operational_inventory_planning`, and `AssignmentReadinessChanged`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/operational-inventory-planning` return `403` and write a denial audit row instead of exposing `Operational Inventory Planning` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.operational_inventory_planning` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `AssignmentReadinessChanged` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Operational Inventory Planning` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.operational_inventory_planning` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `OperationalInventoryPlanningService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/operational-inventory-planning` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.operational_inventory_planning` columns and indexes; event replay tests validate `contracts/events/AssignmentReadinessChanged.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P04-T004: Build Operational Inventory Planning workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P04 - Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery |
| Priority | P1 |
| Source evidence | [Operational Inventory Planning](../features/operational-inventory-planning.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Operational Inventory Planning |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/operational-inventory-planning/`, `tests/e2e/operational-inventory-planning.spec.ts`, Grafana panel `operational-inventory-planning`, and `docs/operations-runbook.md#operational-inventory-planning` |
| Dependencies | DT-03-inventory-and-topology-P04-T003 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/operational-inventory-planning/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/operational-inventory-planning`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Operational Inventory Planning` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `operational-inventory-planning` refreshes, then it shows the metric and links to `docs/operations-runbook.md#operational-inventory-planning`.

#### Definition Of Done

- `frontend/src/app/pages/operational-inventory-planning/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/operational-inventory-planning.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Operational Inventory Planning` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Operational Inventory Planning` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/operational-inventory-planning.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P04-T005: Build Physical Plant And Facility Inventory API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P04 - Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery |
| Priority | P0 |
| Source evidence | [Physical Plant And Facility Inventory](../features/physical-plant-and-facility-inventory.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Physical Plant And Facility Inventory |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/PhysicalPlantAndFacilityInventoryController.java`, `inventory_topology.physical_plant_and_facility_inventory`, `contracts/events/PhysicalPlantAndFacilityInventoryStateChangedEvent.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/physical-plant-and-facility-inventory` |
| Dependencies | DT-03-inventory-and-topology-P04-T003 |
| Outputs | `PhysicalPlantAndFacilityInventoryController`, `PhysicalPlantAndFacilityInventoryService`, `inventory_topology.physical_plant_and_facility_inventory` migration, `PhysicalPlantAndFacilityInventoryStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/physical-plant-and-facility-inventory` using TMF634, TMF639, TMF674, TMF675, TMF697, TMF703, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Physical Plant And Facility Inventory` state in `inventory_topology.physical_plant_and_facility_inventory` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `PhysicalPlantAndFacilityInventoryStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/physical-plant-and-facility-inventory`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.physical_plant_and_facility_inventory.id`, and appends `PhysicalPlantAndFacilityInventoryStateChangedEvent` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/physical-plant-and-facility-inventory/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Physical Plant And Facility Inventory` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.physical_plant_and_facility_inventory` is required.

#### Definition Of Done

- `PhysicalPlantAndFacilityInventoryController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.physical_plant_and_facility_inventory` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/physical-plant-and-facility-inventory`, `inventory_topology.physical_plant_and_facility_inventory`, and `PhysicalPlantAndFacilityInventoryStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/physical-plant-and-facility-inventory` return `403` and write a denial audit row instead of exposing `Physical Plant And Facility Inventory` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.physical_plant_and_facility_inventory` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `PhysicalPlantAndFacilityInventoryStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Physical Plant And Facility Inventory` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.physical_plant_and_facility_inventory` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `PhysicalPlantAndFacilityInventoryService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/physical-plant-and-facility-inventory` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.physical_plant_and_facility_inventory` columns and indexes; event replay tests validate `contracts/events/PhysicalPlantAndFacilityInventoryStateChangedEvent.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P04-T006: Build Physical Plant And Facility Inventory workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P04 - Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery |
| Priority | P1 |
| Source evidence | [Physical Plant And Facility Inventory](../features/physical-plant-and-facility-inventory.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Physical Plant And Facility Inventory |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/physical-plant-and-facility-inventory/`, `tests/e2e/physical-plant-and-facility-inventory.spec.ts`, Grafana panel `physical-plant-and-facility-inventory`, and `docs/operations-runbook.md#physical-plant-and-facility-inventory` |
| Dependencies | DT-03-inventory-and-topology-P04-T005 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/physical-plant-and-facility-inventory/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/physical-plant-and-facility-inventory`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Physical Plant And Facility Inventory` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `physical-plant-and-facility-inventory` refreshes, then it shows the metric and links to `docs/operations-runbook.md#physical-plant-and-facility-inventory`.

#### Definition Of Done

- `frontend/src/app/pages/physical-plant-and-facility-inventory/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/physical-plant-and-facility-inventory.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Physical Plant And Facility Inventory` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Physical Plant And Facility Inventory` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/physical-plant-and-facility-inventory.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P04-T007: Build Product Inventory API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P04 - Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery |
| Priority | P0 |
| Source evidence | [Product Inventory](../features/product-inventory.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Product Inventory |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/ProductInventoryController.java`, `inventory_topology.product_inventory`, `contracts/events/ProductInventoryCreated.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/product-inventory` |
| Dependencies | DT-03-inventory-and-topology-P04-T005 |
| Outputs | `ProductInventoryController`, `ProductInventoryService`, `inventory_topology.product_inventory` migration, `ProductInventoryCreated` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/product-inventory` using TMF637, TMF638, TMF641, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Product Inventory` state in `inventory_topology.product_inventory` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `ProductInventoryCreated` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/product-inventory`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.product_inventory.id`, and appends `ProductInventoryCreated` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/product-inventory/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Product Inventory` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.product_inventory` is required.

#### Definition Of Done

- `ProductInventoryController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.product_inventory` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/product-inventory`, `inventory_topology.product_inventory`, and `ProductInventoryCreated`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/product-inventory` return `403` and write a denial audit row instead of exposing `Product Inventory` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.product_inventory` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `ProductInventoryCreated` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Product Inventory` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.product_inventory` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `ProductInventoryService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/product-inventory` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.product_inventory` columns and indexes; event replay tests validate `contracts/events/ProductInventoryCreated.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P04-T008: Build Product Inventory workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P04 - Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery |
| Priority | P1 |
| Source evidence | [Product Inventory](../features/product-inventory.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Product Inventory |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/product-inventory/`, `tests/e2e/product-inventory.spec.ts`, Grafana panel `product-inventory`, and `docs/operations-runbook.md#product-inventory` |
| Dependencies | DT-03-inventory-and-topology-P04-T007 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/product-inventory/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/product-inventory`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Product Inventory` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `product-inventory` refreshes, then it shows the metric and links to `docs/operations-runbook.md#product-inventory`.

#### Definition Of Done

- `frontend/src/app/pages/product-inventory/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/product-inventory.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Product Inventory` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Product Inventory` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/product-inventory.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P04-T009: Prove Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery release gate, replay, and handoff evidence

| Field | Value |
| --- | --- |
| Phase | P04 - Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery |
| Priority | P1 |
| Source evidence | [Numbering, IP, SIM/eSIM, And Identifier Resource](../features/numbering-ip-sim-esim-and-identifier-resource.md), [Operational Inventory Planning](../features/operational-inventory-planning.md), [Physical Plant And Facility Inventory](../features/physical-plant-and-facility-inventory.md), [Product Inventory](../features/product-inventory.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Numbering, IP, SIM/eSIM, And Identifier Resource And Operational Inventory Planning And Physical Plant And Facility Inventory Delivery |
| Build area | Test/Ops/Release/Event |
| Target artifact | `tests/release/numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning.spec.ts`, `docs/release-notes/numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning.md`, Grafana dashboard `numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning`, and replay fixtures |
| Dependencies | DT-03-inventory-and-topology-P04-T002, DT-03-inventory-and-topology-P04-T004, DT-03-inventory-and-topology-P04-T006, DT-03-inventory-and-topology-P04-T008 |
| Outputs | Release-gate test, replay/reconciliation evidence, accessibility/security/performance reports, dashboard/runbook links, support handoff notes |
| Missing evidence | No |

#### Implementation Notes

- Create a release-gate checklist for `numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning` covering Numbering, IP, SIM/eSIM, And Identifier Resource, Operational Inventory Planning, Physical Plant And Facility Inventory, Product Inventory, with happy path, assisted path, negative path, edge cases, event replay, data reconciliation, security, accessibility, performance, and support evidence.
- Record producer and consumer acknowledgements for phase events, reconcile `inventory_topology.event_outbox`, and link replay fixtures and correlation IDs.
- Update `docs/operations-runbook.md`, `docs/release-notes/numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning.md`, and `development-task-tracker.md` with release evidence and unresolved blockers.

#### Acceptance Criteria

1. Given all tasks in `P04-numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning.md` are complete, when `tests/release/numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning.spec.ts` runs, then it returns exit code `0` and links evidence for UI, API, data, event, security, ops, and test gates.
2. Given a consumer rejects an event from `numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning`, when replay is triggered, then the replay fixture preserves `$.correlationId`, `$.eventId`, and consumer acknowledgement state.
3. Given release notes are generated, when support reviews `docs/release-notes/numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning.md`, then open blockers, rollback steps, runbook links, and ownership contacts are present.

#### Definition Of Done

- `tests/release/numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning.spec.ts`, replay fixtures, dashboard/runbook links, and release notes are committed.
- Accessibility, security, contract, migration, event replay, performance, and operational-readiness evidence is linked from the tracker.
- Open blockers have owner, due date, target increment, and rollback or removal criteria.

#### Negative Scenarios

- Do not mark the phase Done if event replay, reconciliation, accessibility, security, or downstream acknowledgement evidence is missing.
- Do not release `numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning` with unresolved cross-app writes, direct schema coupling, or stale source authority assumptions.
- Do not suppress failed release gates; record failures with owner, due date, and target increment.

#### Edge Cases

- Coordinated release gates may require downstream app windows; record scheduling, owner, and fallback route in release notes.
- Historical backfill, replay, bulk update, or migration repair runs must include preview, partial failure report, and rollback evidence.
- High-volume launch periods require dashboard thresholds, alert owners, queue back-pressure, and support escalation paths.

#### Test Expectations

- `tests/release/numbering-ip-sim-esim-and-identifier-resource-and-operational-inventory-planning.spec.ts`, `mvn test`, OpenAPI/event replay tests, Flyway checks, Playwright/Cypress E2E, accessibility, security, and k6/performance gates pass.
- `docker compose config`, clean-checkout smoke, `helm lint`, Kubernetes dry-run, dashboard JSON validation, and runbook link checks pass.
- Tracker evidence links command output, PRs, screenshots, replay payloads, dashboards, release notes, and support handoff notes.

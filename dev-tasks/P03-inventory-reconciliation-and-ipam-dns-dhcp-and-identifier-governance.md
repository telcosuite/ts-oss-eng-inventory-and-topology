# Inventory And Topology P03 - Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery Development Tasks

Suite: OSS Engineering, Inventory, And Fulfillment

App: Inventory And Topology

App slug: `inventory-and-topology`

Implementation repository: `ts-oss-eng-inventory-and-topology`

Phase: P03 - Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery

Phase file: `P03-inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance.md`

Phase rationale: Build the Inventory Reconciliation, IPAM DNS DHCP And Identifier Governance, Migration And Decommissioning, Network Discovery And Inventory Sync capability cluster for Inventory And Topology, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work.

Phase exit gate: Inventory And Topology can execute the Inventory Reconciliation, IPAM DNS DHCP And Identifier Governance, Migration And Decommissioning, Network Discovery And Inventory Sync workflows through UI, API, `inventory_topology` persistence, outbox events, audit evidence, and release tests.

Out of scope for this phase: Runtime bootstrap is in P01; unrelated feature clusters and post-launch operations remain in their own phases.

Source tracker: [development-task-tracker.md](development-task-tracker.md)

Repository strategy: [TelcoSuite Repository Strategy](../../../../repository-strategy.md)

## Phase Coverage

- [Inventory Reconciliation](../features/inventory-reconciliation.md)
- [IPAM DNS DHCP And Identifier Governance](../features/ipam-dns-dhcp-and-identifier-governance.md)
- [Migration And Decommissioning](../features/migration-and-decommissioning.md)
- [Network Discovery And Inventory Sync](../features/network-discovery-and-inventory-sync.md)

## Phase Tasks

### DT-03-inventory-and-topology-P03-T001: Build Inventory Reconciliation API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P03 - Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery |
| Priority | P0 |
| Source evidence | [Inventory Reconciliation](../features/inventory-reconciliation.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Inventory Reconciliation |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/InventoryReconciliationController.java`, `inventory_topology.inventory_reconciliation`, `contracts/events/InventoryReconciliationStateChangedEvent.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/inventory-reconciliation` |
| Dependencies | DT-03-inventory-and-topology-P01-T013 |
| Outputs | `InventoryReconciliationController`, `InventoryReconciliationService`, `inventory_topology.inventory_reconciliation` migration, `InventoryReconciliationStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/inventory-reconciliation` using TMF637, TMF638, TMF639, TMF697, TMF703, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Inventory Reconciliation` state in `inventory_topology.inventory_reconciliation` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `InventoryReconciliationStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/inventory-reconciliation`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.inventory_reconciliation.id`, and appends `InventoryReconciliationStateChangedEvent` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/inventory-reconciliation/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Inventory Reconciliation` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.inventory_reconciliation` is required.

#### Definition Of Done

- `InventoryReconciliationController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.inventory_reconciliation` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/inventory-reconciliation`, `inventory_topology.inventory_reconciliation`, and `InventoryReconciliationStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/inventory-reconciliation` return `403` and write a denial audit row instead of exposing `Inventory Reconciliation` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.inventory_reconciliation` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `InventoryReconciliationStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Inventory Reconciliation` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.inventory_reconciliation` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `InventoryReconciliationService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/inventory-reconciliation` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.inventory_reconciliation` columns and indexes; event replay tests validate `contracts/events/InventoryReconciliationStateChangedEvent.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P03-T002: Build Inventory Reconciliation workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P03 - Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery |
| Priority | P1 |
| Source evidence | [Inventory Reconciliation](../features/inventory-reconciliation.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Inventory Reconciliation |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/inventory-reconciliation/`, `tests/e2e/inventory-reconciliation.spec.ts`, Grafana panel `inventory-reconciliation`, and `docs/operations-runbook.md#inventory-reconciliation` |
| Dependencies | DT-03-inventory-and-topology-P03-T001 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/inventory-reconciliation/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/inventory-reconciliation`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Inventory Reconciliation` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `inventory-reconciliation` refreshes, then it shows the metric and links to `docs/operations-runbook.md#inventory-reconciliation`.

#### Definition Of Done

- `frontend/src/app/pages/inventory-reconciliation/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/inventory-reconciliation.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Inventory Reconciliation` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Inventory Reconciliation` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/inventory-reconciliation.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P03-T003: Build IPAM DNS DHCP And Identifier Governance API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P03 - Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery |
| Priority | P0 |
| Source evidence | [IPAM DNS DHCP And Identifier Governance](../features/ipam-dns-dhcp-and-identifier-governance.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | IPAM DNS DHCP And Identifier Governance |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/IpamDnsDhcpAndIdentifierGovernanceController.java`, `inventory_topology.ipam_dns_dhcp_and_identifier_governance`, `contracts/events/IpamBindingChanged.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/ipam-dns-dhcp-and-identifier-governance` |
| Dependencies | DT-03-inventory-and-topology-P03-T001 |
| Outputs | `IpamDnsDhcpAndIdentifierGovernanceController`, `IpamDnsDhcpAndIdentifierGovernanceService`, `inventory_topology.ipam_dns_dhcp_and_identifier_governance` migration, `IpamBindingChanged` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/ipam-dns-dhcp-and-identifier-governance` using TMF639, TMF640, TMF685, TMF716, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `IPAM DNS DHCP And Identifier Governance` state in `inventory_topology.ipam_dns_dhcp_and_identifier_governance` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `IpamBindingChanged` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/ipam-dns-dhcp-and-identifier-governance`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.ipam_dns_dhcp_and_identifier_governance.id`, and appends `IpamBindingChanged` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/ipam-dns-dhcp-and-identifier-governance/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `IPAM DNS DHCP And Identifier Governance` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.ipam_dns_dhcp_and_identifier_governance` is required.

#### Definition Of Done

- `IpamDnsDhcpAndIdentifierGovernanceController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.ipam_dns_dhcp_and_identifier_governance` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/ipam-dns-dhcp-and-identifier-governance`, `inventory_topology.ipam_dns_dhcp_and_identifier_governance`, and `IpamBindingChanged`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/ipam-dns-dhcp-and-identifier-governance` return `403` and write a denial audit row instead of exposing `IPAM DNS DHCP And Identifier Governance` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.ipam_dns_dhcp_and_identifier_governance` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `IpamBindingChanged` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `IPAM DNS DHCP And Identifier Governance` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.ipam_dns_dhcp_and_identifier_governance` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `IpamDnsDhcpAndIdentifierGovernanceService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/ipam-dns-dhcp-and-identifier-governance` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.ipam_dns_dhcp_and_identifier_governance` columns and indexes; event replay tests validate `contracts/events/IpamBindingChanged.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P03-T004: Build IPAM DNS DHCP And Identifier Governance workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P03 - Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery |
| Priority | P1 |
| Source evidence | [IPAM DNS DHCP And Identifier Governance](../features/ipam-dns-dhcp-and-identifier-governance.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | IPAM DNS DHCP And Identifier Governance |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/ipam-dns-dhcp-and-identifier-governance/`, `tests/e2e/ipam-dns-dhcp-and-identifier-governance.spec.ts`, Grafana panel `ipam-dns-dhcp-and-identifier-governance`, and `docs/operations-runbook.md#ipam-dns-dhcp-and-identifier-governance` |
| Dependencies | DT-03-inventory-and-topology-P03-T003 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/ipam-dns-dhcp-and-identifier-governance/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/ipam-dns-dhcp-and-identifier-governance`, when records exist, then the workbench returns `$.uiState='ready'` and renders `IPAM DNS DHCP And Identifier Governance` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `ipam-dns-dhcp-and-identifier-governance` refreshes, then it shows the metric and links to `docs/operations-runbook.md#ipam-dns-dhcp-and-identifier-governance`.

#### Definition Of Done

- `frontend/src/app/pages/ipam-dns-dhcp-and-identifier-governance/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/ipam-dns-dhcp-and-identifier-governance.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `IPAM DNS DHCP And Identifier Governance` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `IPAM DNS DHCP And Identifier Governance` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/ipam-dns-dhcp-and-identifier-governance.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P03-T005: Build Migration And Decommissioning API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P03 - Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery |
| Priority | P0 |
| Source evidence | [Migration And Decommissioning](../features/migration-and-decommissioning.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Migration And Decommissioning |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/MigrationAndDecommissioningController.java`, `inventory_topology.migration_and_decommissioning`, `contracts/events/MigrationWaveApproved.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/migration-and-decommissioning` |
| Dependencies | DT-03-inventory-and-topology-P03-T003 |
| Outputs | `MigrationAndDecommissioningController`, `MigrationAndDecommissioningService`, `inventory_topology.migration_and_decommissioning` migration, `MigrationWaveApproved` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/migration-and-decommissioning` using TMF637, TMF638, TMF639, TMF655, TMF681, TMF697, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Migration And Decommissioning` state in `inventory_topology.migration_and_decommissioning` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `MigrationWaveApproved` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/migration-and-decommissioning`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.migration_and_decommissioning.id`, and appends `MigrationWaveApproved` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/migration-and-decommissioning/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Migration And Decommissioning` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.migration_and_decommissioning` is required.

#### Definition Of Done

- `MigrationAndDecommissioningController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.migration_and_decommissioning` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/migration-and-decommissioning`, `inventory_topology.migration_and_decommissioning`, and `MigrationWaveApproved`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/migration-and-decommissioning` return `403` and write a denial audit row instead of exposing `Migration And Decommissioning` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.migration_and_decommissioning` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `MigrationWaveApproved` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Migration And Decommissioning` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.migration_and_decommissioning` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `MigrationAndDecommissioningService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/migration-and-decommissioning` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.migration_and_decommissioning` columns and indexes; event replay tests validate `contracts/events/MigrationWaveApproved.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P03-T006: Build Migration And Decommissioning workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P03 - Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery |
| Priority | P1 |
| Source evidence | [Migration And Decommissioning](../features/migration-and-decommissioning.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Migration And Decommissioning |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/migration-and-decommissioning/`, `tests/e2e/migration-and-decommissioning.spec.ts`, Grafana panel `migration-and-decommissioning`, and `docs/operations-runbook.md#migration-and-decommissioning` |
| Dependencies | DT-03-inventory-and-topology-P03-T005 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/migration-and-decommissioning/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/migration-and-decommissioning`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Migration And Decommissioning` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `migration-and-decommissioning` refreshes, then it shows the metric and links to `docs/operations-runbook.md#migration-and-decommissioning`.

#### Definition Of Done

- `frontend/src/app/pages/migration-and-decommissioning/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/migration-and-decommissioning.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Migration And Decommissioning` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Migration And Decommissioning` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/migration-and-decommissioning.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P03-T007: Build Network Discovery And Inventory Sync API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P03 - Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery |
| Priority | P0 |
| Source evidence | [Network Discovery And Inventory Sync](../features/network-discovery-and-inventory-sync.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Network Discovery And Inventory Sync |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/inventoryandtopology/NetworkDiscoveryAndInventorySyncController.java`, `inventory_topology.network_discovery_and_inventory_sync`, `contracts/events/NetworkDiscoveryAndInventorySyncStateChangedEvent.json`, and `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/network-discovery-and-inventory-sync` |
| Dependencies | DT-03-inventory-and-topology-P03-T005 |
| Outputs | `NetworkDiscoveryAndInventorySyncController`, `NetworkDiscoveryAndInventorySyncService`, `inventory_topology.network_discovery_and_inventory_sync` migration, `NetworkDiscoveryAndInventorySyncStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/network-discovery-and-inventory-sync` using TMF638, TMF639, TMF642, TMF655, TMF703, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Network Discovery And Inventory Sync` state in `inventory_topology.network_discovery_and_inventory_sync` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `NetworkDiscoveryAndInventorySyncStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Inventory steward / manager, Provisioning analyst, Assurance analyst and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/network-discovery-and-inventory-sync`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `inventory_topology.network_discovery_and_inventory_sync.id`, and appends `NetworkDiscoveryAndInventorySyncStateChangedEvent` to `inventory_topology.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/network-discovery-and-inventory-sync/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Network Discovery And Inventory Sync` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `inventory_topology.network_discovery_and_inventory_sync` is required.

#### Definition Of Done

- `NetworkDiscoveryAndInventorySyncController`, service, repository, DTOs, validation, error model, and migration for `inventory_topology.network_discovery_and_inventory_sync` are committed under `ts-oss-eng-inventory-and-topology`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/network-discovery-and-inventory-sync`, `inventory_topology.network_discovery_and_inventory_sync`, and `NetworkDiscoveryAndInventorySyncStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/network-discovery-and-inventory-sync` return `403` and write a denial audit row instead of exposing `Network Discovery And Inventory Sync` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `inventory_topology.network_discovery_and_inventory_sync` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `NetworkDiscoveryAndInventorySyncStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Network Discovery And Inventory Sync` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `inventory_topology.network_discovery_and_inventory_sync` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `NetworkDiscoveryAndInventorySyncService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/inventory-and-topology/v1/network-discovery-and-inventory-sync` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `inventory_topology.network_discovery_and_inventory_sync` columns and indexes; event replay tests validate `contracts/events/NetworkDiscoveryAndInventorySyncStateChangedEvent.json` and `inventory_topology.event_outbox` ordering.

### DT-03-inventory-and-topology-P03-T008: Build Network Discovery And Inventory Sync workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P03 - Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery |
| Priority | P1 |
| Source evidence | [Network Discovery And Inventory Sync](../features/network-discovery-and-inventory-sync.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Network Discovery And Inventory Sync |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/network-discovery-and-inventory-sync/`, `tests/e2e/network-discovery-and-inventory-sync.spec.ts`, Grafana panel `network-discovery-and-inventory-sync`, and `docs/operations-runbook.md#network-discovery-and-inventory-sync` |
| Dependencies | DT-03-inventory-and-topology-P03-T007 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/network-discovery-and-inventory-sync/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Inventory steward / manager, Provisioning analyst, Assurance analyst.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/inventory-and-topology/network-discovery-and-inventory-sync`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Network Discovery And Inventory Sync` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `network-discovery-and-inventory-sync` refreshes, then it shows the metric and links to `docs/operations-runbook.md#network-discovery-and-inventory-sync`.

#### Definition Of Done

- `frontend/src/app/pages/network-discovery-and-inventory-sync/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/network-discovery-and-inventory-sync.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Network Discovery And Inventory Sync` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Network Discovery And Inventory Sync` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/network-discovery-and-inventory-sync.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-inventory-and-topology-P03-T009: Prove Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery release gate, replay, and handoff evidence

| Field | Value |
| --- | --- |
| Phase | P03 - Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery |
| Priority | P1 |
| Source evidence | [Inventory Reconciliation](../features/inventory-reconciliation.md), [IPAM DNS DHCP And Identifier Governance](../features/ipam-dns-dhcp-and-identifier-governance.md), [Migration And Decommissioning](../features/migration-and-decommissioning.md), [Network Discovery And Inventory Sync](../features/network-discovery-and-inventory-sync.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../inventory-and-topology.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Inventory Reconciliation And IPAM DNS DHCP And Identifier Governance And Migration And Decommissioning Delivery |
| Build area | Test/Ops/Release/Event |
| Target artifact | `tests/release/inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance.spec.ts`, `docs/release-notes/inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance.md`, Grafana dashboard `inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance`, and replay fixtures |
| Dependencies | DT-03-inventory-and-topology-P03-T002, DT-03-inventory-and-topology-P03-T004, DT-03-inventory-and-topology-P03-T006, DT-03-inventory-and-topology-P03-T008 |
| Outputs | Release-gate test, replay/reconciliation evidence, accessibility/security/performance reports, dashboard/runbook links, support handoff notes |
| Missing evidence | No |

#### Implementation Notes

- Create a release-gate checklist for `inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance` covering Inventory Reconciliation, IPAM DNS DHCP And Identifier Governance, Migration And Decommissioning, Network Discovery And Inventory Sync, with happy path, assisted path, negative path, edge cases, event replay, data reconciliation, security, accessibility, performance, and support evidence.
- Record producer and consumer acknowledgements for phase events, reconcile `inventory_topology.event_outbox`, and link replay fixtures and correlation IDs.
- Update `docs/operations-runbook.md`, `docs/release-notes/inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance.md`, and `development-task-tracker.md` with release evidence and unresolved blockers.

#### Acceptance Criteria

1. Given all tasks in `P03-inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance.md` are complete, when `tests/release/inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance.spec.ts` runs, then it returns exit code `0` and links evidence for UI, API, data, event, security, ops, and test gates.
2. Given a consumer rejects an event from `inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance`, when replay is triggered, then the replay fixture preserves `$.correlationId`, `$.eventId`, and consumer acknowledgement state.
3. Given release notes are generated, when support reviews `docs/release-notes/inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance.md`, then open blockers, rollback steps, runbook links, and ownership contacts are present.

#### Definition Of Done

- `tests/release/inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance.spec.ts`, replay fixtures, dashboard/runbook links, and release notes are committed.
- Accessibility, security, contract, migration, event replay, performance, and operational-readiness evidence is linked from the tracker.
- Open blockers have owner, due date, target increment, and rollback or removal criteria.

#### Negative Scenarios

- Do not mark the phase Done if event replay, reconciliation, accessibility, security, or downstream acknowledgement evidence is missing.
- Do not release `inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance` with unresolved cross-app writes, direct schema coupling, or stale source authority assumptions.
- Do not suppress failed release gates; record failures with owner, due date, and target increment.

#### Edge Cases

- Coordinated release gates may require downstream app windows; record scheduling, owner, and fallback route in release notes.
- Historical backfill, replay, bulk update, or migration repair runs must include preview, partial failure report, and rollback evidence.
- High-volume launch periods require dashboard thresholds, alert owners, queue back-pressure, and support escalation paths.

#### Test Expectations

- `tests/release/inventory-reconciliation-and-ipam-dns-dhcp-and-identifier-governance.spec.ts`, `mvn test`, OpenAPI/event replay tests, Flyway checks, Playwright/Cypress E2E, accessibility, security, and k6/performance gates pass.
- `docker compose config`, clean-checkout smoke, `helm lint`, Kubernetes dry-run, dashboard JSON validation, and runbook link checks pass.
- Tracker evidence links command output, PRs, screenshots, replay payloads, dashboards, release notes, and support handoff notes.

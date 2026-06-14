# Inventory Connectivity And Path Management Feature Specification

Reviewed: 2026-06-11

Suite: OSS Engineering, Inventory, And Fulfillment

App: [Inventory And Topology App](../README.md)

Source module detail: [Modules And Features](../modules-and-features.md)

Source gap review: [E2E Feature Gap Assessment](../../../e2e-feature-gap-assessment.md)

Feature area slug: `inventory-connectivity-and-path-management`

E2E gap severity: Core

## Feature Intent

Maintain accepted operational connectivity paths, circuits, bearer links, service paths, endpoints, diversity, shared-risk groups, partner/off-net demarcation, virtual/cloud connectivity, and path confidence. The feature makes "inventory connectivity" visible as a first-class capability while preserving the boundary that planned topology and design alternatives remain with Network Engineering And Design until accepted into operational inventory.

## Telecom Objects And Decision Rights

- Master entity: inventory connectivity path. Inventory And Topology owns actual path state, endpoint relationships, segment order, circuit/bearer references, path confidence, diversity and shared-risk tags, partner demarcation reference, correction history, and publication events.
- Referenced entities: product inventory, service inventory, resource inventory, topology relationships, inventory location bindings, physical plant inventory, planned topology, activation evidence, field evidence, discovery state, partner/off-net records, alarms, incidents, changes, and serviceability decisions.
- Primary decisions: create, accept, correct, reroute, split, merge, suppress, quarantine, retire, publish, or request consumer revalidation for an inventory connectivity path.
- ODA boundary: Inventory And Topology masters accepted actual connectivity. Network Engineering And Design masters planned connectivity until acceptance. Activation platforms execute commands; assurance and change consume path impact.

## Personas, Jobs To Be Done, And Outcomes

| Persona | Job to be done | Outcome |
| --- | --- | --- |
| Inventory steward / manager | Maintain accepted actual path state and path confidence. | Inventory connectivity is searchable, auditable, and consumable without direct database access. |
| Provisioning analyst | Validate endpoint, diversity, and path readiness before assignment or activation. | Fulfillment receives usable path state and avoids duplicate or broken circuit assignments. |
| Assurance analyst | Trace customer, service, resource, site, and failure-domain impact. | NOC can traverse actual path and understand confidence, stale segments, and correction routes. |
| Capacity planner | Consume path utilization, bottleneck, diversity, and stranded capacity signals. | Planning receives trusted operational path evidence without mastering actual inventory. |
| Network engineer | Compare planned, discovered, as-built, and accepted paths. | Engineering sees path acceptance, discrepancy, waiver, and rollback evidence. |
| Migration manager | Control reroutes, path retirement, and decommissioning across service waves. | Migration waves do not break hidden dependencies or release active circuits prematurely. |

## Core Workflows

| Stage | Telecom trigger or validation | Orchestration, exception, completion, and evidence |
| --- | --- | --- |
| Trigger | Inventory Connectivity And Path Management starts from activation update, design acceptance, build handover, field as-built evidence, discovery sync, partner feed, service qualification, assurance impact request, change planning, migration wave, or manual correction. | The connectivity path opens with owner, tenant, market, geography, technology domain, source trigger, lifecycle action, endpoints, path type, correlation ID, source evidence, confidence, and impacted consumer list. |
| Validation | The app validates endpoint existence, segment continuity, directionality, bandwidth/service class, path diversity, shared-risk policy, site/demarc reference, discovery confidence, partner boundary evidence, and decommission constraints. | Invalid path state creates connectivity discrepancies, assignment conflicts, quarantine tasks, correction approvals, or consumer revalidation before fulfillment, activation, CPQ, order, billing, field, assurance, partner, planning, or data consumers rely on it. |
| Orchestration | Inventory And Topology coordinates design, fulfillment, activation, field, discovery, GIS, assurance, change, partner, serviceability, and data consumers through APIs, events, governed projections, adapters, or evidence packages. | Consumers receive authoritative actual path outputs while their own lifecycle records remain private to owning apps. |
| Exception | If broken path continuity, ambiguous endpoint, duplicate circuit ID, diversity violation, stale discovered segment, or partner demarcation evidence gap occurs, the workflow routes to the accountable owner. | The exception captures failed rule, affected product/service/resource/site, risk, confidence, correction authority, blocked consumer, evidence gap, and escalation path. |
| Completion | Completion occurs when the path is accepted, activated, assigned, corrected, rerouted, reconciled, quarantined, migrated, decommissioned, retired, or published with downstream acknowledgement. | Completion evidence includes inventory version, endpoints, path segments, topology impact, assignment/reservation state, source evidence, approval/waiver, event IDs, and consumer revalidation status. |

## Capability Slices

| Feature ID | Feature | Parent feature area | Priority guidance |
| --- | --- | --- | --- |
| F-inventory-connectivity-and-path-management-01 | Circuit and bearer path inventory | Inventory Connectivity And Path Management | P1: required for service activation, assurance impact, and decommission control. |
| F-inventory-connectivity-and-path-management-02 | Endpoint and service path relationship | Inventory Connectivity And Path Management | P1: required for customer/service/resource traversal. |
| F-inventory-connectivity-and-path-management-03 | Physical and logical path continuity | Inventory Connectivity And Path Management | P1: required for reliable fulfillment and assurance. |
| F-inventory-connectivity-and-path-management-04 | Diversity, SRLG, and failure-domain tagging | Inventory Connectivity And Path Management | P1: required for enterprise, resilience, and change planning. |
| F-inventory-connectivity-and-path-management-05 | Partner/off-net demarcation | Inventory Connectivity And Path Management | P2: required for wholesale, off-net, and partner delivery evidence. |
| F-inventory-connectivity-and-path-management-06 | Virtual, cloud, SDN/NFV, and slice connectivity | Inventory Connectivity And Path Management | P2: required for modern network and cloud services. |
| F-inventory-connectivity-and-path-management-07 | Path confidence and correction workflow | Inventory Connectivity And Path Management | P2: required for source authority arbitration and consumer revalidation. |

## Acceptance Criteria

1. **AC-inventory-connectivity-and-path-management-01:** Given an authorized inventory, provisioning, assurance, capacity, network engineering, partner, or migration user creates or updates a connectivity path, when the lifecycle advances, then Inventory And Topology validates endpoints, segment continuity, directionality, bandwidth/service class, diversity, shared-risk policy, site/demarc reference, source confidence, and tenant/region boundary.
2. **AC-inventory-connectivity-and-path-management-02:** Given the path references product, service, resource, site, field, activation, order, billing, assurance, partner, design, or discovery data, when a persona opens the record, then the app shows source owner, source timestamp, freshness, confidence, correction route, and whether the data is app-owned or read-only.
3. **AC-inventory-connectivity-and-path-management-03:** Given path continuity is broken or an endpoint is ambiguous, when validation fails, then the app keeps the path in draft, blocked, discrepancy, quarantined, or rejected state with severity, owner, due date, affected service/resource/customer, reason code, waiver option, and correlation ID.
4. **AC-inventory-connectivity-and-path-management-04:** Given the path changes due to activation, field evidence, discovery, build handover, partner callback, migration, or manual stewardship, when the transition is committed, then the app stores actor, role, decision right, reason, before/after value, evidence links, policy version, tenant/region boundary, and idempotency key.
5. **AC-inventory-connectivity-and-path-management-05:** Given downstream consumers subscribe to path changes, when the path changes state, then the app emits a versioned event with changed fields, impacted products/services/resources/sites, confidence, replay metadata, and correlation ID.
6. **AC-inventory-connectivity-and-path-management-06:** Given a change, migration, decommission, rollback, or assurance impact request references the path, when closure is requested, then the app validates downstream handoffs, open discrepancies, active reservations/assignments, customer/NOC/care impact, retention, and legal hold.
7. **AC-inventory-connectivity-and-path-management-07:** Given operations leaders review Inventory Connectivity And Path Management, when they open dashboards, then they see broken paths, stale paths, duplicate circuits, diversity violations, low-confidence partner paths, consumer lag, and correction aging.

## Negative Scenarios And Edge Cases

| Scenario | Expected behavior |
| --- | --- |
| Discovered path omits a hidden shared resource | Mark the path low confidence and route to stewardship before publishing accepted impact. |
| Circuit ID is duplicated across overlapping domains | Block assignment or activation closure and open a conflict case. |
| Diversity policy is violated by two paths sharing a risk group | Block approval or require exception approval with customer/service impact. |
| Partner/off-net segment cannot be independently verified | Preserve partner evidence, lower confidence, and request revalidation before decommission or assurance closure. |
| Retired resource remains in an active path | Prevent resource reuse and open path correction or migration hold. |
| Virtual path changes without matching inventory update | Raise discovery drift and hold consumer publication until accepted or waived. |
| Restricted topology is queried by an unauthorized persona | Mask sensitive customer, site, critical infrastructure, partner, and route details. |

## API, Event, And Data Requirements

Related APIs and API areas: [TMF638](../../../../../references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory), [TMF639](../../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF703](../../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory), [TMF645](../../../../../references/tmforum-open-apis/openapi-specs/TMF645_ServiceQualification), [TMF655](../../../../../references/tmforum-open-apis/openapi-specs/TMF655_ChangeManagement)

- Use TMF638, TMF639, and TMF703 for service, resource, and entity relationships. Use TMF645 and TMF655 as consumers or requestors for qualification and change impact, not as connectivity masters.
- Non-TMF Connectivity Path API may be needed for ordered path segments, diversity and shared-risk groups, path confidence, partner demarcation, and multi-hop traversal.
- Command APIs must cover create, ingest, validate, update, reroute, split, merge, quarantine, reconcile, correct, migrate, decommission, retire, replay, and close.
- Query APIs must cover search, detail, endpoint traversal, path impact, related path references, source evidence, confidence, work queue, metrics, and audit/evidence retrieval with role-aware masking.
- Domain events must include ConnectivityPathCreated, ConnectivityPathCorrected, ConnectivityPathRerouted, ConnectivityPathRetired, ConnectivityImpactChanged, ConnectivityDiversityViolated, ConsumerRevalidationRequested, and reconciliation-failed variants.
- Inventory And Topology owns actual path state; design, activation, field, assurance, partner, and change apps remain masters for their own lifecycle records.

## Integrations And Handoffs

- Network Engineering And Design for planned topology and design acceptance.
- Inventory Location Management for endpoints, demarcation, site, rack, port, and route placement.
- Fulfillment And Activation Control Tower for activation evidence and rollback context.
- Field Work for as-built path evidence and demarcation proof.
- NOC And Assurance and Change And Maintenance Operations for impact, suppression, collision, and restoration workflows.
- Partner/off-net systems for externally controlled segment evidence.
- Data platform for graph lineage, confidence, and regulated evidence exports.

## Non-Functional Requirements

- Interactive path search and detail views should remain below 2 seconds for normal operator use; multi-hop traversal, bulk correction, and large impact analysis can run asynchronously.
- The app must serve last-known accepted path with freshness and confidence indicators during discovery, partner, activation, assurance, or data outages.
- Path history must retain actor, reason, source evidence, before/after value, policy version, approval/waiver, event ID, external reference, confidence, legal hold flag, and retention class.
- API, event, export, adapter, and dashboard paths must enforce tenant isolation, region boundaries, least privilege, sensitive topology masking, critical-infrastructure masking, partner controls, legal hold, and data residency.

## Observability And Test Approach

- Metrics: paths created, corrected, rerouted, retired, accepted by consumers, broken path count, duplicate circuit count, stale path count, diversity violations, confidence score, partner evidence aging, and consumer lag.
- Queues: draft, pending validation, pending evidence, blocked dependency, endpoint conflict, diversity violation, partner evidence gap, stewardship review, quarantine, migration hold, decommission review, retrying, corrected, completed, and archived.
- Tests: unit rules for endpoint and path continuity; API/event contract tests; workflow tests for create, reroute, correction, quarantine, migration, decommissioning, and consumer revalidation; integration tests with design, activation, field, discovery, partner, assurance, change, planning, and data; security tests for masking and tenant boundaries; performance tests for traversal and graph impact.

## Feature Detail Review Implementation Alignment (2026-06-14)

Source: [App Feature Detail Review Alignment](README.md#feature-detail-review-alignment-2026-06-14) and [Suite Feature Detail Review](../../feature-detail-review.md).

Apply this app review scope to this feature: accepted inventory truth, topology and path confidence, reservations and assignments, discovery staging, reconciliation, migration, and decommissioning.

Implementation updates required for this feature:

- Re-check the core workflows and add or adjust happy paths, approval paths, exception queues, rollback or compensation behavior, and handoffs so the review scope is directly represented in build stories.
- Add or refine UI workbench expectations, including operator queues, evidence panels, policy decision traces, preview/simulation views, and status dashboards where this feature owns the behavior.
- Add or refine command APIs, query APIs, events, app-owned data fields, DDL gap notes, and integration handoffs needed to support the review scope without crossing app data ownership boundaries.
- Add acceptance criteria for source authority, tenant and residency controls, lifecycle state, approval evidence, idempotency, correlation IDs, SLA/OLA timers, and downstream acknowledgement where applicable.
- Add negative scenarios for stale data, duplicate events, policy denial, missing evidence, downstream outage, unauthorized access, bulk/replay risk, and manual override misuse.
- Extend tests to include happy path, negative path, edge case, API contract, event replay, data reconciliation, security, accessibility, observability, runbook, and release-gate evidence for the review scope.

## Build-Ready Refinement (2026-06-14)

This refinement converts the feature review material for Inventory Connectivity And Path Management into delivery slices that can become epics, stories, API contracts, migrations, and test cases. Treat Inventory And Topology App as the owning application for this feature within Suite OSS Engineering, Inventory, And Fulfillment and schema `inventory_topology`.

| Workstream | Build-ready delivery guidance |
| --- | --- |
| UX and workflow | Build the Inventory Connectivity And Path Management workbench for Inventory steward / manager, Provisioning analyst, Assurance analyst, Capacity planner, Network engineer, Migration manager. Include search or intake, guided validation, detail view, lifecycle timeline, decision panel, evidence drawer, exception queue, bulk or replay controls where relevant, saved filters, SLA/OLA aging, empty/error states, and role-aware masking. The UI must expose create, accept, correct, reroute, split, merge, suppress, quarantine, retire, publish, or request consumer revalidation for an inventory connectivity path. and block closure when required evidence, approval, reconciliation, or downstream acknowledgement is missing. |
| API and events | Implement command and query APIs around inventory-connectivity-and-path-management using TMF638, TMF639, TMF703, TMF645, TMF655. Command APIs must cover create, ingest, validate, update, reroute, split, merge, quarantine, reconcile, correct, migrate, decommission, retire, replay, and close. Query APIs must cover search, detail, endpoint traversal, path impact, related path references, source evidence, confidence, work queue, metrics, and audit/evidence retrieval with role-aware masking. Domain events must include ConnectivityPathCreated, ConnectivityPathCorrected, ConnectivityPathRerouted, ConnectivityPathRetired, ConnectivityImpactChanged, ConnectivityDiversityViolated, ConsumerRevalidationRequested... Non-TMF Connectivity Path API may be needed for ordered path segments, diversity and shared-risk groups, path confidence, partner demarcation, and multi-hop traversal. Every command, query, and event must carry tenant/brand/market where applicable, actor, source channel, reason code, idempotency key, correlation ID, external reference, lifecycle state, and version metadata. |
| Data and controls | Persist inventory connectivity path. inside `inventory_topology` with typed lifecycle, owner, status reason, timestamps, policy decision, source freshness, confidence, old/new value, evidence, and reconciliation fields. Inventory And Topology owns actual path state; design, activation, field, assurance, partner, and change apps remain masters for their own lifecycle records. Keep TMF payloads, extension characteristics, imported evidence, and low-stability metadata in JSONB while promoting operationally searched lifecycle fields to typed columns. |
| Integration and handoff | Exchange product inventory, service inventory, resource inventory, topology relationships, inventory location bindings, physical plant inventory, planned topology, activation evidence, field... with Network Engineering And Design for planned topology and design acceptance., Inventory Location Management for endpoints, demarcation, site, rack, port, and route placement., Fulfillment And Activation Control Tower for activation... only through APIs, events, workflow tasks, governed projections, adapters, evidence packages, or certified data products. Show source owner, freshness, confidence, dependency state, retry status, blocked consumer, and completion evidence so the app does not create shadow mastership or direct cross-schema coupling. |
| Security, privacy, and compliance | Enforce RBAC/ABAC, tenant and residency boundaries, least privilege, separation of duties, masking, purpose limitation, retention, legal hold, export control, manual override expiry, immutable audit, and evidence chain of custody for Inventory Connectivity And Path Management. Sensitive customer, revenue, partner, security, network, credential, or regulatory evidence must be masked unless the persona has explicit operational purpose. |
| Tests and operations | Create unit, API contract, event replay/idempotency, workflow, integration, migration, data reconciliation, security/privacy, accessibility/localization, performance, dashboard, alert, and runbook tests for Inventory Connectivity And Path Management. Cover happy path, assisted path, automated path, exception path, bulk/project path, stale or duplicate input, downstream outage, policy denial, manual override, and reconciliation mismatch. Use the existing review scope - accepted inventory truth, topology and path confidence, reservations and assignments, discovery staging, reconciliation, migration, and decommissioning. - as mandatory backlog and test evidence. |

Implementation notes:

- Treat Inventory And Topology App as the lifecycle owner for inventory connectivity path.; referenced data such as product inventory, service inventory, resource inventory, topology relationships, inventory location bindings, physical plant inventory, planned topology, activation evidence, field evidence, discovery state... must remain references, snapshots, projections, evidence packages, or consumer acknowledgements unless the source file explicitly gives this app mastership.
- Make TMF alignment visible in every story: use named TMF resources where they fit, document non-TMF extension APIs with OpenAPI, and keep extension payloads compatible with TMF-style identifiers, lifecycle state, related entities, pagination, errors, and event envelopes.
- Build UI and API behavior around decision evidence, not only CRUD: surface the permitted next actions, policy decision, state reason, owner, SLA/OLA timer, blocked dependency, retry or compensation path, and closure proof.
- Add development tasks for route/page/component work, command/query handlers, DTO validation, entity/repository/migration changes, outbox/event contracts, projection refresh, privacy/security checks, and operational dashboards.
- Definition-of-done evidence must show downstream consumers can use published state through APIs, events, projections, workflow tasks, or certified data products without direct database reads or manual spreadsheet reconciliation.

## Definition Of Done

1. Connectivity path lifecycle supports draft, planned, reserved, assigned, active, blocked, discrepant, quarantined, migrated, decommissioning, retired, corrected, rejected, and archived states where applicable.
2. Persona workflows include decision rights, validation messages, exception routing, source evidence, confidence, and audit capture.
3. TMF-aligned references, non-TMF extension APIs, events, idempotency, correlation IDs, replay behavior, and consumer revalidation contracts are documented and contract-tested.
4. Data ownership, private app database boundaries, governed projections, retention, legal hold, tenant isolation, critical-topology masking, partner evidence, and export controls match data mastery guidance.
5. Operational dashboards explain path state, source authority, confidence, diversity, discrepancies, topology impact, migration/decommissioning status, consumer lag, and correction backlog.

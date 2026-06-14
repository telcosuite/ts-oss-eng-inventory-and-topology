# Operational Inventory Planning Feature Specification

Reviewed: 2026-06-11

Suite: OSS Engineering, Inventory, And Fulfillment

App: [Inventory And Topology App](../README.md)

Source module detail: [Modules And Features](../modules-and-features.md)

Source gap review: [E2E Feature Gap Assessment](../../../e2e-feature-gap-assessment.md)

Feature area slug: `operational-inventory-planning`

E2E gap severity: Core

## Feature Intent

Plan short-horizon inventory readiness using actual inventory, pool state, reservations, assignments, discovery confidence, location confidence, connectivity readiness, migration needs, decommission release, stranded capacity, and recovered resources. The feature provides the "inventory planning" surface inside Inventory And Topology while strategic capacity models, investment scenarios, and future-capacity reservations remain owned by Network Investment And Capacity Planning until converted.

## Telecom Objects And Decision Rights

- Master entity: operational inventory plan. Inventory And Topology owns short-horizon inventory readiness state, readiness gaps, pool snapshots used for operational decisions, conversion to operational reservation/assignment, stranded capacity decision, decommission release readiness, correction history, and publication events.
- Referenced entities: capacity plans, future-capacity reservations, resource pools, operational reservations, assignments, resource inventory, topology relationships, inventory location bindings, connectivity paths, discovery state, migration waves, decommissioning records, serviceability decisions, and resource usage facts.
- Primary decisions: create, approve, block, convert, release, replan, quarantine, correct, cancel, publish, or request consumer revalidation for an operational inventory plan.
- ODA boundary: Network Investment And Capacity Planning owns strategic capacity models, exhaustion forecasts, investment scenarios, and future reservations. Inventory And Topology owns operational readiness once a plan is converted into inventory-owned reservation, assignment, release, or accepted inventory state.

## Personas, Jobs To Be Done, And Outcomes

| Persona | Job to be done | Outcome |
| --- | --- | --- |
| Inventory steward / manager | Plan inventory readiness and correction work before fulfillment or migration execution. | Inventory gaps are visible before orders, migrations, or decommissioning waves fail. |
| Provisioning analyst | Convert eligible plan items into operational reservations or assignments. | Execution starts with valid, non-stale, non-conflicting inventory state. |
| Assurance analyst | Understand inventory readiness risks for impact, change, and restoration. | Assurance can flag low-confidence inventory before customer-impacting events. |
| Capacity planner | Consume actual inventory readiness, stranded capacity, and recovered capacity signals. | Strategic planning receives operational actuals without mastering inventory. |
| Network engineer | Compare planned topology, as-built state, and accepted operational readiness. | Engineering sees what is ready, blocked, or rejected before handoff. |
| Migration manager | Plan waves around inventory availability, customer impact, rollback, and decommission release. | Migration and decommission plans avoid hidden inventory blockers. |

## Core Workflows

| Stage | Telecom trigger or validation | Orchestration, exception, completion, and evidence |
| --- | --- | --- |
| Trigger | Operational Inventory Planning starts from capacity plan handoff, future reservation conversion, enterprise quote demand, fulfillment backlog, migration wave, decommission initiative, recovered asset signal, pool exhaustion, or inventory confidence threshold breach. | The operational inventory plan opens with owner, tenant, market, geography, technology domain, planning window, source trigger, lifecycle action, correlation ID, source evidence, confidence, and impacted consumer list. |
| Validation | The app validates actual inventory state, resource pool state, reservation expiry, assignment conflict, location confidence, connectivity readiness, discovery confidence, legal hold, migration/decommission constraints, and strategic-planning boundary. | Invalid readiness creates a blocked plan item, reservation conflict, stranded capacity case, decommission hold, stewardship task, or exception approval before fulfillment, activation, field, assurance, partner, planning, or data consumers rely on it. |
| Orchestration | Inventory And Topology coordinates capacity planning, network design, build, fulfillment, activation, field, discovery, serviceability, assurance, partner, and data consumers through APIs, events, governed projections, adapters, or evidence packages. | Consumers receive authoritative operational readiness while planning, design, field, and partner apps retain their own lifecycle records. |
| Exception | If reservation demand exceeds available pool, low-confidence inventory blocks conversion, decommission release conflicts with legal hold, or stranded capacity conflicts with a migration hold, the workflow routes to the accountable owner. | The exception captures failed rule, affected product/service/resource/site, confidence, correction authority, blocked consumer, evidence gap, and escalation path. |
| Completion | Completion occurs when the plan is approved, blocked, converted, released, corrected, replanned, cancelled, migrated, decommissioned, or published with downstream acknowledgement. | Completion evidence includes plan version, source demand, pool snapshot, reservation/assignment conversion, confidence, approval/waiver, event IDs, and consumer revalidation status. |

## Capability Slices

| Feature ID | Feature | Parent feature area | Priority guidance |
| --- | --- | --- | --- |
| F-operational-inventory-planning-01 | Inventory readiness plan | Operational Inventory Planning | P1: required for fulfillment, migration, and build-to-inventory readiness. |
| F-operational-inventory-planning-02 | Reservation forecast and conversion | Operational Inventory Planning | P1: required to prevent double-booking and stale reservations. |
| F-operational-inventory-planning-03 | Assignment preparedness | Operational Inventory Planning | P1: required for order-to-activate execution. |
| F-operational-inventory-planning-04 | Stranded and recovered capacity signal | Operational Inventory Planning | P1: required for decommission and capacity feedback. |
| F-operational-inventory-planning-05 | Migration wave inventory readiness | Operational Inventory Planning | P2: required for enterprise and technology migration. |
| F-operational-inventory-planning-06 | Decommission release planning | Operational Inventory Planning | P2: required for safe reuse, disposal, and capacity recovery. |
| F-operational-inventory-planning-07 | Plan-to-actual acceptance and consumer revalidation | Operational Inventory Planning | P2: required for source authority and downstream trust. |

## Acceptance Criteria

1. **AC-operational-inventory-planning-01:** Given an authorized inventory, provisioning, capacity, network engineering, field, assurance, or migration user creates or updates an operational inventory plan, when the lifecycle advances, then Inventory And Topology validates actual inventory state, pool availability, reservation expiry, assignment conflict, location confidence, connectivity readiness, discovery confidence, legal hold, and migration/decommission constraints.
2. **AC-operational-inventory-planning-02:** Given the plan references capacity planning, future reservation, serviceability, order, field, build, activation, discovery, assurance, partner, or data inputs, when a persona opens the plan, then the app shows source owner, source timestamp, freshness, confidence, correction route, and whether the data is app-owned or read-only.
3. **AC-operational-inventory-planning-03:** Given a future capacity reservation is ready for execution, when conversion is requested, then the app creates or updates operational reservation/assignment state only if pool state, inventory confidence, expiry, location, connectivity, and policy checks pass.
4. **AC-operational-inventory-planning-04:** Given reservation demand exceeds available pool or inventory confidence is below threshold, when validation fails, then the app keeps the plan in blocked, discrepancy, quarantined, or rejected state with severity, owner, due date, affected service/resource/customer, reason code, waiver option, and correlation ID.
5. **AC-operational-inventory-planning-05:** Given downstream consumers subscribe to plan or readiness changes, when the plan changes state, then the app emits a versioned event with changed fields, impacted products/services/resources/sites, confidence, replay metadata, and correlation ID.
6. **AC-operational-inventory-planning-06:** Given a decommission release, migration wave, or stranded capacity action references the plan, when closure is requested, then the app validates active products/services, billing/ticket references, reservations, assignments, legal hold, asset recovery, capacity release, and consumer acknowledgement.
7. **AC-operational-inventory-planning-07:** Given operations leaders review Operational Inventory Planning, when they open dashboards, then they see readiness gaps, reservation conflicts, stranded capacity, recovered capacity, pool exhaustion, low-confidence inventory, decommission holds, conversion success, and consumer lag.

## Negative Scenarios And Edge Cases

| Scenario | Expected behavior |
| --- | --- |
| Future reservation overlaps an active operational reservation | Block conversion and create a conflict case with affected customer/service impact. |
| Capacity appears available but member resources are blocked or quarantined | Prevent readiness approval and route to pool or inventory correction. |
| Strategic capacity plan is stale or superseded | Require source revalidation before operational conversion. |
| Decommission release conflicts with active billing, trouble ticket, or legal hold | Block release unless exception-approved with evidence and consumer acknowledgement. |
| Recovered capacity conflicts with migration rollback window | Keep capacity unavailable for reuse until migration hold clears or owner approves. |
| Low-confidence location or connectivity blocks readiness | Open correction tasks and prevent unsafe assignment or activation closure. |
| Unauthorized user attempts to view sensitive planning context | Mask customer, enterprise, critical topology, financial, and partner details by role. |

## API, Event, And Data Requirements

Related APIs and API areas: [TMF685](../../../../../references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool), [TMF716](../../../../../references/tmforum-open-apis/openapi-specs/TMF716_ResourceReservation), [TMF639](../../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF771](../../../../../references/tmforum-open-apis/openapi-specs/TMF771_ResourceUsage)

- Use TMF685 for operational pool state, TMF716 for operational reservations, TMF639 for resource membership and assignment references, and TMF771 for resource usage facts.
- Strategic capacity plan and future reservation references are read-only inputs until converted into inventory-owned operational state.
- Non-TMF Operational Inventory Planning API may be needed for readiness plans, conversion decisions, stranded capacity, decommission release, and consumer revalidation.
- Command APIs must cover create, validate, approve, block, convert, release, replan, quarantine, correct, cancel, replay, and close.
- Query APIs must cover readiness board, detail, pool snapshot, reservation forecast, assignment preparedness, stranded capacity, decommission release, source evidence, confidence, work queue, metrics, and audit/evidence retrieval with role-aware masking.
- Domain events must include OperationalInventoryPlanCreated, OperationalInventoryPlanApproved, ReadinessGapRaised, OperationalReservationConverted, AssignmentReadinessChanged, StrandedCapacityReleased, DecommissionReleaseBlocked, ConsumerRevalidationRequested, and reconciliation-failed variants.
- Inventory And Topology owns operational inventory plan state; capacity planning, design, build, fulfillment, field, assurance, partner, and data apps retain their own lifecycle records.

## Integrations And Handoffs

- Network Investment And Capacity Planning for strategic capacity plan, exhaustion forecast, and future reservation inputs.
- Network Engineering And Design for planned topology and design acceptance.
- Infrastructure Build Program for build handoff and readiness gates.
- Inventory Location Management and Inventory Connectivity And Path Management for location and path readiness.
- Fulfillment And Activation Control Tower for conversion to execution and activation handover.
- Field Work for site evidence, stock evidence, and as-built readiness.
- Assurance, CPQ, Order, Billing, Partner, and Data consumers for readiness decisions and revalidation.

## Non-Functional Requirements

- Readiness boards and detail views should remain below 2 seconds for normal operator use; bulk forecast conversion, migration wave simulation, and decommission release analysis can run asynchronously.
- The app must serve last-known accepted readiness with freshness and confidence indicators during capacity planning, design, fulfillment, field, discovery, or partner outages.
- Plan history must retain actor, reason, source evidence, before/after value, policy version, approval/waiver, event ID, external reference, confidence, legal hold flag, and retention class.
- API, event, export, adapter, and dashboard paths must enforce tenant isolation, region boundaries, least privilege, sensitive topology masking, customer confidentiality, legal hold, export controls, and data residency.

## Observability And Test Approach

- Metrics: plans created, approved, converted, blocked, released, cancelled, accepted by consumers, readiness gap aging, reservation conflict rate, assignment preparedness, stranded capacity, recovered capacity, decommission hold, pool exhaustion, confidence score, and consumer lag.
- Queues: draft, pending validation, pending source revalidation, readiness gap, reservation conflict, blocked dependency, low confidence, decommission hold, migration hold, stranded capacity review, retrying, corrected, completed, and archived.
- Tests: unit rules for readiness and conversion; API/event contract tests; workflow tests for planning, conversion, stranded capacity, migration, decommissioning, correction, and revalidation; integration tests with capacity planning, design, build, fulfillment, field, discovery, assurance, partner, and data; security tests for masking and tenant boundaries; performance tests for readiness boards and bulk conversion.

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

This refinement converts the feature review material for Operational Inventory Planning into delivery slices that can become epics, stories, API contracts, migrations, and test cases. Treat Inventory And Topology App as the owning application for this feature within Suite OSS Engineering, Inventory, And Fulfillment and schema `inventory_topology`.

| Workstream | Build-ready delivery guidance |
| --- | --- |
| UX and workflow | Build the Operational Inventory Planning workbench for Inventory steward / manager, Provisioning analyst, Assurance analyst, Capacity planner, Network engineer, Migration manager. Include search or intake, guided validation, detail view, lifecycle timeline, decision panel, evidence drawer, exception queue, bulk or replay controls where relevant, saved filters, SLA/OLA aging, empty/error states, and role-aware masking. The UI must expose create, approve, block, convert, release, replan, quarantine, correct, cancel, publish, or request consumer revalidation for an operational inventory plan. and block closure when required evidence, approval, reconciliation, or downstream acknowledgement is missing. |
| API and events | Implement command and query APIs around operational-inventory-planning using TMF685, TMF716, TMF639, TMF771. Command APIs must cover create, validate, approve, block, convert, release, replan, quarantine, correct, cancel, replay, and close. Query APIs must cover readiness board, detail, pool snapshot, reservation forecast, assignment preparedness, stranded capacity, decommission release, source evidence, confidence, work queue, metrics, and audit/evidence... Domain events must include OperationalInventoryPlanCreated, OperationalInventoryPlanApproved, ReadinessGapRaised, OperationalReservationConverted, AssignmentReadinessChanged, StrandedCapacityReleased... Non-TMF Operational Inventory Planning API may be needed for readiness plans, conversion decisions, stranded capacity, decommission release, and consumer revalidation. Every command, query, and event must carry tenant/brand/market where applicable, actor, source channel, reason code, idempotency key, correlation ID, external reference, lifecycle state, and version metadata. |
| Data and controls | Persist operational inventory plan. inside `inventory_topology` with typed lifecycle, owner, status reason, timestamps, policy decision, source freshness, confidence, old/new value, evidence, and reconciliation fields. Inventory And Topology owns operational inventory plan state; capacity planning, design, build, fulfillment, field, assurance, partner, and data apps retain their own lifecycle records. Keep TMF payloads, extension characteristics, imported evidence, and low-stability metadata in JSONB while promoting operationally searched lifecycle fields to typed columns. |
| Integration and handoff | Exchange capacity plans, future-capacity reservations, resource pools, operational reservations, assignments, resource inventory, topology relationships, inventory location bindings, connectivity... with Network Investment And Capacity Planning for strategic capacity plan, exhaustion forecast, and future reservation inputs., Network Engineering And Design for planned topology and design acceptance., Infrastructure Build Program... only through APIs, events, workflow tasks, governed projections, adapters, evidence packages, or certified data products. Show source owner, freshness, confidence, dependency state, retry status, blocked consumer, and completion evidence so the app does not create shadow mastership or direct cross-schema coupling. |
| Security, privacy, and compliance | Enforce RBAC/ABAC, tenant and residency boundaries, least privilege, separation of duties, masking, purpose limitation, retention, legal hold, export control, manual override expiry, immutable audit, and evidence chain of custody for Operational Inventory Planning. Sensitive customer, revenue, partner, security, network, credential, or regulatory evidence must be masked unless the persona has explicit operational purpose. |
| Tests and operations | Create unit, API contract, event replay/idempotency, workflow, integration, migration, data reconciliation, security/privacy, accessibility/localization, performance, dashboard, alert, and runbook tests for Operational Inventory Planning. Cover happy path, assisted path, automated path, exception path, bulk/project path, stale or duplicate input, downstream outage, policy denial, manual override, and reconciliation mismatch. Use the existing review scope - accepted inventory truth, topology and path confidence, reservations and assignments, discovery staging, reconciliation, migration, and decommissioning. - as mandatory backlog and test evidence. |

Implementation notes:

- Treat Inventory And Topology App as the lifecycle owner for operational inventory plan.; referenced data such as capacity plans, future-capacity reservations, resource pools, operational reservations, assignments, resource inventory, topology relationships, inventory location bindings, connectivity paths, discovery state... must remain references, snapshots, projections, evidence packages, or consumer acknowledgements unless the source file explicitly gives this app mastership.
- Make TMF alignment visible in every story: use named TMF resources where they fit, document non-TMF extension APIs with OpenAPI, and keep extension payloads compatible with TMF-style identifiers, lifecycle state, related entities, pagination, errors, and event envelopes.
- Build UI and API behavior around decision evidence, not only CRUD: surface the permitted next actions, policy decision, state reason, owner, SLA/OLA timer, blocked dependency, retry or compensation path, and closure proof.
- Add development tasks for route/page/component work, command/query handlers, DTO validation, entity/repository/migration changes, outbox/event contracts, projection refresh, privacy/security checks, and operational dashboards.
- Definition-of-done evidence must show downstream consumers can use published state through APIs, events, projections, workflow tasks, or certified data products without direct database reads or manual spreadsheet reconciliation.

## Definition Of Done

1. Operational inventory plan lifecycle supports draft, proposed, approved, blocked, converted, released, replanned, cancelled, discrepant, quarantined, migrated, decommissioning, corrected, rejected, and archived states where applicable.
2. Persona workflows include decision rights, validation messages, exception routing, source evidence, confidence, and audit capture.
3. TMF-aligned references, non-TMF extension APIs, events, idempotency, correlation IDs, replay behavior, and consumer revalidation contracts are documented and contract-tested.
4. Data ownership, private app database boundaries, governed projections, retention, legal hold, tenant isolation, sensitive planning masking, and export controls match data mastery guidance.
5. Operational dashboards explain readiness state, source authority, confidence, reservation conflicts, assignment preparedness, stranded capacity, decommission release, migration readiness, consumer lag, and correction backlog.

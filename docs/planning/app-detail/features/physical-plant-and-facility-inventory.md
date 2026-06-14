# Physical Plant And Facility Inventory Feature Specification

Reviewed: 2026-06-07

Suite: OSS Engineering, Inventory, And Fulfillment

App: [Inventory And Topology App](../README.md)

Source module detail: [Modules And Features](../modules-and-features.md)

Source gap review: [E2E Feature Gap Assessment](../../../e2e-feature-gap-assessment.md)

Feature area slug: `physical-plant-and-facility-inventory`

E2E gap severity: High E2E gap closure

## Feature Intent

Track detailed physical plant and facilities including ducts, poles, splice closures, fiber routes, cables, circuits, cabinets, racks, shelves, slots, ports, power/space/cooling, facility space, and relationships to logical inventory. The Physical Plant And Facility Inventory feature produces a governed physical plant and facility inventory record outcome with source authority, confidence, correction workflow, and downstream evidence for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, partner/off-net delivery, and govern-to-comply journeys.

## Telecom Objects And Decision Rights

- Master entity: physical plant and facility inventory record. Inventory And Topology owns OSP/ISP/facility resource lifecycle, containment hierarchy, route/duct/fiber/circuit relationship, rack/shelf/slot/port location, space/power/cooling attribute, field evidence, correction history, and publication events.
- Referenced entities: resource catalog, geographic site/location, resource inventory, topology relationships, field work evidence, build handover, GIS, facilities/real-estate systems, permits/wayleaves, and assurance/change impacts. Inventory And Topology consumes these through APIs, events, governed projections, discovery adapters, evidence packages, or data products and does not overwrite their operational masters.
- Primary decisions: accept, assign, correct, split, merge, move, quarantine, reserve space, release, retire, or publish physical plant/facility inventory state. The decision records accountable persona, source evidence, confidence, policy decision, affected inventory graph, customer/service/resource/site impact, and downstream handoff.
- ODA boundary: Inventory And Topology keeps private inventory, topology, pool, identifier, reservation, assignment, reconciliation, discovery, migration, asset, and stewardship records; BSS, Design Studio, Fulfillment, Field, Assurance, Platform, Partner, and Data apps remain masters for their own lifecycle records.

## Personas, Jobs To Be Done, And Outcomes

| Persona | Job to be done | Outcome |
| --- | --- | --- |
| Inventory steward / manager | Maintain installed product, service, resource, topology, pool, identifier, reservation, reconciliation, migration, and evidence state with accountable data quality ownership. | Inventory truth is searchable, auditable, lifecycle-controlled, and consumable by fulfillment, assurance, field, BSS, partner, and data consumers without direct database access. |
| Provisioning analyst | Reserve, assign, release, quarantine, and correct resources or identifiers during order-to-activate and MACD flows. | Fulfillment receives valid assignments with expiry, conflict, rollback, and evidence controls before activation proceeds. |
| Assurance analyst | Use inventory topology, dependency graph, and service/resource relationships to support trouble-to-resolve and assure-to-optimize journeys. | NOC and assurance teams can identify customer, service, resource, site, and failure-domain impact with confidence and correction routes. |
| Capacity planner | Consume pool, utilization, exhaustion, stranded capacity, and recovered asset signals from operational inventory. | Capacity planning receives trusted operational evidence without becoming the master of active inventory state. |
| Network engineer | Compare planned, as-built, discovered, and reconciled topology for build handoff, drift, migration, and decommissioning decisions. | Network engineering can see inventory acceptance, discrepancy, waiver, and rollback evidence for actual topology. |
| Migration manager | Coordinate migration waves, partial activation, rollback, customer/service impact, recovered assets, and decommission closure. | Legacy service/resource retirement is controlled by inventory impact, order/activation state, field evidence, billing handoff, and customer/NOC/care readiness. |

## Core Workflows

| Stage | Telecom trigger or validation | Orchestration, exception, completion, and evidence |
| --- | --- | --- |
| Trigger | Physical Plant And Facility Inventory starts from network build handover, field survey/as-built update, GIS correction, facility audit, service activation needing port/route assignment, change planning, incident investigation, or decommissioning wave. | The physical plant and facility inventory record opens with owner, tenant, market, geography, technology domain, source trigger, lifecycle action, correlation ID, source evidence, confidence, and impacted consumer list. |
| Validation | The app validates resource spec, site/location identity, geospatial route, containment relationship, rack/shelf/slot/port uniqueness, field/as-built evidence, power/space/cooling capacity, access/HSE constraints, and facility ownership boundary. | Invalid physical plant and facility inventory record data creates inventory discrepancies, assignment conflicts, quarantine tasks, stewardship cases, or correction approvals before fulfillment, activation, CPQ, order, billing, field, assurance, partner, or data consumers rely on the state. |
| Orchestration | Inventory And Topology coordinates design, product/order, fulfillment, activation, field, stock, discovery, NMS/EMS/SDN/NFV/cloud, GIS, assurance, billing, partner, and data consumers through APIs, events, governed projections, adapters, or evidence packages. | Consumers receive authoritative inventory/topology outputs while their own databases and lifecycle records remain private to their owning apps. |
| Exception | If any of these conditions occur - Fiber route geometry conflicts with GIS source, Rack/slot occupied by two resource records, Field as-built evidence lacks site access or HSE proof - the workflow routes to the accountable inventory, provisioning, assurance, capacity, network engineering, migration, field, data stewardship, or security/compliance owner. | The exception captures failed rule, affected product/service/resource/site, risk, confidence, correction authority, blocked consumer, correlation ID, evidence gap, and escalation path. |
| Completion | Completion occurs when the physical plant and facility inventory record is accepted, activated, assigned, corrected, reconciled, quarantined, migrated, decommissioned, retired, or published with downstream consumer acknowledgement. | Completion evidence includes inventory version, source evidence, topology impact, assignment/reservation state, discovery/field/activation evidence, approval/waiver record, event IDs, and consumer reconciliation status. |

## Missing Use Cases And Scenarios

| Scenario | Required behavior |
| --- | --- |
| Greenfield build or install | Physical Plant And Facility Inventory must support greenfield fiber route accepted from build handover with explicit physical plant and facility inventory record, lifecycle state, source evidence, confidence, decision owner, and downstream handoff. |
| Brownfield MACD | Physical Plant And Facility Inventory must support brownfield port move after field repair with explicit physical plant and facility inventory record, lifecycle state, source evidence, confidence, decision owner, and downstream handoff. |
| Enterprise bulk or migration | Physical Plant And Facility Inventory must support enterprise building rack space reserved for bulk install with explicit physical plant and facility inventory record, lifecycle state, source evidence, confidence, decision owner, and downstream handoff. |
| Partner/off-net or external system | Physical Plant And Facility Inventory must support off-net meet-me facility boundary captured with partner evidence with explicit physical plant and facility inventory record, lifecycle state, source evidence, confidence, decision owner, and downstream handoff. |
| Partial activation, rollback, or decommissioning | Physical Plant And Facility Inventory must support decommissioning releases rack space and fiber route with explicit physical plant and facility inventory record, lifecycle state, source evidence, confidence, decision owner, and downstream handoff. |

## Capability Slices

| Feature ID | Feature | Parent feature area | Priority guidance |
| --- | --- | --- | --- |
| F-physical-plant-and-facility-inventory-01 | Duct/pole/splice/fiber route inventory | Physical Plant And Facility Inventory | P1: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |
| F-physical-plant-and-facility-inventory-02 | Rack/shelf/slot/port hierarchy | Physical Plant And Facility Inventory | P1: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |
| F-physical-plant-and-facility-inventory-03 | Circuit and cable relationship | Physical Plant And Facility Inventory | P1: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |
| F-physical-plant-and-facility-inventory-04 | Facility space/power/cooling attribute | Physical Plant And Facility Inventory | P1: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |
| F-physical-plant-and-facility-inventory-05 | GIS and geographic site link | Physical Plant And Facility Inventory | P2: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |
| F-physical-plant-and-facility-inventory-06 | As-built and field evidence acceptance | Physical Plant And Facility Inventory | P2: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |
| F-physical-plant-and-facility-inventory-07 | Physical plant retirement and reuse | Physical Plant And Facility Inventory | P2: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |

## Acceptance Criteria

1. **AC-physical-plant-and-facility-inventory-01:** Given an authorized Inventory steward, Provisioning analyst, Assurance analyst, Capacity planner, Network engineer, or Migration manager creates or updates the physical plant and facility inventory record, when the physical plant inventory lifecycle advances from draft, discovered, planned, reserved, assigned, active, suspended, migrated, quarantined, or retired state, then Inventory And Topology validates resource spec, site/location identity, geospatial route, containment relationship, rack/shelf/slot/port uniqueness, field/as-built evidence, power/space/cooling capacity, access/HSE constraints, and facility ownership boundary before accepting the state change.
2. **AC-physical-plant-and-facility-inventory-02:** Given the physical plant and facility inventory record references product, service, resource, site, field, activation, order, billing, assurance, partner, or external discovery data, when a persona opens the Physical Plant And Facility Inventory record, then the app shows source owner, source timestamp, freshness, confidence, correction route, and whether the data is app-owned or read-only.
3. **AC-physical-plant-and-facility-inventory-03:** Given Fiber route geometry conflicts with GIS source, when validation fails for Physical Plant And Facility Inventory, then the app keeps the record in draft, blocked, discrepancy, quarantined, or rejected state with severity, owner, due date, affected service/resource/customer, reason code, waiver option, and correlation ID.
4. **AC-physical-plant-and-facility-inventory-04:** Given the physical plant and facility inventory record changes due to activation, field evidence, discovery, build handover, migration, or manual stewardship, when the lifecycle transition is committed, then the app stores decision right, actor, role, reason, old/new values, evidence links, tenant/region boundary, and idempotency key.
5. **AC-physical-plant-and-facility-inventory-05:** Given fulfillment, activation, CPQ, order, billing, care, self-care, assurance, field, partner, planning, or data consumers subscribe to Physical Plant And Facility Inventory changes, when the physical plant and facility inventory record changes state, then the app emits a versioned event with changed fields, impacted products/services/resources/sites, confidence, replay metadata, and correlation ID.
6. **AC-physical-plant-and-facility-inventory-06:** Given a greenfield build, brownfield MACD, enterprise bulk order, partner/off-net delivery, partial activation, rollback, migration, or decommissioning scenario references the physical plant and facility inventory record, when the user requests closure, then the app validates downstream handoffs, open discrepancies, reservations, assignments, customer/NOC/care impact, retention, and legal hold before closure.
7. **AC-physical-plant-and-facility-inventory-07:** Given operations leaders or data stewards review Physical Plant And Facility Inventory operations, when they open dashboards, then they see inventory accuracy, discrepancy aging, reconciliation status, reservation/assignment conflicts, confidence score, stale records, event lag, and downstream fallout linked to the physical plant and facility inventory record.

## Negative Scenarios

Negative scenarios for this feature include permission denial, missing source data, stale dependency state, policy failure, duplicate or replayed request, downstream timeout, reconciliation mismatch, and any feature-specific negative scenario additions listed in the suite gap-review closure addendum.

## Edge Cases

| Scenario | Expected behavior |
| --- | --- |
| Fiber route geometry conflicts with GIS source | Physical Plant And Facility Inventory blocks unsafe inventory mutation or routes a governed discrepancy with owner, due date, affected product/service/resource/site, consumer impact, correction authority, and replayable evidence. |
| Rack/slot occupied by two resource records | Physical Plant And Facility Inventory blocks unsafe inventory mutation or routes a governed discrepancy with owner, due date, affected product/service/resource/site, consumer impact, correction authority, and replayable evidence. |
| Field as-built evidence lacks site access or HSE proof | Physical Plant And Facility Inventory blocks unsafe inventory mutation or routes a governed discrepancy with owner, due date, affected product/service/resource/site, consumer impact, correction authority, and replayable evidence. |
| Facility power/cooling constraint blocks activation | Physical Plant And Facility Inventory blocks unsafe inventory mutation or routes a governed discrepancy with owner, due date, affected product/service/resource/site, consumer impact, correction authority, and replayable evidence. |
| Partner/off-net facility boundary lacks demarcation evidence | Physical Plant And Facility Inventory blocks unsafe inventory mutation or routes a governed discrepancy with owner, due date, affected product/service/resource/site, consumer impact, correction authority, and replayable evidence. |
| Duplicate, stale, or out-of-order inventory update | Physical Plant And Facility Inventory uses optimistic locking, source timestamp, event version, discovery priority, and idempotency key so retries cannot duplicate inventory, topology, reservation, assignment, reconciliation, or migration state. |
| Cross-tenant, cross-region, or restricted topology access | Physical Plant And Facility Inventory blocks mutation, masks restricted customer/site/topology/identifier data, and records policy decision metadata for tenant isolation, data residency, legal hold, and export control. |
| Downstream app or external system unavailable | Physical Plant And Facility Inventory either fails fast for synchronous decisions or queues controlled retry, replay, adapter recovery, or consumer revalidation with owner, due date, backoff policy, and correlation ID. |
| Retention, privacy, HSE, or regulatory evidence conflict | Physical Plant And Facility Inventory prevents destructive correction, deletion, reuse, disposal, or decommissioning until retention, HSE, lawful/regulatory inventory evidence, legal hold, and data residency controls allow it. |

## API, Event, And Data Requirements

Related APIs and API areas: [TMF639](../../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF703](../../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory), [TMF674](../../../../../references/tmforum-open-apis/openapi-specs/TMF674_GeographicSite), [TMF675](../../../../../references/tmforum-open-apis/openapi-specs/TMF675_GeographicLocation), [TMF634](../../../../../references/tmforum-open-apis/openapi-specs/TMF634_ResourceCatalog), [TMF697](../../../../../references/tmforum-open-apis/openapi-specs/TMF697_Work_Order)

TMF API fit and extension notes:

- Use TMF639 and TMF703 for resource/entity inventory, TMF674/TMF675 for geographic site/location references, TMF634 for resource specifications, and TMF697 for field evidence. GIS/facility-specific attributes may require extension contracts.
- Non-TMF Physical Plant API for route geometry, duct/fiber strand detail, rack/shelf/slot hierarchy, power/space/cooling attributes, and HSE/site access evidence where TMF inventory APIs are too generic. Each extension contract must be explicitly labelled non-TMF, documented with OpenAPI, and aligned to TMF-style id, href, lifecycle state, relatedParty, relatedEntity, error, pagination, and event-envelope patterns where practical.
- Command APIs for Physical Plant And Facility Inventory must cover create/initiate, ingest, validate, update, reserve, assign, release, quarantine, reconcile, correct, migrate, decommission, retire, replay, and close where the physical plant inventory lifecycle uses those states.
- Query APIs for Physical Plant And Facility Inventory must cover search, detail, timeline, related physical plant and facility inventory record references, topology impact, source evidence, confidence, work queue, metrics, and audit/evidence retrieval with role-aware masking.
- Domain events for Physical Plant And Facility Inventory must include PhysicalPlantAccepted, FacilityInventoryCorrected, PhysicalPlantReserved, PhysicalPlantRetired, plus discrepancy raised, discrepancy resolved, correction requested, correction rejected, replay requested, consumer revalidation requested, and reconciliation failed where the lifecycle uses those states.

Data and ownership requirements:

- Inventory And Topology owns OSP/ISP/facility resource lifecycle, containment hierarchy, route/duct/fiber/circuit relationship, rack/shelf/slot/port location, space/power/cooling attribute, field evidence, correction history, and publication events; other apps consume Physical Plant And Facility Inventory state through APIs, events, governed projections, workflow tasks, evidence packages, adapters, or certified data products.
- Store source channel, actor, tenant/brand/market, geography, technology domain, lifecycle action, status reason, external references, source evidence, confidence, old/new values, policy decision, evidence links, retention class, legal hold flag, and impacted consumer list.
- Keep read projections, analytics extracts, and DWH/lakehouse outputs separate from operational writes so Physical Plant And Facility Inventory does not create shadow mastership of product orders, service orders, activation execution, field work, billing, assurance tickets, customer records, partner records, or platform security records.
- Provide reconciliation outputs that prove fulfillment, activation, CPQ, order, billing, care, self-care, field, assurance, partner, planning, and data consumers have accepted, rejected, or remain explicitly blocked by the physical plant and facility inventory record.

## Integrations And Handoffs

- GIS and geography/site systems for location and route context.
- Infrastructure Build Program and Network Engineering for planned/as-built handoff.
- Field Work for survey, install, repair, and HSE evidence.
- NOC/Assurance and Change for impact and maintenance planning.
- Facilities/ERP systems for non-telecom site constraints where integrated.

## Non-Functional Requirements

- Scale and latency: Physical Plant And Facility Inventory must support national inventory portfolios with millions of products, services, resources, identifiers, topology edges, pool members, reservations, assignments, discovery snapshots, and reconciliation cases; interactive search and detail views should stay below 2 seconds while graph traversal, bulk correction, reconciliation, and migration analysis run asynchronously with progress and partial-failure reports.
- Availability and resilience: authoritative inventory and topology query APIs for Physical Plant And Facility Inventory must remain available during downstream order, fulfillment, activation, field, assurance, billing, partner, discovery, GIS, or data outages by serving last-known accepted state with freshness and confidence indicators.
- Auditability and retention: Physical Plant And Facility Inventory history must retain actor, channel, reason, source evidence, old/new value, policy version, approval/waiver, event ID, external reference, confidence, legal hold flag, and retention class for engineering, service assurance, regulatory, HSE, asset, and customer-impact evidence periods.
- Localization and accessibility: Physical Plant And Facility Inventory UI tasks, validation messages, engineering units, coordinates, identifier formats, time zones, language, keyboard navigation, and screen-reader labels must respect tenant, market, geography, and accessibility policy.
- Data protection: API, event, export, adapter, and dashboard paths for Physical Plant And Facility Inventory must enforce tenant isolation, data residency, purpose limitation, least privilege, sensitive topology masking, critical-infrastructure masking, lawful inventory evidence protection, and secure evidence storage.

## Compliance, Security, And Privacy

- Physical Plant And Facility Inventory must enforce tenant isolation, region boundaries, role-based inventory mutation, privileged assignment and identifier controls, critical infrastructure masking, lawful/regulatory inventory evidence, HSE/site evidence where relevant, export controls, and data residency for the physical plant and facility inventory record.
- Physical Plant And Facility Inventory must preserve activation evidence, field evidence, site access/HSE evidence, asset custody evidence, migration/decommissioning evidence, customer-impact evidence, legal hold, and regulatory inventory evidence where inventory or topology decisions affect telecom obligations.
- Sensitive customer, enterprise, site, topology, identifier, firmware, controller, partner/off-net, and asset custody references in Physical Plant And Facility Inventory must be masked in search, timelines, exports, analytics, and dashboards unless the persona has a permitted operational purpose.

## Observability And Operations

- Metrics: track physical-plant-and-facility-inventory records created, updated, assigned, reserved, reconciled, corrected, quarantined, migrated, decommissioned, retired, replayed, and accepted by consumers, plus inventory accuracy, confidence score, discrepancy rate, queue aging, assignment conflicts, stale record count, consumer lag, and downstream fallout.
- Queues: provide queues for draft, pending validation, pending evidence, blocked dependency, assignment conflict, reconciliation discrepancy, stewardship review, quarantine, migration hold, decommission review, retrying, corrected, completed, and archived Physical Plant And Facility Inventory records.
- Alerts: notify Inventory And Topology owners when discrepancy aging, assignment conflict, discovery drift, unauthorized change, event publication failure, consumer lag, stale topology, identifier collision, or downstream activation/order/assurance fallout breaches threshold.
- Runbooks: document triage, source authority review, validation replay, consumer revalidation, correction rollback, quarantine/release, reservation repair, discovery adapter recovery, migration rollback, evidence export, legal hold response, and downstream event replay procedures for Physical Plant And Facility Inventory.
- Ownership: Inventory And Topology owns first-line health for Physical Plant And Facility Inventory lifecycle, event replay, reconciliation queues, source confidence, and inventory evidence; Design, Fulfillment, Field, Assurance, BSS, Partner, Platform, Data, and external system owners correct their own source records.

## Test Approach

| Test layer | Required coverage |
| --- | --- |
| Unit tests | Field rules, lifecycle transitions, assignment/reservation state, duplicate detection, source confidence, masking, and physical plant and facility inventory record calculations for Physical Plant And Facility Inventory. |
| API contract tests | Commands, queries, errors, idempotency, pagination, filtering, version compatibility, TMF-aligned payloads for TMF639, TMF703, TMF674, TMF675, TMF634, TMF697, and documented non-TMF extension APIs. |
| Event contract tests | Physical Plant And Facility Inventory event names, payload shape, changed fields, correlation ID, idempotency key, ordering metadata, replay behavior, and subscriber compatibility. |
| Workflow tests | Happy path, assisted correction, automated API path, discovery path, activation handover, field handover, reconciliation, reservation/assignment, exception, waiver, timeout, retry, rollback, migration, decommissioning, correction, and closure for physical plant inventory lifecycle. |
| Integration tests | Handoffs with design, CPQ, order, fulfillment, activation, field, stock, discovery, GIS, billing, care/self-care, assurance, partner/off-net, planning, data, and external adapter owners, including unavailability and no direct database access. |
| Security and privacy tests | Tenant isolation, privileged inventory mutation, sensitive topology masking, identifier access, malicious payloads, audit logging, legal hold, retention, HSE evidence, export controls, and data residency for Physical Plant And Facility Inventory. |
| Data tests | Source authority, referential integrity, historical correction, projection refresh, data-quality stewardship, graph confidence, reporting metrics, and lineage for physical plant and facility inventory record. |
| Performance tests | Search, bulk import, discovery ingest, reconciliation, graph traversal, reservation/assignment, event publication, replay, and API throughput under realistic telecom inventory volumes. |

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

This refinement converts the feature review material for Physical Plant And Facility Inventory into delivery slices that can become epics, stories, API contracts, migrations, and test cases. Treat Inventory And Topology App as the owning application for this feature within Suite OSS Engineering, Inventory, And Fulfillment and schema `inventory_topology`.

| Workstream | Build-ready delivery guidance |
| --- | --- |
| UX and workflow | Build the Physical Plant And Facility Inventory workbench for Inventory steward / manager, Provisioning analyst, Assurance analyst, Capacity planner, Network engineer, Migration manager. Include search or intake, guided validation, detail view, lifecycle timeline, decision panel, evidence drawer, exception queue, bulk or replay controls where relevant, saved filters, SLA/OLA aging, empty/error states, and role-aware masking. The UI must expose accept, assign, correct, split, merge, move, quarantine, reserve space, release, retire, or publish physical plant/facility inventory state. The decision records accountable persona, source evidence, confidence, policy... and block closure when required evidence, approval, reconciliation, or downstream acknowledgement is missing. |
| API and events | Implement command and query APIs around physical-plant-and-facility-inventory using TMF639, TMF703, TMF674, TMF675, TMF634, TMF697. Command APIs for Physical Plant And Facility Inventory must cover create/initiate, ingest, validate, update, reserve, assign, release, quarantine, reconcile, correct, migrate, decommission, retire, replay, and close... Query APIs for Physical Plant And Facility Inventory must cover search, detail, timeline, related physical plant and facility inventory record references, topology impact, source evidence, confidence, work queue... Domain events for Physical Plant And Facility Inventory must include PhysicalPlantAccepted, FacilityInventoryCorrected, PhysicalPlantReserved, PhysicalPlantRetired, plus discrepancy raised, discrepancy resolved... Use TMF639 and TMF703 for resource/entity inventory, TMF674/TMF675 for geographic site/location references, TMF634 for resource specifications, and TMF697 for field evidence. GIS/facility-specific attributes may require... Every command, query, and event must carry tenant/brand/market where applicable, actor, source channel, reason code, idempotency key, correlation ID, external reference, lifecycle state, and version metadata. |
| Data and controls | Persist physical plant and facility inventory record. inside `inventory_topology` with typed lifecycle, owner, status reason, timestamps, policy decision, source freshness, confidence, old/new value, evidence, and reconciliation fields. Inventory And Topology owns OSP/ISP/facility resource lifecycle, containment hierarchy, route/duct/fiber/circuit relationship, rack/shelf/slot/port location, space/power/cooling attribute, field evidence, correction history, and... Keep TMF payloads, extension characteristics, imported evidence, and low-stability metadata in JSONB while promoting operationally searched lifecycle fields to typed columns. |
| Integration and handoff | Exchange resource catalog, geographic site/location, resource inventory, topology relationships, field work evidence, build handover, GIS, facilities/real-estate systems, permits/wayleaves, and... with GIS and geography/site systems for location and route context., Infrastructure Build Program and Network Engineering for planned/as-built handoff., Field Work for survey, install, repair, and HSE evidence., NOC/Assurance and... only through APIs, events, workflow tasks, governed projections, adapters, evidence packages, or certified data products. Show source owner, freshness, confidence, dependency state, retry status, blocked consumer, and completion evidence so the app does not create shadow mastership or direct cross-schema coupling. |
| Security, privacy, and compliance | Enforce RBAC/ABAC, tenant and residency boundaries, least privilege, separation of duties, masking, purpose limitation, retention, legal hold, export control, manual override expiry, immutable audit, and evidence chain of custody for Physical Plant And Facility Inventory. Sensitive customer, revenue, partner, security, network, credential, or regulatory evidence must be masked unless the persona has explicit operational purpose. |
| Tests and operations | Create unit, API contract, event replay/idempotency, workflow, integration, migration, data reconciliation, security/privacy, accessibility/localization, performance, dashboard, alert, and runbook tests for Physical Plant And Facility Inventory. Cover happy path, assisted path, automated path, exception path, bulk/project path, stale or duplicate input, downstream outage, policy denial, manual override, and reconciliation mismatch. Use the existing review scope - accepted inventory truth, topology and path confidence, reservations and assignments, discovery staging, reconciliation, migration, and decommissioning. - as mandatory backlog and test evidence. |

Implementation notes:

- Treat Inventory And Topology App as the lifecycle owner for physical plant and facility inventory record.; referenced data such as resource catalog, geographic site/location, resource inventory, topology relationships, field work evidence, build handover, GIS, facilities/real-estate systems, permits/wayleaves, and assurance/change impacts. must remain references, snapshots, projections, evidence packages, or consumer acknowledgements unless the source file explicitly gives this app mastership.
- Make TMF alignment visible in every story: use named TMF resources where they fit, document non-TMF extension APIs with OpenAPI, and keep extension payloads compatible with TMF-style identifiers, lifecycle state, related entities, pagination, errors, and event envelopes.
- Build UI and API behavior around decision evidence, not only CRUD: surface the permitted next actions, policy decision, state reason, owner, SLA/OLA timer, blocked dependency, retry or compensation path, and closure proof.
- Add development tasks for route/page/component work, command/query handlers, DTO validation, entity/repository/migration changes, outbox/event contracts, projection refresh, privacy/security checks, and operational dashboards.
- Definition-of-done evidence must show downstream consumers can use published state through APIs, events, projections, workflow tasks, or certified data products without direct database reads or manual spreadsheet reconciliation.

## Definition Of Done

1. The physical plant and facility inventory record lifecycle supports draft, planned, reserved, assigned, active, suspended, blocked, discrepant, quarantined, migrated, decommissioning, retired, corrected, rejected, and archived states where applicable.
2. Persona workflows for Inventory steward, Provisioning analyst, Assurance analyst, Capacity planner, Network engineer, and Migration manager include decision rights, validation messages, exception routing, source evidence, confidence, and audit capture for Physical Plant And Facility Inventory.
3. TMF-aligned references, non-TMF extension APIs, events, idempotency, correlation IDs, error models, replay behavior, adapter behavior, and consumer revalidation contracts are documented and contract-tested.
4. Data ownership, private app database boundaries, governed projections, retention, legal hold, tenant isolation, critical-topology masking, privileged assignment controls, HSE/site evidence, and export controls match data mastery and ODA guidance.
5. Operational dashboards explain Physical Plant And Facility Inventory state, source authority, confidence, discrepancies, reservations/assignments, topology impact, migration/decommissioning status, consumer lag, and reconciliation backlog without direct database access.
6. Negative scenarios, telecom edge cases, workflow tests, security tests, event replay tests, discovery tests, reconciliation tests, graph tests, and migration/decommissioning tests are automated or explicitly covered in delivery evidence.

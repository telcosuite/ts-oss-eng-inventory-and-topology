| Field | Value |
| --- | --- |
| Feature ID | F-asset-rma-warranty-and-refurbishment-lifecycle-01 |
| App | Inventory And Topology |
| App slug | `inventory-and-topology` |
| Module | Inventory And Topology |
| Source slice | [modules-and-features.md](../modules-and-features.md) |
| Last refined | 2026-06-15 |
| Refiner verdict | Build-ready |

# Asset RMA Warranty And Refurbishment Lifecycle Feature Specification


Reviewed: 2026-06-07

Suite: OSS Engineering, Inventory, And Fulfillment

App: [Inventory And Topology App](../README.md)

Source module detail: [Modules And Features](../modules-and-features.md)

Source gap review: [E2E Feature Gap Assessment](../../../e2e-feature-gap-assessment.md)

Feature area slug: `asset-rma-warranty-and-refurbishment-lifecycle`

E2E gap severity: High E2E gap closure

## Feature Intent

Control spare, installed, returned, repaired, refurbished, scrapped, warranty, and RMA states for devices, CPE, SIM/eSIM, network assets, serialized parts, and recovered equipment while linking stock, shipment, product/service/resource inventory, and field evidence. The Asset RMA Warranty And Refurbishment Lifecycle feature produces a governed asset lifecycle and RMA inventory state record outcome with source authority, confidence, correction workflow, and downstream evidence for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, partner/off-net delivery, and govern-to-comply journeys.

## Telecom Objects And Decision Rights

- Master entity: asset lifecycle and RMA inventory state record. Inventory And Topology owns serialized asset lifecycle, warranty/RMA state, installed/spare/returned/refurbished/scrapped status, refurbishment evidence, custody chain, resource/product link, stock/shipment references, and publication events.
- Referenced entities: resource inventory, product inventory, stock management, shipping order, shipment tracking, field work, customer return, supplier warranty systems, ERP/procurement references, and refurbishment vendor evidence. Inventory And Topology consumes these through APIs, events, governed projections, discovery adapters, evidence packages, or data products and does not overwrite their operational masters.
- Primary decisions: install, remove, return, inspect, repair, refurbish, warranty-claim, replace, scrap, restock, quarantine, correct, or publish asset/RMA state. The decision records accountable persona, source evidence, confidence, policy decision, affected inventory graph, customer/service/resource/site impact, and downstream handoff.
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
| Trigger | Asset RMA Warranty And Refurbishment Lifecycle starts from field swap, customer return, failed device, warranty claim, RMA authorization, reverse shipment, refurbishment completion, asset audit, decommissioning recovery, or lost/stolen report. | The asset lifecycle and RMA inventory state record opens with owner, tenant, market, geography, technology domain, source trigger, lifecycle action, correlation ID, source evidence, confidence, and impacted consumer list. |
| Validation | The app validates serial/IMEI/ICCID/eSIM identifier, installed product/resource link, stock location, shipment reference, warranty entitlement, custody evidence, HSE/safe disposal rule, refurbish test result, and customer/billing impact. | Invalid asset lifecycle and RMA inventory state record data creates inventory discrepancies, assignment conflicts, quarantine tasks, stewardship cases, or correction approvals before fulfillment, activation, CPQ, order, billing, field, assurance, partner, or data consumers rely on the state. |
| Orchestration | Inventory And Topology coordinates design, product/order, fulfillment, activation, field, stock, discovery, NMS/EMS/SDN/NFV/cloud, GIS, assurance, billing, partner, and data consumers through APIs, events, governed projections, adapters, or evidence packages. | Consumers receive authoritative inventory/topology outputs while their own databases and lifecycle records remain private to their owning apps. |
| Exception | If any of these conditions occur - Returned serial does not match installed asset, Warranty claim lacks customer or product entitlement, Refurbished device fails test but stock shows available - the workflow routes to the accountable inventory, provisioning, assurance, capacity, network engineering, migration, field, data stewardship, or security/compliance owner. | The exception captures failed rule, affected product/service/resource/site, risk, confidence, correction authority, blocked consumer, correlation ID, evidence gap, and escalation path. |
| Completion | Completion occurs when the asset lifecycle and RMA inventory state record is accepted, activated, assigned, corrected, reconciled, quarantined, migrated, decommissioned, retired, or published with downstream consumer acknowledgement. | Completion evidence includes inventory version, source evidence, topology impact, assignment/reservation state, discovery/field/activation evidence, approval/waiver record, event IDs, and consumer reconciliation status. |

## Missing Use Cases And Scenarios

| Scenario | Required behavior |
| --- | --- |
| Greenfield build or install | Asset RMA Warranty And Refurbishment Lifecycle must support CPE swap creates RMA and replacement inventory links with explicit asset lifecycle and RMA inventory state record, lifecycle state, source evidence, confidence, decision owner, and downstream handoff. |
| Brownfield MACD | Asset RMA Warranty And Refurbishment Lifecycle must support brownfield SIM/eSIM replacement preserves service continuity with explicit asset lifecycle and RMA inventory state record, lifecycle state, source evidence, confidence, decision owner, and downstream handoff. |
| Enterprise bulk or migration | Asset RMA Warranty And Refurbishment Lifecycle must support enterprise bulk device return is refurbished and restocked with explicit asset lifecycle and RMA inventory state record, lifecycle state, source evidence, confidence, decision owner, and downstream handoff. |
| Partner/off-net or external system | Asset RMA Warranty And Refurbishment Lifecycle must support partner device shipment fails warranty inspection with explicit asset lifecycle and RMA inventory state record, lifecycle state, source evidence, confidence, decision owner, and downstream handoff. |
| Partial activation, rollback, or decommissioning | Asset RMA Warranty And Refurbishment Lifecycle must support decommissioning recovers network card for refurbishment with explicit asset lifecycle and RMA inventory state record, lifecycle state, source evidence, confidence, decision owner, and downstream handoff. |

## Capability Slices

| Feature ID | Feature | Parent feature area | Priority guidance |
| --- | --- | --- | --- |
| F-asset-rma-warranty-and-refurbishment-lifecycle-01 | Serialized asset lifecycle | Asset RMA Warranty And Refurbishment Lifecycle | P1: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |
| F-asset-rma-warranty-and-refurbishment-lifecycle-02 | Warranty and RMA state | Asset RMA Warranty And Refurbishment Lifecycle | P1: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |
| F-asset-rma-warranty-and-refurbishment-lifecycle-03 | Installed-to-stock custody chain | Asset RMA Warranty And Refurbishment Lifecycle | P1: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |
| F-asset-rma-warranty-and-refurbishment-lifecycle-04 | Refurbishment and test evidence | Asset RMA Warranty And Refurbishment Lifecycle | P1: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |
| F-asset-rma-warranty-and-refurbishment-lifecycle-05 | Customer/device replacement link | Asset RMA Warranty And Refurbishment Lifecycle | P2: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |
| F-asset-rma-warranty-and-refurbishment-lifecycle-06 | Scrap and safe disposal evidence | Asset RMA Warranty And Refurbishment Lifecycle | P2: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |
| F-asset-rma-warranty-and-refurbishment-lifecycle-07 | Recovered asset from decommissioning | Asset RMA Warranty And Refurbishment Lifecycle | P2: required for order-to-activate, trouble-to-resolve, assure-to-optimize, lead-to-order feasibility, migration/decommissioning, or governed inventory evidence. |

## Acceptance Criteria

1. **AC-asset-rma-warranty-and-refurbishment-lifecycle-01:** Given an authorized Inventory steward, Provisioning analyst, Assurance analyst, Capacity planner, Network engineer, or Migration manager creates or updates the asset lifecycle and RMA inventory state record, when the asset RMA and refurbishment lifecycle advances from draft, discovered, planned, reserved, assigned, active, suspended, migrated, quarantined, or retired state, then Inventory And Topology validates serial/IMEI/ICCID/eSIM identifier, installed product/resource link, stock location, shipment reference, warranty entitlement, custody evidence, HSE/safe disposal rule, refurbish test result, and customer/billing impact before accepting the state change.
2. **AC-asset-rma-warranty-and-refurbishment-lifecycle-02:** Given the asset lifecycle and RMA inventory state record references product, service, resource, site, field, activation, order, billing, assurance, partner, or external discovery data, when a persona opens the Asset RMA Warranty And Refurbishment Lifecycle record, then the app shows source owner, source timestamp, freshness, confidence, correction route, and whether the data is app-owned or read-only.
3. **AC-asset-rma-warranty-and-refurbishment-lifecycle-03:** Given Returned serial does not match installed asset, when validation fails for Asset RMA Warranty And Refurbishment Lifecycle, then the app keeps the record in draft, blocked, discrepancy, quarantined, or rejected state with severity, owner, due date, affected service/resource/customer, reason code, waiver option, and correlation ID.
4. **AC-asset-rma-warranty-and-refurbishment-lifecycle-04:** Given the asset lifecycle and RMA inventory state record changes due to activation, field evidence, discovery, build handover, migration, or manual stewardship, when the lifecycle transition is committed, then the app stores decision right, actor, role, reason, old/new values, evidence links, tenant/region boundary, and idempotency key.
5. **AC-asset-rma-warranty-and-refurbishment-lifecycle-05:** Given fulfillment, activation, CPQ, order, billing, care, self-care, assurance, field, partner, planning, or data consumers subscribe to Asset RMA Warranty And Refurbishment Lifecycle changes, when the asset lifecycle and RMA inventory state record changes state, then the app emits a versioned event with changed fields, impacted products/services/resources/sites, confidence, replay metadata, and correlation ID.
6. **AC-asset-rma-warranty-and-refurbishment-lifecycle-06:** Given a greenfield build, brownfield MACD, enterprise bulk order, partner/off-net delivery, partial activation, rollback, migration, or decommissioning scenario references the asset lifecycle and RMA inventory state record, when the user requests closure, then the app validates downstream handoffs, open discrepancies, reservations, assignments, customer/NOC/care impact, retention, and legal hold before closure.
7. **AC-asset-rma-warranty-and-refurbishment-lifecycle-07:** Given operations leaders or data stewards review Asset RMA Warranty And Refurbishment Lifecycle operations, when they open dashboards, then they see inventory accuracy, discrepancy aging, reconciliation status, reservation/assignment conflicts, confidence score, stale records, event lag, and downstream fallout linked to the asset lifecycle and RMA inventory state record.

## Negative Scenarios

Negative scenarios for this feature include permission denial, missing source data, stale dependency state, policy failure, duplicate or replayed request, downstream timeout, reconciliation mismatch, and any feature-specific negative scenario additions listed in the suite gap-review closure addendum.

## Edge Cases

| Scenario | Expected behavior |
| --- | --- |
| Returned serial does not match installed asset | Asset RMA Warranty And Refurbishment Lifecycle blocks unsafe inventory mutation or routes a governed discrepancy with owner, due date, affected product/service/resource/site, consumer impact, correction authority, and replayable evidence. |
| Warranty claim lacks customer or product entitlement | Asset RMA Warranty And Refurbishment Lifecycle blocks unsafe inventory mutation or routes a governed discrepancy with owner, due date, affected product/service/resource/site, consumer impact, correction authority, and replayable evidence. |
| Refurbished device fails test but stock shows available | Asset RMA Warranty And Refurbishment Lifecycle blocks unsafe inventory mutation or routes a governed discrepancy with owner, due date, affected product/service/resource/site, consumer impact, correction authority, and replayable evidence. |
| Reverse shipment lost before custody acceptance | Asset RMA Warranty And Refurbishment Lifecycle blocks unsafe inventory mutation or routes a governed discrepancy with owner, due date, affected product/service/resource/site, consumer impact, correction authority, and replayable evidence. |
| Scrapped asset still assigned to active resource inventory | Asset RMA Warranty And Refurbishment Lifecycle blocks unsafe inventory mutation or routes a governed discrepancy with owner, due date, affected product/service/resource/site, consumer impact, correction authority, and replayable evidence. |
| Duplicate, stale, or out-of-order inventory update | Asset RMA Warranty And Refurbishment Lifecycle uses optimistic locking, source timestamp, event version, discovery priority, and idempotency key so retries cannot duplicate inventory, topology, reservation, assignment, reconciliation, or migration state. |
| Cross-tenant, cross-region, or restricted topology access | Asset RMA Warranty And Refurbishment Lifecycle blocks mutation, masks restricted customer/site/topology/identifier data, and records policy decision metadata for tenant isolation, data residency, legal hold, and export control. |
| Downstream app or external system unavailable | Asset RMA Warranty And Refurbishment Lifecycle either fails fast for synchronous decisions or queues controlled retry, replay, adapter recovery, or consumer revalidation with owner, due date, backoff policy, and correlation ID. |
| Retention, privacy, HSE, or regulatory evidence conflict | Asset RMA Warranty And Refurbishment Lifecycle prevents destructive correction, deletion, reuse, disposal, or decommissioning until retention, HSE, lawful/regulatory inventory evidence, legal hold, and data residency controls allow it. |

## Suite Gap Review Closure Addendum

Source review: [03 Oss Engineering Inventory Fulfillment Gap Review](../../../../suite-gap-reviews/03-oss-engineering-inventory-fulfillment-gap-review.md)

This addendum applies the suite gap-review findings tied to this feature file. It supplements the baseline feature specification and should be carried into epic, story, API, event, data, and test refinement.

### Review Backlog Items Addressed

| Severity | Gap-review item | Closure expectation |
| --- | --- | --- |
| High | Decommission closure proof across service, billing, asset, capacity, and retention. | Add concrete happy path, negative path, edge-case, API/event/data control, reporting, and test evidence for this feature area. |

### Acceptance Criteria Additions

1. Given discovery, field evidence, activation, and current inventory disagree, when reconciliation runs, then the app applies source-priority policy, assigns confidence, opens correction tasks, and notifies consumers before publishing accepted state.
2. Given a decommission is ready to close, when active product, service, billing, trouble ticket, reservation, legal hold, asset recovery, or capacity release remains open, then closure is blocked or exception-approved.
3. Given an identifier is released, when quarantine, portability, fraud, legal hold, or retention rules are active, then the identifier cannot be reused.

### Negative Scenario Additions

1. Controller discovery shows a resource active but field evidence says removed; quarantine the record and prevent reuse until steward decision.
2. IP address is assigned by external IPAM and inventory at the same time; block activation and create conflict case.
3. Customer product is disconnected but service inventory remains active; raise order-to-inventory-to-billing reconciliation exception.

### API, Event, Data, And Reporting Updates

- Add or refine command/query APIs so the owning app remains the system of record and consumers do not bypass app APIs.
- Add lifecycle events for the reviewed gap, including created, validated, blocked, approved, completed, failed, corrected, replayed, and reconciliation-failed variants where applicable.
- Capture idempotency keys, correlation IDs, source freshness, lineage, confidence, policy version, owner, SLA/OLA timers, and audit evidence.
- Add dashboards or operational reports for aging, failure reason, confidence/quality, consumer impact, exception backlog, and closure proof.
- Extend the test approach with happy-path, negative, edge-case, contract, event replay, data reconciliation, security, accessibility, and operational-readiness tests for the listed review items.

## API, Event, And Data Requirements

Related APIs and API areas: [TMF639](../../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF687](../../../../../references/tmforum-open-apis/openapi-specs/TMF687_StockManagement), [TMF700](../../../../../references/tmforum-open-apis/openapi-specs/TMF700_ShippingOrder), [TMF684](../../../../../references/tmforum-open-apis/openapi-specs/TMF684_ShipmentTracking), [TMF637](../../../../../references/tmforum-open-apis/openapi-specs/TMF637_ProductInventory), [TMF697](../../../../../references/tmforum-open-apis/openapi-specs/TMF697_Work_Order)

TMF API fit and extension notes:

- Use TMF639 for resource inventory asset links, TMF687 for stock state, TMF700/TMF684 for shipping and tracking, TMF637 for installed product reference, and TMF697 for field work evidence. Warranty claim and refurbishment vendor state need extension contracts.
- Non-TMF Asset RMA API for warranty entitlement, refurbishment grading, custody chain, safe disposal evidence, replacement linkage, and supplier claim state. Each extension contract must be explicitly labelled non-TMF, documented with OpenAPI, and aligned to TMF-style id, href, lifecycle state, relatedParty, relatedEntity, error, pagination, and event-envelope patterns where practical.
- Command APIs for Asset RMA Warranty And Refurbishment Lifecycle must cover create/initiate, ingest, validate, update, reserve, assign, release, quarantine, reconcile, correct, migrate, decommission, retire, replay, and close where the asset RMA and refurbishment lifecycle uses those states.
- Query APIs for Asset RMA Warranty And Refurbishment Lifecycle must cover search, detail, timeline, related asset lifecycle and RMA inventory state record references, topology impact, source evidence, confidence, work queue, metrics, and audit/evidence retrieval with role-aware masking.
- Domain events for Asset RMA Warranty And Refurbishment Lifecycle must include AssetReturned, AssetRMAOpened, AssetRefurbished, AssetScrapped, plus discrepancy raised, discrepancy resolved, correction requested, correction rejected, replay requested, consumer revalidation requested, and reconciliation failed where the lifecycle uses those states.

Data and ownership requirements:

- Inventory And Topology owns serialized asset lifecycle, warranty/RMA state, installed/spare/returned/refurbished/scrapped status, refurbishment evidence, custody chain, resource/product link, stock/shipment references, and publication events; other apps consume Asset RMA Warranty And Refurbishment Lifecycle state through APIs, events, governed projections, workflow tasks, evidence packages, adapters, or certified data products.
- Store source channel, actor, tenant/brand/market, geography, technology domain, lifecycle action, status reason, external references, source evidence, confidence, old/new values, policy decision, evidence links, retention class, legal hold flag, and impacted consumer list.
- Keep read projections, analytics extracts, and DWH/lakehouse outputs separate from operational writes so Asset RMA Warranty And Refurbishment Lifecycle does not create shadow mastership of product orders, service orders, activation execution, field work, billing, assurance tickets, customer records, partner records, or platform security records.
- Provide reconciliation outputs that prove fulfillment, activation, CPQ, order, billing, care, self-care, field, assurance, partner, planning, and data consumers have accepted, rejected, or remain explicitly blocked by the asset lifecycle and RMA inventory state record.

## Integrations And Handoffs

- Field Work and Stock/warehouse for install, removal, and custody evidence.
- Shipping carriers and reverse logistics for RMA movements.
- Customer Self-Care and Billing for return/refund visibility where applicable.
- Supplier/warranty and refurbishment vendor systems for repair evidence.
- Inventory/Product/Resource records for installed asset link.

## Non-Functional Requirements

- Scale and latency: Asset RMA Warranty And Refurbishment Lifecycle must support national inventory portfolios with millions of products, services, resources, identifiers, topology edges, pool members, reservations, assignments, discovery snapshots, and reconciliation cases; interactive search and detail views should stay below 2 seconds while graph traversal, bulk correction, reconciliation, and migration analysis run asynchronously with progress and partial-failure reports.
- Availability and resilience: authoritative inventory and topology query APIs for Asset RMA Warranty And Refurbishment Lifecycle must remain available during downstream order, fulfillment, activation, field, assurance, billing, partner, discovery, GIS, or data outages by serving last-known accepted state with freshness and confidence indicators.
- Auditability and retention: Asset RMA Warranty And Refurbishment Lifecycle history must retain actor, channel, reason, source evidence, old/new value, policy version, approval/waiver, event ID, external reference, confidence, legal hold flag, and retention class for engineering, service assurance, regulatory, HSE, asset, and customer-impact evidence periods.
- Localization and accessibility: Asset RMA Warranty And Refurbishment Lifecycle UI tasks, validation messages, engineering units, coordinates, identifier formats, time zones, language, keyboard navigation, and screen-reader labels must respect tenant, market, geography, and accessibility policy.
- Data protection: API, event, export, adapter, and dashboard paths for Asset RMA Warranty And Refurbishment Lifecycle must enforce tenant isolation, data residency, purpose limitation, least privilege, sensitive topology masking, critical-infrastructure masking, lawful inventory evidence protection, and secure evidence storage.

## Compliance, Security, And Privacy

- Asset RMA Warranty And Refurbishment Lifecycle must enforce tenant isolation, region boundaries, role-based inventory mutation, privileged assignment and identifier controls, critical infrastructure masking, lawful/regulatory inventory evidence, HSE/site evidence where relevant, export controls, and data residency for the asset lifecycle and RMA inventory state record.
- Asset RMA Warranty And Refurbishment Lifecycle must preserve activation evidence, field evidence, site access/HSE evidence, asset custody evidence, migration/decommissioning evidence, customer-impact evidence, legal hold, and regulatory inventory evidence where inventory or topology decisions affect telecom obligations.
- Sensitive customer, enterprise, site, topology, identifier, firmware, controller, partner/off-net, and asset custody references in Asset RMA Warranty And Refurbishment Lifecycle must be masked in search, timelines, exports, analytics, and dashboards unless the persona has a permitted operational purpose.

## Observability And Operations

- Metrics: track asset-rma-warranty-and-refurbishment-lifecycle records created, updated, assigned, reserved, reconciled, corrected, quarantined, migrated, decommissioned, retired, replayed, and accepted by consumers, plus inventory accuracy, confidence score, discrepancy rate, queue aging, assignment conflicts, stale record count, consumer lag, and downstream fallout.
- Queues: provide queues for draft, pending validation, pending evidence, blocked dependency, assignment conflict, reconciliation discrepancy, stewardship review, quarantine, migration hold, decommission review, retrying, corrected, completed, and archived Asset RMA Warranty And Refurbishment Lifecycle records.
- Alerts: notify Inventory And Topology owners when discrepancy aging, assignment conflict, discovery drift, unauthorized change, event publication failure, consumer lag, stale topology, identifier collision, or downstream activation/order/assurance fallout breaches threshold.
- Runbooks: document triage, source authority review, validation replay, consumer revalidation, correction rollback, quarantine/release, reservation repair, discovery adapter recovery, migration rollback, evidence export, legal hold response, and downstream event replay procedures for Asset RMA Warranty And Refurbishment Lifecycle.
- Ownership: Inventory And Topology owns first-line health for Asset RMA Warranty And Refurbishment Lifecycle lifecycle, event replay, reconciliation queues, source confidence, and inventory evidence; Design, Fulfillment, Field, Assurance, BSS, Partner, Platform, Data, and external system owners correct their own source records.

## Test Approach

| Test layer | Required coverage |
| --- | --- |
| Unit tests | Field rules, lifecycle transitions, assignment/reservation state, duplicate detection, source confidence, masking, and asset lifecycle and RMA inventory state record calculations for Asset RMA Warranty And Refurbishment Lifecycle. |
| API contract tests | Commands, queries, errors, idempotency, pagination, filtering, version compatibility, TMF-aligned payloads for TMF639, TMF687, TMF700, TMF684, TMF637, TMF697, and documented non-TMF extension APIs. |
| Event contract tests | Asset RMA Warranty And Refurbishment Lifecycle event names, payload shape, changed fields, correlation ID, idempotency key, ordering metadata, replay behavior, and subscriber compatibility. |
| Workflow tests | Happy path, assisted correction, automated API path, discovery path, activation handover, field handover, reconciliation, reservation/assignment, exception, waiver, timeout, retry, rollback, migration, decommissioning, correction, and closure for asset RMA and refurbishment lifecycle. |
| Integration tests | Handoffs with design, CPQ, order, fulfillment, activation, field, stock, discovery, GIS, billing, care/self-care, assurance, partner/off-net, planning, data, and external adapter owners, including unavailability and no direct database access. |
| Security and privacy tests | Tenant isolation, privileged inventory mutation, sensitive topology masking, identifier access, malicious payloads, audit logging, legal hold, retention, HSE evidence, export controls, and data residency for Asset RMA Warranty And Refurbishment Lifecycle. |
| Data tests | Source authority, referential integrity, historical correction, projection refresh, data-quality stewardship, graph confidence, reporting metrics, and lineage for asset lifecycle and RMA inventory state record. |
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

This refinement converts the feature review material for Asset RMA Warranty And Refurbishment Lifecycle into delivery slices that can become epics, stories, API contracts, migrations, and test cases. Treat Inventory And Topology App as the owning application for this feature within Suite OSS Engineering, Inventory, And Fulfillment and schema `inventory_topology`.

| Workstream | Build-ready delivery guidance |
| --- | --- |
| UX and workflow | Build the Asset RMA Warranty And Refurbishment Lifecycle workbench for Inventory steward / manager, Provisioning analyst, Assurance analyst, Capacity planner, Network engineer, Migration manager. Include search or intake, guided validation, detail view, lifecycle timeline, decision panel, evidence drawer, exception queue, bulk or replay controls where relevant, saved filters, SLA/OLA aging, empty/error states, and role-aware masking. The UI must expose install, remove, return, inspect, repair, refurbish, warranty-claim, replace, scrap, restock, quarantine, correct, or publish asset/RMA state. The decision records accountable persona, source evidence, confidence... and block closure when required evidence, approval, reconciliation, or downstream acknowledgement is missing. |
| API and events | Implement command and query APIs around asset-rma-warranty-and-refurbishment-lifecycle using TMF639, TMF687, TMF700, TMF684, TMF637, TMF697. Command APIs for Asset RMA Warranty And Refurbishment Lifecycle must cover create/initiate, ingest, validate, update, reserve, assign, release, quarantine, reconcile, correct, migrate, decommission, retire, replay, and... Query APIs for Asset RMA Warranty And Refurbishment Lifecycle must cover search, detail, timeline, related asset lifecycle and RMA inventory state record references, topology impact, source evidence, confidence, work... Domain events for Asset RMA Warranty And Refurbishment Lifecycle must include AssetReturned, AssetRMAOpened, AssetRefurbished, AssetScrapped, plus discrepancy raised, discrepancy resolved, correction requested... Use TMF639 for resource inventory asset links, TMF687 for stock state, TMF700/TMF684 for shipping and tracking, TMF637 for installed product reference, and TMF697 for field work evidence. Warranty claim and... Every command, query, and event must carry tenant/brand/market where applicable, actor, source channel, reason code, idempotency key, correlation ID, external reference, lifecycle state, and version metadata. |
| Data and controls | Persist asset lifecycle and RMA inventory state record. inside `inventory_topology` with typed lifecycle, owner, status reason, timestamps, policy decision, source freshness, confidence, old/new value, evidence, and reconciliation fields. Inventory And Topology owns serialized asset lifecycle, warranty/RMA state, installed/spare/returned/refurbished/scrapped status, refurbishment evidence, custody chain, resource/product link, stock/shipment references, and publication... Keep TMF payloads, extension characteristics, imported evidence, and low-stability metadata in JSONB while promoting operationally searched lifecycle fields to typed columns. |
| Integration and handoff | Exchange resource inventory, product inventory, stock management, shipping order, shipment tracking, field work, customer return, supplier warranty systems, ERP/procurement references, and... with Field Work and Stock/warehouse for install, removal, and custody evidence., Shipping carriers and reverse logistics for RMA movements., Customer Self-Care and Billing for return/refund visibility where applicable... only through APIs, events, workflow tasks, governed projections, adapters, evidence packages, or certified data products. Show source owner, freshness, confidence, dependency state, retry status, blocked consumer, and completion evidence so the app does not create shadow mastership or direct cross-schema coupling. |
| Security, privacy, and compliance | Enforce RBAC/ABAC, tenant and residency boundaries, least privilege, separation of duties, masking, purpose limitation, retention, legal hold, export control, manual override expiry, immutable audit, and evidence chain of custody for Asset RMA Warranty And Refurbishment Lifecycle. Sensitive customer, revenue, partner, security, network, credential, or regulatory evidence must be masked unless the persona has explicit operational purpose. |
| Tests and operations | Create unit, API contract, event replay/idempotency, workflow, integration, migration, data reconciliation, security/privacy, accessibility/localization, performance, dashboard, alert, and runbook tests for Asset RMA Warranty And Refurbishment Lifecycle. Cover happy path, assisted path, automated path, exception path, bulk/project path, stale or duplicate input, downstream outage, policy denial, manual override, and reconciliation mismatch. Use the existing review scope - accepted inventory truth, topology and path confidence, reservations and assignments, discovery staging, reconciliation, migration, and decommissioning. - as mandatory backlog and test evidence. |

Implementation notes:

- Treat Inventory And Topology App as the lifecycle owner for asset lifecycle and RMA inventory state record.; referenced data such as resource inventory, product inventory, stock management, shipping order, shipment tracking, field work, customer return, supplier warranty systems, ERP/procurement references, and refurbishment vendor evidence. must remain references, snapshots, projections, evidence packages, or consumer acknowledgements unless the source file explicitly gives this app mastership.
- Make TMF alignment visible in every story: use named TMF resources where they fit, document non-TMF extension APIs with OpenAPI, and keep extension payloads compatible with TMF-style identifiers, lifecycle state, related entities, pagination, errors, and event envelopes.
- Build UI and API behavior around decision evidence, not only CRUD: surface the permitted next actions, policy decision, state reason, owner, SLA/OLA timer, blocked dependency, retry or compensation path, and closure proof.
- Add development tasks for route/page/component work, command/query handlers, DTO validation, entity/repository/migration changes, outbox/event contracts, projection refresh, privacy/security checks, and operational dashboards.
- Definition-of-done evidence must show downstream consumers can use published state through APIs, events, projections, workflow tasks, or certified data products without direct database reads or manual spreadsheet reconciliation.

## Definition Of Done

1. The asset lifecycle and RMA inventory state record lifecycle supports draft, planned, reserved, assigned, active, suspended, blocked, discrepant, quarantined, migrated, decommissioning, retired, corrected, rejected, and archived states where applicable.
2. Persona workflows for Inventory steward, Provisioning analyst, Assurance analyst, Capacity planner, Network engineer, and Migration manager include decision rights, validation messages, exception routing, source evidence, confidence, and audit capture for Asset RMA Warranty And Refurbishment Lifecycle.
3. TMF-aligned references, non-TMF extension APIs, events, idempotency, correlation IDs, error models, replay behavior, adapter behavior, and consumer revalidation contracts are documented and contract-tested.
4. Data ownership, private app database boundaries, governed projections, retention, legal hold, tenant isolation, critical-topology masking, privileged assignment controls, HSE/site evidence, and export controls match data mastery and ODA guidance.
5. Operational dashboards explain Asset RMA Warranty And Refurbishment Lifecycle state, source authority, confidence, discrepancies, reservations/assignments, topology impact, migration/decommissioning status, consumer lag, and reconciliation backlog without direct database access.
6. Negative scenarios, telecom edge cases, workflow tests, security tests, event replay tests, discovery tests, reconciliation tests, graph tests, and migration/decommissioning tests are automated or explicitly covered in delivery evidence.


## Build-Ready Refinement (2026-06-15)

Header added at the top of this file. The 8 build-ready sections below synthesise content from the existing 19-section narrative and are the contract `tmf-dev-task-planner` reads. Source citations are inline.

## Persona & decision

- Inventory steward / manager can maintain installed product, service, resource, topology, pool, identifier, reservation, reconciliation, migration, for the persona-specific outcome `Inventory truth is searchable, auditable, lifecycle-controlled, and consumable b…`, evidenced by the `## Persona & decision` audit trail in this file.
- Provisioning analyst can reserve, assign, release, quarantine, for the persona-specific outcome `Fulfillment receives valid assignments with expiry, conflict, rollback, and evid…`, evidenced by the `## Persona & decision` audit trail in this file.
- Assurance analyst can use inventory topology, dependency graph, for the persona-specific outcome `NOC and assurance teams can identify customer, service, resource, site, and fail…`, evidenced by the `## Persona & decision` audit trail in this file.
- Capacity planner can consume pool, utilization, exhaustion, stranded capacity, for the persona-specific outcome `Capacity planning receives trusted operational evidence without becoming the mas…`, evidenced by the `## Persona & decision` audit trail in this file.
- Network engineer can compare planned, as-built, discovered, for the persona-specific outcome `Network engineering can see inventory acceptance, discrepancy, waiver, and rollb…`, evidenced by the `## Persona & decision` audit trail in this file.
- Migration manager can coordinate migration waves, partial activation, rollback, customer/service impact, recovered assets, for the persona-specific outcome `Legacy service/resource retirement is controlled by inventory impact, order/acti…`, evidenced by the `## Persona & decision` audit trail in this file.

## Lifecycle ownership

- This app owns the lifecycle state of the planning record listed in the source `## Telecom Objects And Decision Rights`. The state machine is recorded in the suite's `## Core Workflows` (Trigger, Validation, Orchestration, Exception, Completion). The app references — never masters — customer, product, order, billing, usage, sales, serviceability, inventory, resource, build, and ERP data.
- Source: [features/<this>.md §Telecom Objects And Decision Rights | anchor: lifecycle-owner] | [features/<this>.md §Core Workflows | anchor: lifecycle-states]

## TMF fit

- TMF API baseline for this app: (none captured in tmf-api-ddl-reviews).
- Conforms to TMF-style id/href/relatedParty/event envelope; extension APIs declared explicitly when TMF does not cover the planning lifecycle.

## Data fit

- Owns schema `inventory_and_topology`; the V001 migration lists the owned tables: (none captured).
- Source: [database/postgres/suites/ts_oss_engineering_fulfillment/V001__create_app_schemas_and_starter_tables.sql §schema | anchor: schema-list]

## Path coverage

- Happy path: Not applicable — no evidence of this path in `## Edge Cases` or `## Missing Use Cases And Scenarios`.
- Assisted path: Not applicable — feature is persona-driven happy path; assisted path is owned by exception / approval features.
- Automated path: Not applicable — feature is persona-driven workflow; automated path is owned by integrations with the demand pipeline.
- Exception path: Not applicable — no evidence of this path in `## Edge Cases` or `## Missing Use Cases And Scenarios`.
- Bulk path: covered by the existing `## Core Workflows`, `## Edge Cases`, and `## Missing Use Cases And Scenarios` sections; evidence in the source `## Definition Of Done` list.
- Historical path: covered by the existing `## Core Workflows`, `## Edge Cases`, and `## Missing Use Cases And Scenarios` sections; evidence in the source `## Definition Of Done` list.
- Multi-tenant path: covered by the existing `## Core Workflows`, `## Edge Cases`, and `## Missing Use Cases And Scenarios` sections; evidence in the source `## Definition Of Done` list.
- Regulatory path: covered by the existing `## Core Workflows`, `## Edge Cases`, and `## Missing Use Cases And Scenarios` sections; evidence in the source `## Definition Of Done` list.
- Source: [features/<this>.md §Edge Cases | anchor: paths] | [features/<this>.md §Missing Use Cases And Scenarios | anchor: paths]

## UI implications

- Pages / workbenches (per the app's `Required app screens / workbenches` block in `dev-tasks/development-task-tracker.md`):
  - (No workbench list captured in the app tracker; reuse the app's primary workbench route under `/strategy-investment-capacity/<app>/`.)
- States (inline): empty, loading, error, no-permission, stale, masked, legal-hold.
- Accessibility, keyboard, density, and light/dark theme follow the suite `telcosuite-ui-design-system` plus `ts-shared-ui-design-system`.
- Source: [development-task-tracker.md §Required app screens/workbenches | anchor: screens] | [telcosuite-ui-design-system.md | anchor: ux-baseline]

## Acceptance & tests

- AC1 (AC-asset-rma-warranty-and-refurbishment-lifecycle-01): Given an authorized Inventory steward, Provisioning analyst, Assurance analyst, Capacity planner, Network engineer, or Migration manager creates or updates the asset lifecycle and RMA inventory state record, when the asset RMA and refurbishment lifecycle advances from draft, discovered, planned, reserved, assigned, active, suspended, migrated, quarantined, or retired state, then Inventory And Topology validates serial/IMEI/ICCID/eSIM identifier, installed product/resource link, stock location, shipment reference, warranty entitlement, custody evidence, HSE/safe disposal rule, refurbish test result, and customer/billing impact before accepting the state change.
- AC2 (AC-asset-rma-warranty-and-refurbishment-lifecycle-02): Given the asset lifecycle and RMA inventory state record references product, service, resource, site, field, activation, order, billing, assurance, partner, or external discovery data, when a persona opens the Asset RMA Warranty And Refurbishment Lifecycle record, then the app shows source owner, source timestamp, freshness, confidence, correction route, and whether the data is app-owned or read-only.
- AC3 (AC-asset-rma-warranty-and-refurbishment-lifecycle-03): Given Returned serial does not match installed asset, when validation fails for Asset RMA Warranty And Refurbishment Lifecycle, then the app keeps the record in draft, blocked, discrepancy, quarantined, or rejected state with severity, owner, due date, affected service/resource/customer, reason code, waiver option, and correlation ID.
- AC4 (AC-asset-rma-warranty-and-refurbishment-lifecycle-04): Given the asset lifecycle and RMA inventory state record changes due to activation, field evidence, discovery, build handover, migration, or manual stewardship, when the lifecycle transition is committed, then the app stores decision right, actor, role, reason, old/new values, evidence links, tenant/region boundary, and idempotency key.
- AC5 (AC-asset-rma-warranty-and-refurbishment-lifecycle-05): Given fulfillment, activation, CPQ, order, billing, care, self-care, assurance, field, partner, planning, or data consumers subscribe to Asset RMA Warranty And Refurbishment Lifecycle changes, when the asset lifecycle and RMA inventory state record changes state, then the app emits a versioned event with changed fields, impacted products/services/resources/sites, confidence, replay metadata, and correlation ID.
- AC6 (AC-asset-rma-warranty-and-refurbishment-lifecycle-06): Given a greenfield build, brownfield MACD, enterprise bulk order, partner/off-net delivery, partial activation, rollback, migration, or decommissioning scenario references the asset lifecycle and RMA inventory state record, when the user requests closure, then the app validates downstream handoffs, open discrepancies, reservations, assignments, customer/NOC/care impact, retention, and legal hold before closure.
- AC7 (AC-asset-rma-warranty-and-refurbishment-lifecycle-07): Given operations leaders or data stewards review Asset RMA Warranty And Refurbishment Lifecycle operations, when they open dashboards, then they see inventory accuracy, discrepancy aging, reconciliation status, reservation/assignment conflicts, confidence score, stale records, event lag, and downstream fallout linked to the asset lifecycle and RMA inventory state record.
- Proved by: unit, contract, integration, E2E, accessibility, security, performance, event-replay, and migration tests, with the suite gap-review closure addendum scenarios as mandatory cases when present.
- Source: [features/<this>.md §Acceptance Criteria | anchor: ac-list]

## Dependencies & release gate

- Depends on: dev-tasks tracker `Required app screens/workbenches` block; the suite's P01 foundation tasks; cross-app TMF and event contracts listed under `## API, Event, And Data Requirements`.
- Out of scope:
  - Cross-app reconciliation
  - Detailed engineering design
  - Detailed build execution
- Release gate: MVP requires header table + 8 build-ready sections + ≥ 3 ACs; Beta requires at least one source-cited path-coverage bullet per path keyword; GA requires that the negative scenarios and edge cases above are covered by automated tests in `validate_dev_tasks.py`.
- Source: [development-task-tracker.md | anchor: release-gate]

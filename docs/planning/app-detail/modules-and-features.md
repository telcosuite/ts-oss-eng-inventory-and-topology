# Inventory And Topology App Modules And Features

Reviewed: 2026-06-06

This document expands each app module into feature-level planning guidance. It should be used to create epics, stories, API contracts, event contracts, screens, permissions, and test cases.

Source overview: [inventory-and-topology.md](../inventory-and-topology.md)

## App-Level Feature Principles

- Every feature must have an owning module and an owning app API.
- UI actions must call app APIs rather than writing directly to shared data stores.
- Cross-app reads should use APIs, subscribed events, governed projections, or data products.
- Each module should expose enough lifecycle state for operations, audit, automation, and customer/partner visibility.
- Feature design must include happy path, exception path, audit path, and reporting path.

## App Data Ownership Context

Owns product, service, resource, topology, inventory-location binding, actual connectivity path, operational inventory plan, pool, identifier, reservation, assignment, reconciliation, discovery-sync, migration, and decommissioning records. Catalog models are owned by design/catalog apps. Canonical address, site, location, serviceability, strategic capacity planning, and planned topology remain owned by the Strategy, Investment, And Capacity suite.

## First Release Context

Deliver product/service/resource inventory, topology basics, inventory location management, connectivity path basics, resource pools, operational inventory planning, reservation/assignment, and reconciliation. Add deep discovery sync, migration automation, decommissioning analytics, and advanced path optimization after core fulfillment depends on inventory reliably.

## Module 1: Product Inventory

Anchor: `product-inventory`

### Capability Intent

Maintain installed products, status, relationships, characteristics, lifecycle, customer/account links, order links, billing links, trouble ticket links, and self-care/care views.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Maintain installed products.
- Relationships.
- Characteristics.
- Customer/account links.
- Billing links.
- Trouble ticket links.
- And self-care/care views.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for product inventory records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate product inventory changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for product inventory work. |
| API and event behavior | Expose command, query, and event contracts for product inventory so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Product Inventory | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate product inventory state available through APIs |
| Handle Product Inventory exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Product Inventory performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF637](../../../../references/tmforum-open-apis/openapi-specs/TMF637_ProductInventory)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 2: Service Inventory

Anchor: `service-inventory`

### Capability Intent

Maintain active and planned service instances, service characteristics, service relationships, service status, customer-facing to resource-facing links, and activation reconciliation.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Maintain active and planned service instances.
- Service characteristics.
- Service relationships.
- Service status.
- Customer-facing to resource-facing links.
- And activation reconciliation.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for service inventory records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate service inventory changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for service inventory work. |
| API and event behavior | Expose command, query, and event contracts for service inventory so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Service Inventory | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate service inventory state available through APIs |
| Handle Service Inventory exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Service Inventory performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF638](../../../../references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 3: Resource Inventory

Anchor: `resource-inventory`

### Capability Intent

Maintain physical, logical, cloud, software, CPE, SIM/eSIM, numbers, IP pools, ports, cards, links, licenses, ownership, location, assignment, relationships, and lifecycle states.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Maintain physical.
- Relationships.
- And lifecycle states.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for resource inventory records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate resource inventory changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for resource inventory work. |
| API and event behavior | Expose command, query, and event contracts for resource inventory so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Resource Inventory | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate resource inventory state available through APIs |
| Handle Resource Inventory exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Resource Inventory performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF703](../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 4: Topology And Relationship

Anchor: `topology-and-relationship`

### Capability Intent

Model relationships between products, services, resources, sites, links, network functions, and dependencies. Support impact analysis, change planning, assurance, and planned-versus-actual comparison.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Model relationships between products.
- Network functions.
- And dependencies.
- Support impact analysis.
- Change planning.
- And planned-versus-actual comparison.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for topology and relationship records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate topology and relationship changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for topology and relationship work. |
| API and event behavior | Expose command, query, and event contracts for topology and relationship so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Topology And Relationship | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate topology and relationship state available through APIs |
| Handle Topology And Relationship exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Topology And Relationship performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF638](../../../../references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory), [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF703](../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 5: Resource Pool And Capacity

Anchor: `resource-pool-and-capacity`

### Capability Intent

Manage pools for IP addresses, numbers, ports, bandwidth, compute, storage, CPE, SIM/eSIM, spectrum, and licenses. Track available, consumed, reserved, quarantined, blocked, thresholds, and exhaustion.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Manage pools for IP addresses.
- And licenses.
- Track available.
- And exhaustion.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for resource pool and capacity records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate resource pool and capacity changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for resource pool and capacity work. |
| API and event behavior | Expose command, query, and event contracts for resource pool and capacity so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Resource Pool And Capacity | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate resource pool and capacity state available through APIs |
| Handle Resource Pool And Capacity exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Resource Pool And Capacity performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF685](../../../../references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool), [TMF771](../../../../references/tmforum-open-apis/openapi-specs/TMF771_ResourceUsage)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 6: Numbering, IP, SIM/eSIM, And Identifier Resource

Anchor: `numbering-ip-sim-esim-and-identifier-resource`

### Capability Intent

Manage MSISDN, IMSI, ICCID, eSIM profile, IP address, prefix, VLAN, circuit ID, port ID, device ID, and service ID blocks, ranges, reuse rules, quarantine, assignment history, and audit. Support number port-in/port-out, donor/recipient state, regulatory audit, quarantine aging, eSIM profile reservation, download/activation handoff, swap, replacement, and release.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Manage MSISDN.
- ESIM profile.
- And service ID blocks.
- Assignment history.
- Support number port-in/port-out.
- Donor/recipient state.
- Regulatory audit.
- Quarantine aging.
- ESIM profile reservation.
- Download/activation handoff.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for numbering, ip, sim/esim, and identifier resource records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate numbering, ip, sim/esim, and identifier resource changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for numbering, ip, sim/esim, and identifier resource work. |
| API and event behavior | Expose command, query, and event contracts for numbering, ip, sim/esim, and identifier resource so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Numbering, IP, SIM/eSIM, And Identifier Resource | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate numbering, ip, sim/esim, and identifier resource state available through APIs |
| Handle Numbering, IP, SIM/eSIM, And Identifier Resource exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Numbering, IP, SIM/eSIM, And Identifier Resource performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF685](../../../../references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool), [TMF716](../../../../references/tmforum-open-apis/openapi-specs/TMF716_ResourceReservation), [TMF640](../../../../references/tmforum-open-apis/openapi-specs/TMF640_ActivationConfiguration)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 7: Reservation And Assignment

Anchor: `reservation-and-assignment`

### Capability Intent

Reserve resources during planning, qualification, quote, order, and fulfillment. Manage expiry, cancellation, conversion, release, conflict detection, and double-booking prevention.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Reserve resources during planning.
- Qualification.
- And fulfillment.
- Manage expiry.
- Cancellation.
- Conflict detection.
- And double-booking prevention.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for reservation and assignment records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate reservation and assignment changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for reservation and assignment work. |
| API and event behavior | Expose command, query, and event contracts for reservation and assignment so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Reservation And Assignment | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate reservation and assignment state available through APIs |
| Handle Reservation And Assignment exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Reservation And Assignment performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF716](../../../../references/tmforum-open-apis/openapi-specs/TMF716_ResourceReservation), [TMF685](../../../../references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 8: Inventory Reconciliation

Anchor: `inventory-reconciliation`

### Capability Intent

Compare inventory with discovery, activation, field evidence, build handover, billing, and order records. Detect orphaned resources, missing services, duplicates, mismatches, and stale states.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Compare inventory with discovery.
- Field evidence.
- Build handover.
- And order records.
- Detect orphaned resources.
- Missing services.
- And stale states.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for inventory reconciliation records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate inventory reconciliation changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for inventory reconciliation work. |
| API and event behavior | Expose command, query, and event contracts for inventory reconciliation so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Inventory Reconciliation | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate inventory reconciliation state available through APIs |
| Handle Inventory Reconciliation exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Inventory Reconciliation performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF703](../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory), [TMF697](../../../../references/tmforum-open-apis/openapi-specs/TMF697_Work_Order)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 9: Network Discovery And Inventory Sync

Anchor: `network-discovery-and-inventory-sync`

### Capability Intent

Ingest discovered resources, services, configurations, topology, and state from controllers, EMS/NMS, cloud platforms, probes, and device systems. Detect drift, unauthorized changes, and stale assignments.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Ingest discovered resources.
- Configurations.
- And state from controllers.
- Cloud platforms.
- And device systems.
- Detect drift.
- Unauthorized changes.
- And stale assignments.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for network discovery and inventory sync records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate network discovery and inventory sync changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for network discovery and inventory sync work. |
| API and event behavior | Expose command, query, and event contracts for network discovery and inventory sync so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Network Discovery And Inventory Sync | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate network discovery and inventory sync state available through APIs |
| Handle Network Discovery And Inventory Sync exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Network Discovery And Inventory Sync performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF638](../../../../references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory), [TMF703](../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory), [TMF655](../../../../references/tmforum-open-apis/openapi-specs/TMF655_ChangeManagement)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 10: Migration And Decommissioning

Anchor: `migration-and-decommissioning`

### Capability Intent

Plan migrations from legacy products, services, platforms, technologies, sites, pools, and network elements. Track impact, waves, rollback, stranded capacity, recovered assets, reuse, disposal, and billing/order implications.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Plan migrations from legacy products.
- Technologies.
- And network elements.
- Track impact.
- Stranded capacity.
- Recovered assets.
- And billing/order implications.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for migration and decommissioning records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate migration and decommissioning changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for migration and decommissioning work. |
| API and event behavior | Expose command, query, and event contracts for migration and decommissioning so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Migration And Decommissioning | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate migration and decommissioning state available through APIs |
| Handle Migration And Decommissioning exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Migration And Decommissioning performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF637](../../../../references/tmforum-open-apis/openapi-specs/TMF637_ProductInventory), [TMF638](../../../../references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory), [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF655](../../../../references/tmforum-open-apis/openapi-specs/TMF655_ChangeManagement), [TMF681](../../../../references/tmforum-open-apis/openapi-specs/TMF681_Communication)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 11: Inventory Location Management

Anchor: `inventory-location-management`

### Capability Intent

Bind operational inventory to canonical geography, sites, facilities, rooms, racks, shelves, slots, ports, fiber routes, demarcation points, and site access evidence while keeping address, site, and location identity mastered by Geography, Address, Site, And Serviceability.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Inventory-to-site binding.
- Facility, rack, shelf, slot, and port placement.
- Route, demarcation, and GIS reference.
- Site access, HSE, and field evidence linkage.
- Location confidence, conflict, and correction workflow.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Placement and lifecycle management | Create, search, view, update, move, quarantine, retire, and audit inventory-location bindings for resources, services, facilities, routes, racks, ports, and demarcation points. |
| Validation, policy, and eligibility | Validate canonical site/location reference, placement uniqueness, containment hierarchy, tenant/region boundary, access constraint, HSE evidence, and field/as-built evidence before accepting placement state. |
| Work queues and approvals | Provide queues for missing site reference, duplicate placement, GIS mismatch, access evidence gap, blocked move, correction approval, and downstream consumer revalidation. |
| Search, map, timeline, and operational views | Offer location-aware inventory search, placement timeline, site/facility drill-down, map overlay references, confidence indicators, and persona-specific dashboards. |
| API and event behavior | Expose command, query, and event contracts for inventory location so fulfillment, field, assurance, planning, and data consumers do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, source evidence, site/location source owner, confidence, before/after placement, legal hold, access/HSE evidence, and reporting metrics. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Bind inventory to location | Build handover, activation, field evidence, discovery, or manual stewardship creates placement evidence | Validate canonical geography reference and placement hierarchy, then publish accepted binding | Inventory consumers can find reliable site, facility, rack, route, and demarcation context |
| Handle location exception | Duplicate rack/slot, GIS mismatch, stale site, missing HSE evidence, or partner demarcation gap | Route to owner, capture evidence, quarantine unsafe binding, and request consumer revalidation | Exception closed with auditable location confidence and downstream handoff |
| Review location quality | Operations or data steward needs location accuracy view | Filter stale, low-confidence, duplicate, moved, or orphaned placements | Actionable location correction backlog and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF703](../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory), [TMF674](../../../../references/tmforum-open-apis/openapi-specs/TMF674_GeographicSite), [TMF675](../../../../references/tmforum-open-apis/openapi-specs/TMF675_GeographicLocation), [TMF697](../../../../references/tmforum-open-apis/openapi-specs/TMF697_Work_Order)

Implementation guidance:

- Treat TMF674/TMF675 records as referenced canonical geography, not app-owned geography masters.
- Publish location-bound, location-corrected, placement-conflict-raised, and consumer-revalidation-requested events.
- Keep integration retries, idempotency keys, correlation IDs, source freshness, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store inventory-location binding records, placement hierarchy, source evidence, confidence score, and correction decisions in the app's logical database.
- Store canonical geography IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide metrics for location confidence, stale placement, duplicate location, GIS mismatch, correction aging, consumer lag, and downstream fallout.
- Support role-based access, tenant/region boundaries, critical-infrastructure masking, HSE evidence controls, and export controls.

### First Release Interpretation

For the first release, deliver inventory-to-site binding, facility/rack/port placement, demarcation references, location confidence, exception queues, APIs, events, and dashboards. Advanced GIS editing remains outside this app.

## Module 12: Inventory Connectivity And Path Management

Anchor: `inventory-connectivity-and-path-management`

### Capability Intent

Maintain accepted operational connectivity paths, circuits, bearer links, service paths, endpoints, diversity, shared-risk groups, partner/off-net demarcation, virtual/cloud connectivity, and path confidence. Planned connectivity and design alternatives remain with Network Engineering And Design until accepted.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Circuit, bearer, and service path inventory.
- Endpoint relationship and path traversal.
- Diversity, shared-risk, and failure-domain tagging.
- Partner/off-net and wholesale demarcation.
- Virtual, cloud, SDN/NFV, and network-slice connectivity.
- Path confidence, drift, and correction workflow.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Path lifecycle management | Create, search, view, update, split, merge, reroute, quarantine, retire, and audit actual connectivity path records. |
| Validation, policy, and eligibility | Validate endpoints, directionality, path continuity, bandwidth class, diversity rule, shared-risk policy, partner boundary, and source confidence before publishing path state. |
| Work queues and approvals | Provide queues for broken path, ambiguous endpoint, duplicate circuit, diversity violation, stale discovery path, partner evidence gap, and blocked decommission. |
| Search, graph, timeline, and operational views | Offer path search, circuit detail, endpoint drill-down, impact traversal, path timeline, diversity view, and persona-specific connectivity dashboards. |
| API and event behavior | Expose command, query, and event contracts for actual connectivity so assurance, fulfillment, change, CPQ, planning, and partner consumers do not bypass inventory APIs. |
| Audit, evidence, and reporting | Capture actor, source evidence, endpoint state, path confidence, diversity decision, partner evidence, before/after path, and reporting metrics. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain connectivity path | Activation, design acceptance, field evidence, discovery, partner feed, or manual correction creates path evidence | Validate endpoints, continuity, diversity, and source confidence, then publish accepted path | Fulfillment, assurance, and change can rely on actual path impact |
| Handle connectivity exception | Broken path, duplicate circuit, ambiguous endpoint, missing partner demarcation, or diversity failure | Route to owner, block unsafe closure, capture evidence, and notify impacted consumers | Exception closed with auditable path confidence and correction result |
| Review connectivity performance | Assurance, network engineering, or data steward needs path quality view | Filter low-confidence, stale, broken, overutilized, or non-diverse paths | Actionable path correction or engineering follow-up |

### API And Integration Alignment

Related APIs and API areas: [TMF638](../../../../references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory), [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF703](../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory), [TMF645](../../../../references/tmforum-open-apis/openapi-specs/TMF645_ServiceQualification), [TMF655](../../../../references/tmforum-open-apis/openapi-specs/TMF655_ChangeManagement)

Implementation guidance:

- Use TMF638/TMF639/TMF703 for service/resource/entity relationships and extension APIs for multi-hop path traversal, diversity, shared-risk, and partner demarcation details.
- Publish connectivity-path-created, connectivity-path-corrected, path-impact-changed, path-diversity-violated, and consumer-revalidation-requested events.
- Keep integration retries, idempotency keys, correlation IDs, source freshness, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store actual connectivity path records, endpoints, path segments, source evidence, confidence score, diversity groups, and correction decisions in the app's logical database.
- Store external circuit IDs, partner references, topology edge references, status reason, timestamps, and relationship references needed for traceability.
- Provide metrics for path confidence, broken path count, duplicate circuits, stale discovery paths, diversity violations, partner evidence aging, and consumer lag.
- Support role-based access, tenant/region boundaries, critical-infrastructure masking, partner data controls, and export controls.

### First Release Interpretation

For the first release, deliver circuit/path inventory, endpoint validation, path confidence, partner demarcation references, basic diversity checks, APIs, events, exception queues, and dashboards. Advanced route optimization can follow.

## Module 13: Operational Inventory Planning

Anchor: `operational-inventory-planning`

### Capability Intent

Plan short-horizon inventory readiness using actual inventory, pool state, reservations, assignments, discovery confidence, migration needs, decommission release, stranded capacity, and recovered resources. Strategic capacity models, investment scenarios, and future-capacity reservations remain with Network Investment And Capacity Planning until converted.

### Primary Personas Supported

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

### Feature Backlog Candidates

- Operational readiness plan for inventory-dependent fulfillment.
- Reservation forecast and assignment preparedness.
- Pool exhaustion, stranded capacity, and recovered capacity signal.
- Migration and decommission wave inventory readiness.
- Plan-to-actual acceptance and exception workflow.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Planning lifecycle management | Create, search, view, update, approve, convert, release, cancel, and audit operational inventory plans. |
| Validation, policy, and eligibility | Validate actual inventory state, pool availability, reservation expiry, assignment conflict, location confidence, connectivity readiness, migration hold, legal hold, and planning boundary before conversion. |
| Work queues and approvals | Provide queues for readiness gap, reservation conflict, stranded capacity, decommission hold, pool exhaustion, low-confidence inventory, and exception approval. |
| Search, timeline, and operational views | Offer inventory readiness boards, reservation forecasts, assignment backlog, pool exhaustion view, migration wave inventory view, and decommission release dashboard. |
| API and event behavior | Expose command, query, and event contracts for operational inventory planning so fulfillment, field, capacity planning, assurance, and data consumers do not bypass inventory APIs. |
| Audit, evidence, and reporting | Capture actor, source forecast, actual inventory input, confidence, before/after plan, conversion decision, approval evidence, and reporting metrics. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Plan operational inventory readiness | Capacity plan, quote demand, migration wave, fulfillment backlog, or decommission initiative needs near-term inventory readiness | Validate actual inventory, pools, reservations, assignments, location, and connectivity before approving operational plan | Fulfillment and migration teams get reliable inventory readiness with gaps visible |
| Convert plan to reservation or assignment | Approved operational plan reaches execution window | Convert eligible plan items to operational reservations or assignments and publish state changes | Execution starts without double-booking or stale inventory assumptions |
| Handle readiness exception | Low-confidence inventory, stranded capacity, reservation conflict, legal hold, or incomplete decommission release blocks plan | Route to owner, capture evidence, hold unsafe conversion, and notify consumers | Exception closed with auditable decision and downstream handoff |

### API And Integration Alignment

Related APIs and API areas: [TMF685](../../../../references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool), [TMF716](../../../../references/tmforum-open-apis/openapi-specs/TMF716_ResourceReservation), [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF771](../../../../references/tmforum-open-apis/openapi-specs/TMF771_ResourceUsage)

Implementation guidance:

- Treat strategic capacity plans and future reservations as referenced inputs until the operational plan converts them into inventory-owned reservations or assignments.
- Publish operational-inventory-plan-approved, readiness-gap-raised, operational-reservation-converted, stranded-capacity-released, and consumer-revalidation-requested events.
- Keep integration retries, idempotency keys, correlation IDs, source freshness, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store operational inventory plan records, readiness gaps, conversion decisions, pool snapshots, reservation forecasts, confidence score, and correction decisions in the app's logical database.
- Store capacity plan references, future reservation references, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide metrics for readiness gap aging, reservation conflict rate, stranded capacity, decommission release, pool exhaustion, conversion success, and consumer lag.
- Support role-based access, tenant/region boundaries, sensitive topology masking, legal hold, retention, and export controls.

### First Release Interpretation

For the first release, deliver inventory readiness boards, reservation forecast, assignment preparedness, plan-to-reservation conversion, stranded capacity tracking, APIs, events, exception queues, and dashboards. Strategic optimization remains with capacity planning.
## Critical Feature Review Enhancements (2026-06-14)

### Critical Assessment

Inventory And Topology already has strong detailed feature specifications, especially for location, connectivity/path, and operational inventory planning. The app-level module document still needs an explicit implementation bridge: accepted inventory truth, source confidence, reservation/assignment integrity, topology impact, discovery staging, reconciliation, and migration/decommission controls must be visible from the main feature baseline.

### Enhancements To Add

| Enhancement | Modules | Implementation need |
| --- | --- | --- |
| Accepted inventory truth workspace | Product Inventory; Service Inventory; Resource Inventory | Maintain accepted lifecycle state, source authority, confidence, before/after history, related product/order/customer references, and correction workflow. |
| Topology and impact workbench | Topology And Relationship; Inventory Connectivity And Path Management | Traverse product, service, resource, site, location, path, circuit, endpoint, diversity, and shared-risk relationships with masking and confidence indicators. |
| Reservation and assignment integrity board | Resource Pool And Capacity; Reservation And Assignment; Numbering, IP, SIM/eSIM, And Identifier Resource | Prevent double booking, stale reservations, unsafe reuse, identifier conflicts, eSIM/SIM lifecycle gaps, and assignment without valid readiness. |
| Discovery staging and reconciliation queue | Network Discovery And Inventory Sync; Inventory Reconciliation | Stage controller/discovery/field/build inputs, compare against accepted inventory, classify discrepancies, assign steward, and publish accepted corrections only after approval. |
| Inventory location and path confidence controls | Inventory Location Management; Inventory Connectivity And Path Management | Surface stale location, duplicate placement, path discontinuity, diversity violation, demarc evidence gap, and consumer revalidation status. |
| Migration and decommission control | Migration And Decommissioning; Operational Inventory Planning | Validate active services, reservations, assignments, legal hold, billing/order/ticket references, rollback window, recovered assets, and capacity release before retirement. |
| Consumer revalidation service | Inventory Reconciliation; Operational Inventory Planning | Notify fulfillment, assurance, capacity, field, billing, self-care, and data consumers when accepted inventory changes require revalidation. |

### Required Screens

| Screen | Required behavior |
| --- | --- |
| Inventory operations cockpit | Inventory quality, discovery drift, reconciliation backlog, reservation conflicts, assignment readiness, and decommission holds. |
| Inventory entity detail | Product/service/resource state, topology, location, path, assignments, reservations, source evidence, lifecycle timeline, and consumer impact. |
| Topology/path canvas or explorer | Actual topology traversal, path continuity, confidence, diversity, failure domains, and affected products/services/customers. |
| Reconciliation queue | Source record, accepted record, difference, confidence, owner, proposed correction, approval/waiver, and publication status. |
| Migration/decommission board | Wave, impacted inventory, active dependencies, rollback state, recovered capacity, legal hold, and retirement readiness. |

### Open-Source Decision Points

| Need | Candidate options | Decision prompt |
| --- | --- | --- |
| Topology/graph traversal | PostgreSQL recursive queries; Apache AGE; external graph DB; in-memory graph service | Start with PostgreSQL relationships; ask before adding graph storage or graph compute. |
| Topology visualization | PrimeNG tree/table; Angular CDK/SVG canvas; Cytoscape.js; Sigma.js | Add a topology library only if operational traversal needs an interactive canvas. |
| Geospatial and placement queries | PostgreSQL; PostGIS | Use PostGIS only if spatial containment, route, distance, or map search becomes core to release 1. |
| Discovery ingestion | Spring adapters; Apache Camel; event broker adapter | Keep adapters behind Spring services; ask before adding integration runtime or streaming platform. |

### API/Event/Data Additions

| Area | Additions |
| --- | --- |
| APIs | Inventory accept/correct/quarantine, topology traversal, path validate, reservation hold/release/convert, assignment approve, discovery stage/reconcile, decommission readiness, consumer revalidation. |
| Events | `InventoryAccepted`, `InventoryCorrected`, `TopologyChanged`, `ConnectivityPathChanged`, `ReservationChanged`, `AssignmentChanged`, `DiscoveryDriftDetected`, `ReconciliationCompleted`, `DecommissionBlocked`, `ConsumerRevalidationRequested`. |
| Data | Accepted operational product/service/resource inventory and actual topology are mastered here; discovery, activation, field, build, planned topology, and controller inputs remain evidence until accepted. |

### First Release Scope

Include accepted inventory detail, topology/path explorer, reservation and assignment board, discovery staging, reconciliation queue, identifier lifecycle controls, and migration/decommission readiness. Defer advanced digital twin analytics, graph database adoption, and broad discovery automation until the acceptance workflow is reliable.

# Inventory And Topology App Feature Specifications

Reviewed: 2026-06-07

This folder contains detailed feature specifications for the Inventory And Topology app. The app owns installed product inventory, service inventory, resource inventory, inventory-location bindings, topology relationships, actual connectivity paths, operational inventory plans, resource pools, identifiers, reservations, assignments, reconciliation cases, discovery sync records, migration/decommissioning waves, physical plant inventory, asset/RMA state, and digital twin stewardship evidence. The app does not own canonical address/site/location masters, strategic capacity plans, planned topology/design records, commercial product catalog records, service/resource specification definitions, product orders, service/resource order execution, activation execution, field work execution, stock financial procurement, assurance tickets, customer records, billing records, partner lifecycle, or platform security records.

Parent app: [Inventory And Topology App](../README.md)

## Feature Specification Index

| Feature specification | Inventory and topology intent | Primary TMF anchors | Gap priority |
| --- | --- | --- | --- |
| [Product Inventory](product-inventory.md) | Maintain installed product instances, product status, relationships, characteristics, customer/account links, product order links, billing links, trouble ticket links, and self-care/care visibility for active telecom customers. | TMF637, TMF638, TMF641 | Core |
| [Service Inventory](service-inventory.md) | Maintain active and planned service instances, customer-facing to resource-facing service links, service characteristics, service status, activation reconciliation, and assurance-ready service relationships. | TMF638, TMF641, TMF639 | Core |
| [Resource Inventory](resource-inventory.md) | Maintain physical, logical, cloud, software, CPE, SIM/eSIM, number, IP, port, card, link, license, ownership, location, assignment, relationship, and lifecycle state as operational resource truth. | TMF639, TMF703, TMF634, TMF687 | Core |
| [Inventory Location Management](inventory-location-management.md) | Bind operational inventory to canonical sites, geographic locations, facilities, rooms, racks, shelves, slots, ports, routes, demarcation points, site-access notes, and placement confidence without mastering the geography record itself. | TMF639, TMF674, TMF675, TMF697 | Core |
| [Topology And Relationship](topology-and-relationship.md) | Model relationships between products, services, resources, sites, links, network functions, facilities, identifiers, and dependencies so fulfillment, assurance, change, field, and capacity processes can reason over impact and ownership. | TMF638, TMF639, TMF703, TMF642, TMF655 | Core |
| [Inventory Connectivity And Path Management](inventory-connectivity-and-path-management.md) | Maintain actual connectivity paths, circuits, bearer links, service paths, endpoint relationships, path diversity, shared-risk groups, partner/off-net demarcation, virtual/cloud connectivity, and path confidence. | TMF638, TMF639, TMF703, TMF645, TMF655 | Core |
| [Resource Pool And Capacity](resource-pool-and-capacity.md) | Manage operational pools for IP addresses, numbers, ports, bandwidth, compute, storage, CPE, SIM/eSIM, spectrum, licenses, and scarce resources with available, consumed, reserved, quarantined, blocked, threshold, and exhaustion state. | TMF685, TMF771, TMF716, TMF639 | Core |
| [Operational Inventory Planning](operational-inventory-planning.md) | Plan short-horizon inventory readiness, reservation demand, assignment preparedness, stranded capacity, migration wave inventory needs, decommission release, and plan-to-actual acceptance while strategic capacity planning remains outside this app. | TMF685, TMF716, TMF639, TMF771 | Core |
| [Numbering, IP, SIM/eSIM, And Identifier Resource](numbering-ip-sim-esim-and-identifier-resource.md) | Manage MSISDN, IMSI, ICCID, eSIM profile, IP address, prefix, VLAN, circuit ID, port ID, device ID, service ID blocks, ranges, reuse rules, quarantine, assignment history, portability state, activation handoff, swap, replacement, and release. | TMF639, TMF685, TMF716, TMF640 | Core |
| [Reservation And Assignment](reservation-and-assignment.md) | Reserve and assign resources during planning, qualification, quote, order, fulfillment, field work, migration, and activation while controlling expiry, cancellation, conversion, release, conflict detection, and double-booking prevention. | TMF716, TMF685, TMF639, TMF641, TMF652 | Core |
| [Inventory Reconciliation](inventory-reconciliation.md) | Compare inventory with discovery, activation, field evidence, build handover, billing, order, partner, and assurance records to detect orphaned resources, missing services, duplicates, mismatches, stale states, and correction ownership. | TMF639, TMF638, TMF637, TMF703, TMF697 | Core |
| [Network Discovery And Inventory Sync](network-discovery-and-inventory-sync.md) | Ingest discovered resources, services, configurations, topology, and state from controllers, EMS/NMS, SDN/NFV, cloud platforms, probes, device systems, and partner feeds to detect drift, unauthorized changes, stale assignments, and inventory correction needs. | TMF639, TMF638, TMF703, TMF655, TMF642 | Core |
| [Migration And Decommissioning](migration-and-decommissioning.md) | Plan and control migrations from legacy products, services, platforms, technologies, sites, pools, and network elements while tracking customer/service impact, waves, rollback, stranded capacity, recovered assets, reuse, disposal, and billing/order implications. | TMF637, TMF638, TMF639, TMF655, TMF681, TMF697 | Core |
| [Physical Plant And Facility Inventory](physical-plant-and-facility-inventory.md) | Track detailed physical plant and facilities including ducts, poles, splice closures, fiber routes, cables, circuits, cabinets, racks, shelves, slots, ports, power/space/cooling, facility space, and relationships to logical inventory. | TMF639, TMF703, TMF674, TMF675, TMF634, TMF697 | High E2E gap closure |
| [Asset RMA Warranty And Refurbishment Lifecycle](asset-rma-warranty-and-refurbishment-lifecycle.md) | Control spare, installed, returned, repaired, refurbished, scrapped, warranty, and RMA states for devices, CPE, SIM/eSIM, network assets, serialized parts, and recovered equipment while linking stock, shipment, product/service/resource inventory, and field evidence. | TMF639, TMF687, TMF700, TMF684, TMF637, TMF697 | High E2E gap closure |
| [Digital Twin Impact Graph And Data Stewardship](digital-twin-impact-graph-and-data-stewardship.md) | Maintain a confidence-scored multi-domain digital twin with customer/service/resource/site impact graph, lineage, discrepancy queues, stewardship decisions, and correction workflow for assurance, fulfillment, change, planning, and regulatory evidence. | TMF638, TMF639, TMF703, TMF642, TMF656 | High E2E gap closure |
| [IPAM DNS DHCP And Identifier Governance](ipam-dns-dhcp-and-identifier-governance.md) | Govern IP address pools, prefixes, DNS records, DHCP bindings, VLANs, circuit IDs, number ranges, SIM/eSIM identifiers, reuse, quarantine, reservation, assignment, and audit evidence across inventory and external IPAM/DNS/DHCP systems. | TMF639, TMF685, TMF716, TMF640 | High E2E gap closure |

## App-Level Control Scope

- Inventory And Topology masters operational inventory truth: installed product, service, resource, inventory-location binding, topology, actual connectivity path, operational inventory plan, pool, identifier, reservation, assignment, reconciliation, discovery sync, migration, decommissioning, physical plant, asset/RMA, and stewardship records.
- Geography, Address, Site, And Serviceability remains master for canonical address/site/location, coverage, territory, readiness, and serviceability decision records.
- Network Investment And Capacity Planning remains master for strategic capacity models, exhaustion forecasts, investment scenarios, and future-capacity reservations before conversion to operational reservation.
- Network Engineering And Design remains master for planned topology and design artifacts until accepted into operational inventory.
- Inventory And Topology references catalog, order, activation, field, stock, GIS, discovery, assurance, billing, customer, partner, platform, and data records through APIs, events, governed projections, adapters, or evidence packages.
- Inventory And Topology must never become the product catalog, service/resource catalog, product order, service order, resource order, activation controller, work order, warehouse/ERP procurement, alarm/incident/ticket, customer, billing, partner, or platform policy master.

## Cross-App Handoffs To Prove

| Handoff | Required evidence |
| --- | --- |
| Design/build to accepted inventory | Resource/service specification version, planned/as-built topology reference, field or build evidence, acceptance decision, confidence score, and correction route. |
| Geography/site to inventory placement | Canonical address/site/location ID, inventory placement hierarchy, demarcation point, GIS reference, site-access evidence, confidence score, and correction route. |
| Order/fulfillment to inventory | Service order/resource order reference, reservation/assignment state, activation evidence, partial activation/rollback status, inventory update decision, and event ID. |
| Planning to operational inventory | Capacity plan or future reservation reference, approved demand window, operational reservation conversion, assignment readiness, released/stranded capacity, and exception route. |
| Inventory connectivity to consumers | Endpoint resources, service path, circuit/link references, diversity/shared-risk evidence, partner boundary, path confidence, and impact traversal result. |
| Inventory to assurance/NOC | Product/service/resource/site topology, impact graph, confidence score, active customer/service impact, stale-data warning, and correction route. |
| Inventory to field/stock/logistics | Work order context, installed/removed asset reference, stock/RMA/shipment link, site/HSE evidence, and inventory acceptance or rejection status. |
| Inventory to BSS and self-care | Installed product/service state, customer-visible status, billing/order reconciliation, masking policy, and freshness/confidence indicator. |
| Inventory to compliance/data | Source authority, lineage, retention, legal hold, data residency, regulated inventory evidence, HSE/site access evidence, and export controls. |

## How To Use These Feature Specs

- Use each feature specification as the starting point for epics, user stories, API contracts, event contracts, reconciliation rules, discovery adapters, operational dashboards, runbooks, and data-quality controls.
- Confirm the master entity, referenced entities, TMF API fit, non-TMF extension APIs, events, private database boundary, source confidence, and consumer revalidation behavior before implementation starts.
- Keep app-owned writes inside the Inventory And Topology boundary; cross-app work must use APIs, events, governed projections, workflow tasks, adapters, evidence packages, or certified data products.
- Validate every feature against order-to-activate, plan-to-build handoff, assure-to-optimize feedback, trouble-to-resolve support, lead-to-order feasibility/reservation, partner/off-net delivery evidence, and govern-to-comply asset/site/HSE/inventory evidence journeys.

## Feature Detail Review Alignment (2026-06-14)

Source: [Suite Feature Detail Review](../../feature-detail-review.md) and [Critical Feature Review Enhancements](../modules-and-features.md#critical-feature-review-enhancements-2026-06-14).

The 2026-06-14 review upgrades this app feature set with required scope: accepted inventory truth, topology and path confidence, reservations and assignments, discovery staging, reconciliation, migration, and decommissioning.

Apply this scope when refining the feature specifications in this folder:

- Add or update epics, stories, UI workbenches, APIs, events, app-owned data fields, DDL gaps, test cases, observability, runbooks, and definition-of-done evidence for the review scope.
- Preserve the app data ownership boundary. Cross-app access must use APIs, events, workflow tasks, governed projections, or certified data products rather than direct database sharing.
- If this scope needs technology beyond Angular, Spring Boot, PostgreSQL, and PrimeNG, offer open-source options with pros, cons, and a recommendation before implementation.

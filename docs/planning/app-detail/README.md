# Inventory And Topology App Detail Pack

Reviewed: 2026-06-06

This folder expands the concise app overview into build-ready module, feature, persona, and user journey planning. The concise source overview remains at [inventory-and-topology.md](../inventory-and-topology.md).

Suite: OSS Engineering, Inventory, And Fulfillment

## Build Intent

Maintain the operational system of record for product, service, resource, topology, inventory location, operational inventory planning, connectivity paths, capacity, identifiers, reservations, assignments, reconciliation, discovery, migration, and decommissioning.

## Detail Documents

- [Modules And Features](modules-and-features.md)
- [Feature Specifications](features/README.md)
- [Personas And User Journeys](personas-and-user-journeys.md)

## Primary Personas

- Inventory manager: maintains inventory accuracy and lifecycle state.
- Provisioning analyst: reserves and assigns resources during fulfillment.
- Assurance analyst: uses topology and inventory for impact analysis.
- Capacity planner: consumes resource pool and usage visibility.
- Network engineer: compares planned, discovered, and actual topology.
- Migration manager: coordinates legacy migration and decommissioning.

## Core Operating Flow

1. Maintain product, service, and resource inventory with lifecycle state and relationships.
2. Bind inventory to canonical geography, sites, facilities, racks, demarcation points, and operational placement evidence without mastering address or site identity.
3. Model topology from product to service to resource to site/network element, including logical and physical connectivity paths.
4. Manage resource pools, scarce identifiers, number portability support, eSIM profile lifecycle, reservation, assignment, release, quarantine, and reuse.
5. Plan near-term operational inventory readiness for fulfillment, migration, capacity release, stranded capacity, and decommission waves.
6. Reconcile inventory with activation, field evidence, build handover, discovery, billing, and orders.
7. Ingest network discovery and detect drift or unrecorded resources.
8. Plan migration and decommissioning waves with customer/service impact and rollback.

## Module Map

| Module | Feature focus | Related APIs |
| --- | --- | --- |
| Product Inventory | Maintain installed products, status, relationships, characteristics, lifecycle, customer/account links, order links, billing links, trouble ticket links, and self-care/care views. | [TMF637](../../../../references/tmforum-open-apis/openapi-specs/TMF637_ProductInventory) |
| Service Inventory | Maintain active and planned service instances, service characteristics, service relationships, service status, customer-facing to resource-facing links, and activation reconciliation. | [TMF638](../../../../references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory) |
| Resource Inventory | Maintain physical, logical, cloud, software, CPE, SIM/eSIM, numbers, IP pools, ports, cards, links, licenses, ownership, location, assignment, relationships, and lifecycle states. | [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF703](../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory) |
| Inventory Location Management | Bind inventory records to canonical sites, locations, facilities, floors, rooms, racks, shelves, slots, ports, routes, demarcation points, access notes, HSE evidence, and location confidence. | [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF674](../../../../references/tmforum-open-apis/openapi-specs/TMF674_GeographicSite), [TMF675](../../../../references/tmforum-open-apis/openapi-specs/TMF675_GeographicLocation) |
| Topology And Relationship | Model relationships between products, services, resources, sites, links, network functions, and dependencies | [TMF638](../../../../references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory), [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF703](../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory) |
| Inventory Connectivity And Path Management | Maintain actual connectivity paths, circuits, bearer links, endpoint relationships, path diversity, shared-risk groups, partner/off-net demarcation, virtual/cloud connectivity, and path confidence. | [TMF638](../../../../references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory), [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF703](../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory) |
| Resource Pool And Capacity | Manage pools for IP addresses, numbers, ports, bandwidth, compute, storage, CPE, SIM/eSIM, spectrum, and licenses | [TMF685](../../../../references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool), [TMF771](../../../../references/tmforum-open-apis/openapi-specs/TMF771_ResourceUsage) |
| Operational Inventory Planning | Manage short-horizon inventory readiness, reservation forecasts, assignment preparedness, stranded capacity, migration waves, decommission release, and plan-to-actual inventory acceptance. | [TMF685](../../../../references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool), [TMF716](../../../../references/tmforum-open-apis/openapi-specs/TMF716_ResourceReservation), [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory) |
| Numbering, IP, SIM/eSIM, And Identifier Resource | Manage MSISDN, IMSI, ICCID, eSIM profile, IP address, prefix, VLAN, circuit ID, port ID, device ID, and service ID blocks, ranges, reuse rules, quarantine, assignment history, and audit | [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF685](../../../../references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool), [TMF716](../../../../references/tmforum-open-apis/openapi-specs/TMF716_ResourceReservation), [TMF640](../../../../references/tmforum-open-apis/openapi-specs/TMF640_ActivationConfiguration) |
| Reservation And Assignment | Reserve resources during planning, qualification, quote, order, and fulfillment | [TMF716](../../../../references/tmforum-open-apis/openapi-specs/TMF716_ResourceReservation), [TMF685](../../../../references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool) |
| Inventory Reconciliation | Compare inventory with discovery, activation, field evidence, build handover, billing, and order records | [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF703](../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory), [TMF697](../../../../references/tmforum-open-apis/openapi-specs/TMF697_Work_Order) |
| Network Discovery And Inventory Sync | Ingest discovered resources, services, configurations, topology, and state from controllers, EMS/NMS, cloud platforms, probes, and device systems | [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF638](../../../../references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory), [TMF703](../../../../references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory), [TMF655](../../../../references/tmforum-open-apis/openapi-specs/TMF655_ChangeManagement) |
| Migration And Decommissioning | Plan migrations from legacy products, services, platforms, technologies, sites, pools, and network elements | [TMF637](../../../../references/tmforum-open-apis/openapi-specs/TMF637_ProductInventory), [TMF638](../../../../references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory), [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF655](../../../../references/tmforum-open-apis/openapi-specs/TMF655_ChangeManagement), [TMF681](../../../../references/tmforum-open-apis/openapi-specs/TMF681_Communication) |

## Data Ownership

Owns product, service, resource, topology, inventory-location binding, actual connectivity path, operational inventory plan, pool, identifier, reservation, assignment, reconciliation, discovery-sync, migration, and decommissioning records. Catalog models are owned by design/catalog apps. Canonical address, site, location, serviceability, strategic capacity planning, and planned topology remain owned by the Strategy, Investment, And Capacity suite.

## First Release Scope

Deliver product/service/resource inventory, topology basics, inventory location management, connectivity path basics, resource pools, operational inventory planning, reservation/assignment, and reconciliation. Add deep discovery sync, migration automation, decommissioning analytics, and advanced path optimization after core fulfillment depends on inventory reliably.

## Build Notes

- Treat this app as an API-first product surface. UI screens, automations, partner access, and internal integrations should use the same app-owned APIs.
- Keep the app database private to this app or its module owners. Other apps should consume APIs, events, governed read models, or data products.
- Create backlog items at feature level, but preserve module ownership so roadmap, permissions, observability, and data stewardship remain clear.

## Implementation Guidance

- [Implementation File Usage](implementation-file-usage.md)

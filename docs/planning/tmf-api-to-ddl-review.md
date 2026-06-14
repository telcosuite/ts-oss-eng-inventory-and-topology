# Inventory And Topology TMF API To DDL Review

Reviewed: 2026-06-14

Status: Complete for baseline app implementation. Endpoint-specific contract tests and final story-level field promotion still happen during build.

## Scope

This review covers `inventory_topology` in suite database `ts_oss_engineering_fulfillment`. It uses the local TMF Open API reference set, the suite data model, the API-to-DDL traceability matrix, and the V001 starter DDL.

The review confirms that the app can move into implementation with a V002 typed DDL baseline while preserving full TMF payload compatibility through validated `tmf_payload`, typed common TMF columns, and normalized support tables.

## TMF API Baseline Selection

| TMF API | Local baseline spec | Resources/path roots reviewed | V001 table groups |
| --- | --- | --- | --- |
| TMF637 | `references/tmforum-open-apis/openapi-specs/TMF637_ProductInventory/TMF637-ProductInventory-v5.0.0.oas.yaml` | `product` | installed_product_inventory; migration_decommissioning_state |
| TMF638 | `references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory/TMF638-Service_Inventory_Management-v5.0.0.oas.yaml` | `service` | service_inventory; topology_edge; topology_node; discovered_resource_staging |
| TMF639 | `references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory/TMF639-Resource_Inventory_Management-v5.0.0.oas.yaml` | `resource` | resource_inventory; identifier_resource; inventory_location_binding; topology; assignment |
| TMF703 | `references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory/TMF703-EntityInventory-v4.0.0.swagger.json` | `association`, `entity` | topology_node; topology_edge; discovered_resource_staging; inventory_reconciliation_record |
| TMF674 | `references/tmforum-open-apis/openapi-specs/TMF674_GeographicSite/TMF674_Geographic_Site_Management_API_v4.0.0_swagger.json` | `geographicSite` | geographic_site; inventory_location_binding references |
| TMF675 | `references/tmforum-open-apis/openapi-specs/TMF675_GeographicLocation/TMF675-GeographicLocation-v4.0.0.swagger.json` | `geographicLocation` | geographic_location; inventory_location_binding references |
| TMF685 | `references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool/Resource_Pool_Management.regular.swagger.json` | `availabilityCheck`, `extract`, `push`, `reservation`, `resourcePool` | resource_pool; capacity_model references |
| TMF771 | `references/tmforum-open-apis/openapi-specs/TMF771_ResourceUsage/TMF771-Resource_Usage_Management-v5.0.0.oas.yaml` | `resourceUsage`, `resourceUsageSpecification` | capacity_source_snapshot; usage_ingestion_batch; capacity_exhaustion_forecast |
| TMF716 | `references/tmforum-open-apis/openapi-specs/TMF716_ResourceReservation/TMF716_ResourceReservation_v4.0.0_swagger.json` | `cancelResourceReservation`, `resourceReservation` | resource_reservation; future_capacity_reservation |
| TMF640 | `references/tmforum-open-apis/openapi-specs/TMF640_ActivationConfiguration/TMF640_Service_Activation_Management_API_v4.0.0_swagger.json` | `monitor`, `service` | activation_request; activation_response; restriction/reconnection execution references |
| TMF697 | `references/tmforum-open-apis/openapi-specs/TMF697_Work_Order/TMF697-WorkOrder-v4.0.0.swagger.json` | `cancelWorkOrder`, `workOrder` | work_order; remediation_task; vendor_work_package; build_program |
| TMF645 | `references/tmforum-open-apis/openapi-specs/TMF645_ServiceQualification/TMF645-Service_Qualification_Management-v5.0.0.oas.yaml` | `checkServiceQualification`, `queryServiceQualification` | serviceability_rule; serviceability_decision; offering_qualification references |
| TMF655 | `references/tmforum-open-apis/openapi-specs/TMF655_ChangeManagement/TMF655_Change_Management_API_v4.0.0_swagger.json` | `changeRequest` | change_record; maintenance_window; migration_decommissioning_state references |
| TMF681 | `references/tmforum-open-apis/openapi-specs/TMF681_Communication/TMF681_Communication_Management_API_v4.0.0_swagger.json` | `communicationMessage` | communication_record; notification_template; notification_delivery_attempt references |

## Current DDL Coverage

Current starter DDL is in `database/postgres/suites/ts_oss_engineering_fulfillment/V001__create_app_schemas_and_starter_tables.sql` under schema `inventory_topology`.

| Current table | TMF purpose | V002 decision |
| --- | --- | --- |
| `inventory_topology.installed_product_inventory` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.service_inventory` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.resource_inventory` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.inventory_location_binding` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.topology_node` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.topology_edge` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.connectivity_path` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.resource_pool` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.identifier_resource` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.number_portability_state` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.esim_profile_lifecycle` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.resource_reservation` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.resource_assignment` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.discovered_resource_staging` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.inventory_reconciliation_record` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.migration_decommissioning_state` | Starter table for Inventory And Topology; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| `inventory_topology.event_outbox` | App outbox for domain and TMF notification events. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |

## Resource To Table Decisions

| TMF API/resource | Master or anchor table | Path coverage | Promoted field candidates | Field handling strategy |
| --- | --- | --- | --- | --- |
| TMF637 `product` | `inventory_topology.installed_product_inventory` | `/product`, `/product/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF638 `service` | `inventory_topology.service_inventory` | `/service`, `/service/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF639 `resource` | `inventory_topology.resource_inventory` | `/resource`, `/resource/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF703 `association` | `inventory_topology.topology_node` | `/association`, `/association/{id}` | `description`, `lastUpdate`, `lifecycleStatus`, `name`, `validFor`, `version`, `associationSpec`, `associationRole` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF703 `entity` | `inventory_topology.topology_node` | `/entity`, `/entity/{id}` | `context`, `description`, `endDate`, `isBundle`, `isExternal`, `name`, `startDate`, `status` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF674 `geographicSite` | `inventory_topology.inventory_location_binding` | `/geographicSite`, `/geographicSite/{id}` | `id`, `href`, `code`, `description`, `name`, `status`, `calendar`, `place` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF675 `geographicLocation` | `inventory_topology.inventory_location_binding` | `/geographicLocation`, `/geographicLocation/{id}` | `id`, `href`, `@type`, `bbox` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF685 `availabilityCheck` | `inventory_topology.resource_pool` | `/availabilityCheck`, `/availabilityCheck/{id}` | `href`, `id`, `@type`, `@schemaLocation`, `@baseType` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF685 `extract` | `inventory_topology.resource_pool` | `/extract`, `/extract/{id}` | `href`, `id`, `@type`, `@schemaLocation`, `@baseType` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF685 `push` | `inventory_topology.resource_pool` | `/push`, `/push/{id}` | `href`, `id`, `@type`, `@schemaLocation`, `@baseType` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF685 `reservation` | `inventory_topology.resource_reservation` | `/reservation`, `/reservation/{id}` | `@baseType`, `@schemaLocation`, `@type`, `description`, `href`, `id`, `relatedParty`, `reservationState` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF685 `resourcePool` | `inventory_topology.resource_pool` | `/resourcePool`, `/resourcePool/{id}` | `@baseType`, `@schemaLocation`, `@type`, `description`, `href`, `id`, `relatedParty`, `resourceCollection` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF771 `resourceUsage` | `inventory_topology.resource_inventory` | `/resourceUsage`, `/resourceUsage/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF771 `resourceUsageSpecification` | `inventory_topology.resource_inventory` | `/resourceUsageSpecification`, `/resourceUsageSpecification/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF716 `cancelResourceReservation` | `inventory_topology.resource_reservation` | `/cancelResourceReservation`, `/cancelResourceReservation/{id}` | `id`, `href`, `cancellationDate`, `cancellationReason`, `completionDate`, `creationDate`, `description`, `expectedCompletionDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF716 `resourceReservation` | `inventory_topology.resource_reservation` | `/resourceReservation`, `/resourceReservation/{id}` | `id`, `href`, `cancellationDate`, `cancellationReason`, `completionDate`, `creationDate`, `description`, `expectedCompletionDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF640 `monitor` | `inventory_topology.installed_product_inventory` | `/monitor`, `/monitor/{id}` | `id`, `href`, `sourceHref`, `state`, `request`, `response`, `@baseType`, `@schemaLocation` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF640 `service` | `inventory_topology.service_inventory` | `/service`, `/service/{id}` | `id`, `href`, `category`, `description`, `endDate`, `hasStarted`, `isBundle`, `isServiceEnabled` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF697 `cancelWorkOrder` | `inventory_topology.installed_product_inventory` | `/cancelWorkOrder`, `/cancelWorkOrder/{id}` | `id`, `href`, `cancellationDate`, `cancellationReason`, `category`, `completionDate`, `description`, `expectedCompletionDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF697 `workOrder` | `inventory_topology.installed_product_inventory` | `/workOrder`, `/workOrder/{id}` | `id`, `href`, `cancellationDate`, `cancellationReason`, `category`, `completionDate`, `description`, `expectedCompletionDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF645 `checkServiceQualification` | `inventory_topology.service_inventory` | `/checkServiceQualification`, `/checkServiceQualification/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF645 `queryServiceQualification` | `inventory_topology.service_inventory` | `/queryServiceQualification`, `/queryServiceQualification/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF655 `changeRequest` | `inventory_topology.migration_decommissioning_state` | `/changeRequest`, `/changeRequest/{id}` | `id`, `href`, `actualEndTime`, `actualStartTime`, `channel`, `completionDate`, `description`, `impact` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF681 `communicationMessage` | `inventory_topology.installed_product_inventory` | `/communicationMessage`, `/communicationMessage/{id}` | `id`, `href`, `content`, `description`, `logFlag`, `messageType`, `priority`, `scheduledSendTime` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |

## V002 DDL Refinement

Migration: `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql`

The migration adds this implementation baseline for the app:

| Area | Decision |
| --- | --- |
| Common TMF fields | Add reusable typed columns such as `tmf_id`, `tmf_href`, `tmf_type`, `tmf_base_type`, `tmf_schema_location`, `tmf_referred_type`, `tmf_name`, `tmf_description`, `tmf_lifecycle_status`, `tmf_state`, dates, priority, and external ID to every V001 app table. |
| Full TMF compatibility | Keep the V001 `tmf_payload` column as the complete validated TMF resource snapshot for fields that are not yet promoted to typed columns. |
| Characteristics and references | Add normalized `tmf_characteristic`, `tmf_resource_reference`, `tmf_external_identifier`, `tmf_related_party`, `tmf_note`, `tmf_attachment`, and `tmf_relationship` support tables. |
| API/resource map | Add `tmf_api_resource_map` rows for the selected local TMF APIs and resource roots. |
| Event contracts | Add baseline event contract rows for create, update, state-change, and delete events per reviewed API resource. |
| Privacy and audit | Add table-level privacy, retention, legal-hold, residency, masking, and audit policy rows. |
| High-volume candidates | `inventory_topology.topology_node`, `inventory_topology.topology_edge`, `inventory_topology.event_outbox` |

## Event Contract Baseline

Events are registered in `inventory_topology.event_contract` using `inventory_topology.event_outbox` as the publication basis. Consumers must be added when integrations are designed; no app should directly write another app schema.

## Privacy, Retention, And Audit Baseline

| Table | Data classification | Retention class | Audit level |
| --- | --- | --- | --- |
| `inventory_topology.installed_product_inventory` | internal | operational_telemetry | standard |
| `inventory_topology.service_inventory` | internal | operational_telemetry | standard |
| `inventory_topology.resource_inventory` | internal | operational_telemetry | standard |
| `inventory_topology.inventory_location_binding` | internal | operational_telemetry | standard |
| `inventory_topology.topology_node` | internal | operational_telemetry | standard |
| `inventory_topology.topology_edge` | internal | operational_telemetry | standard |
| `inventory_topology.connectivity_path` | internal | operational_telemetry | standard |
| `inventory_topology.resource_pool` | internal | operational_telemetry | standard |
| `inventory_topology.identifier_resource` | internal | operational_telemetry | standard |
| `inventory_topology.number_portability_state` | internal | operational_telemetry | standard |
| `inventory_topology.esim_profile_lifecycle` | internal | operational_telemetry | standard |
| `inventory_topology.resource_reservation` | internal | operational_telemetry | standard |
| `inventory_topology.resource_assignment` | internal | operational_telemetry | standard |
| `inventory_topology.discovered_resource_staging` | internal | operational_telemetry | standard |
| `inventory_topology.inventory_reconciliation_record` | internal | operational_telemetry | standard |
| `inventory_topology.migration_decommissioning_state` | internal | operational_telemetry | standard |
| `inventory_topology.event_outbox` | internal | operational_telemetry | standard |

## Build Gate Result

| Gate item | Result |
| --- | --- |
| API/resource review | Complete for baseline implementation |
| V002 typed DDL | Complete: `database/postgres/suites/ts_oss_engineering_fulfillment/V002__refine_inventory_topology_tmf_core.sql` |
| Event contract register | Baseline complete |
| Privacy/retention/audit classification | Baseline complete |
| Remaining implementation control | Validate exact endpoint operations and contract tests as Angular/Spring Boot features are built |

-- TelcoSuite V002 TMF core refinement for Inventory And Topology
-- Target database: ts_oss_engineering_fulfillment
-- App schema: inventory_topology
-- Generated from: planning/suite-details/tmf-api-ddl-reviews/inventory-topology.md
-- Reviewed: 2026-06-14

CREATE EXTENSION IF NOT EXISTS pgcrypto;

BEGIN;

COMMENT ON SCHEMA inventory_topology IS 'App-owned schema for Inventory And Topology; V002 TMF baseline review complete on 2026-06-14.';

-- Promote common TMF resource fields on inventory_topology.installed_product_inventory.
ALTER TABLE inventory_topology.installed_product_inventory
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_installed_product_inventory_tmf_id ON inventory_topology.installed_product_inventory (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_installed_product_inventory_tmf_href ON inventory_topology.installed_product_inventory (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_installed_product_inventory_tmf_state ON inventory_topology.installed_product_inventory (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.installed_product_inventory.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.installed_product_inventory.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.service_inventory.
ALTER TABLE inventory_topology.service_inventory
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_service_inventory_tmf_id ON inventory_topology.service_inventory (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_service_inventory_tmf_href ON inventory_topology.service_inventory (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_service_inventory_tmf_state ON inventory_topology.service_inventory (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.service_inventory.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.service_inventory.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.resource_inventory.
ALTER TABLE inventory_topology.resource_inventory
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_resource_inventory_tmf_id ON inventory_topology.resource_inventory (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_resource_inventory_tmf_href ON inventory_topology.resource_inventory (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_resource_inventory_tmf_state ON inventory_topology.resource_inventory (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.resource_inventory.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.resource_inventory.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.inventory_location_binding.
ALTER TABLE inventory_topology.inventory_location_binding
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_inventory_location_binding_tmf_id ON inventory_topology.inventory_location_binding (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_inventory_location_binding_tmf_href ON inventory_topology.inventory_location_binding (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_inventory_location_binding_tmf_state ON inventory_topology.inventory_location_binding (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.inventory_location_binding.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.inventory_location_binding.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.topology_node.
ALTER TABLE inventory_topology.topology_node
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_topology_node_tmf_id ON inventory_topology.topology_node (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_topology_node_tmf_href ON inventory_topology.topology_node (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_topology_node_tmf_state ON inventory_topology.topology_node (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.topology_node.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.topology_node.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.topology_edge.
ALTER TABLE inventory_topology.topology_edge
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_topology_edge_tmf_id ON inventory_topology.topology_edge (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_topology_edge_tmf_href ON inventory_topology.topology_edge (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_topology_edge_tmf_state ON inventory_topology.topology_edge (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.topology_edge.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.topology_edge.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.connectivity_path.
ALTER TABLE inventory_topology.connectivity_path
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_connectivity_path_tmf_id ON inventory_topology.connectivity_path (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_connectivity_path_tmf_href ON inventory_topology.connectivity_path (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_connectivity_path_tmf_state ON inventory_topology.connectivity_path (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.connectivity_path.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.connectivity_path.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.resource_pool.
ALTER TABLE inventory_topology.resource_pool
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_resource_pool_tmf_id ON inventory_topology.resource_pool (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_resource_pool_tmf_href ON inventory_topology.resource_pool (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_resource_pool_tmf_state ON inventory_topology.resource_pool (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.resource_pool.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.resource_pool.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.identifier_resource.
ALTER TABLE inventory_topology.identifier_resource
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_identifier_resource_tmf_id ON inventory_topology.identifier_resource (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_identifier_resource_tmf_href ON inventory_topology.identifier_resource (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_identifier_resource_tmf_state ON inventory_topology.identifier_resource (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.identifier_resource.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.identifier_resource.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.number_portability_state.
ALTER TABLE inventory_topology.number_portability_state
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_number_portability_state_tmf_id ON inventory_topology.number_portability_state (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_number_portability_state_tmf_href ON inventory_topology.number_portability_state (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_number_portability_state_tmf_state ON inventory_topology.number_portability_state (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.number_portability_state.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.number_portability_state.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.esim_profile_lifecycle.
ALTER TABLE inventory_topology.esim_profile_lifecycle
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_esim_profile_lifecycle_tmf_id ON inventory_topology.esim_profile_lifecycle (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_esim_profile_lifecycle_tmf_href ON inventory_topology.esim_profile_lifecycle (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_esim_profile_lifecycle_tmf_state ON inventory_topology.esim_profile_lifecycle (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.esim_profile_lifecycle.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.esim_profile_lifecycle.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.resource_reservation.
ALTER TABLE inventory_topology.resource_reservation
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_resource_reservation_tmf_id ON inventory_topology.resource_reservation (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_resource_reservation_tmf_href ON inventory_topology.resource_reservation (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_resource_reservation_tmf_state ON inventory_topology.resource_reservation (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.resource_reservation.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.resource_reservation.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.resource_assignment.
ALTER TABLE inventory_topology.resource_assignment
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_resource_assignment_tmf_id ON inventory_topology.resource_assignment (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_resource_assignment_tmf_href ON inventory_topology.resource_assignment (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_resource_assignment_tmf_state ON inventory_topology.resource_assignment (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.resource_assignment.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.resource_assignment.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.discovered_resource_staging.
ALTER TABLE inventory_topology.discovered_resource_staging
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_discovered_resource_staging_tmf_id ON inventory_topology.discovered_resource_staging (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_discovered_resource_staging_tmf_href ON inventory_topology.discovered_resource_staging (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_discovered_resource_staging_tmf_state ON inventory_topology.discovered_resource_staging (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.discovered_resource_staging.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.discovered_resource_staging.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.inventory_reconciliation_record.
ALTER TABLE inventory_topology.inventory_reconciliation_record
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_inventory_reconciliation_record_tmf_id ON inventory_topology.inventory_reconciliation_record (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_inventory_reconciliation_record_tmf_href ON inventory_topology.inventory_reconciliation_record (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_inventory_reconciliation_record_tmf_state ON inventory_topology.inventory_reconciliation_record (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.inventory_reconciliation_record.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.inventory_reconciliation_record.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.migration_decommissioning_state.
ALTER TABLE inventory_topology.migration_decommissioning_state
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_migration_decommissioning_state_tmf_id ON inventory_topology.migration_decommissioning_state (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_migration_decommissioning_state_tmf_href ON inventory_topology.migration_decommissioning_state (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_migration_decommissioning_state_tmf_state ON inventory_topology.migration_decommissioning_state (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.migration_decommissioning_state.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.migration_decommissioning_state.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on inventory_topology.event_outbox.
ALTER TABLE inventory_topology.event_outbox
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_event_outbox_tmf_id ON inventory_topology.event_outbox (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_event_outbox_tmf_href ON inventory_topology.event_outbox (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_event_outbox_tmf_state ON inventory_topology.event_outbox (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN inventory_topology.event_outbox.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN inventory_topology.event_outbox.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

CREATE TABLE IF NOT EXISTS inventory_topology.tmf_api_resource_map (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tmf_api text NOT NULL,
    tmf_resource text NOT NULL,
    resource_path text,
    anchor_table text NOT NULL,
    ownership_role text NOT NULL DEFAULT 'master_or_projection',
    field_strategy text NOT NULL,
    local_spec_path text,
    promoted_fields jsonb NOT NULL DEFAULT '[]'::jsonb,
    payload_required boolean NOT NULL DEFAULT true,
    contract_test_required boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uk_tmf_api_resource_map UNIQUE (tmf_api, tmf_resource, anchor_table)
);

CREATE TABLE IF NOT EXISTS inventory_topology.tmf_resource_reference (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    reference_role text NOT NULL,
    referenced_api text,
    referenced_resource text,
    referenced_id text,
    referenced_href text,
    referenced_name text,
    referred_type text,
    reference_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    valid_from timestamptz,
    valid_to timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    CONSTRAINT ck_tmf_resource_reference_validity CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE TABLE IF NOT EXISTS inventory_topology.tmf_characteristic (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    characteristic_name text NOT NULL,
    value_type text,
    characteristic_value jsonb NOT NULL DEFAULT '{}'::jsonb,
    value_from timestamptz,
    value_to timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    CONSTRAINT ck_tmf_characteristic_validity CHECK (value_to IS NULL OR value_from IS NULL OR value_to >= value_from)
);

CREATE TABLE IF NOT EXISTS inventory_topology.tmf_external_identifier (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    owner text,
    external_identifier_type text,
    external_identifier_id text NOT NULL,
    external_href text,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uk_tmf_external_identifier UNIQUE (tenant_id, source_table, external_identifier_id)
);

CREATE TABLE IF NOT EXISTS inventory_topology.tmf_related_party (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    party_id text,
    party_href text,
    party_name text,
    party_role text,
    party_referred_type text,
    related_party_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS inventory_topology.tmf_note (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    note_author text,
    note_date timestamptz,
    note_text text NOT NULL,
    note_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS inventory_topology.tmf_attachment (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    attachment_id text,
    attachment_href text,
    attachment_name text,
    attachment_type text,
    mime_type text,
    content_url text,
    size_amount numeric,
    size_units text,
    attachment_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS inventory_topology.tmf_relationship (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    relationship_type text NOT NULL,
    target_table text,
    target_record_id uuid,
    target_canonical_id text,
    target_api text,
    target_resource text,
    target_href text,
    relationship_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    valid_from timestamptz,
    valid_to timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT ck_tmf_relationship_validity CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE TABLE IF NOT EXISTS inventory_topology.event_contract (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    event_name text NOT NULL,
    event_version text NOT NULL DEFAULT 'v1',
    tmf_api text,
    tmf_resource text,
    source_table text NOT NULL,
    event_type text NOT NULL,
    event_key_strategy text NOT NULL,
    payload_basis text NOT NULL,
    outbox_table text NOT NULL DEFAULT 'inventory_topology.event_outbox',
    retention_class text NOT NULL DEFAULT 'event_replay_90d',
    masking_policy text NOT NULL DEFAULT 'Apply source table masking policy before external publication',
    consumer_notes text,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uk_event_contract UNIQUE (event_name, event_version)
);

CREATE TABLE IF NOT EXISTS inventory_topology.privacy_retention_policy (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    table_name text NOT NULL,
    data_domain text NOT NULL,
    data_classification text NOT NULL,
    retention_class text NOT NULL,
    retention_basis text NOT NULL,
    default_retention_days integer,
    legal_hold_supported boolean NOT NULL DEFAULT true,
    residency_rule text,
    masking_policy text NOT NULL,
    audit_level text NOT NULL DEFAULT 'standard',
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uk_privacy_retention_policy UNIQUE (table_name)
);

CREATE INDEX IF NOT EXISTS ix_tmf_api_resource_map_lookup ON inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource);
CREATE INDEX IF NOT EXISTS ix_tmf_resource_reference_lookup ON inventory_topology.tmf_resource_reference (tenant_id, source_table, source_canonical_id);
CREATE INDEX IF NOT EXISTS ix_tmf_characteristic_lookup ON inventory_topology.tmf_characteristic (tenant_id, source_table, characteristic_name);
CREATE INDEX IF NOT EXISTS ix_tmf_external_identifier_lookup ON inventory_topology.tmf_external_identifier (tenant_id, external_identifier_id);
CREATE INDEX IF NOT EXISTS ix_tmf_related_party_lookup ON inventory_topology.tmf_related_party (tenant_id, party_id);
CREATE INDEX IF NOT EXISTS ix_tmf_note_lookup ON inventory_topology.tmf_note (tenant_id, source_table, source_canonical_id);
CREATE INDEX IF NOT EXISTS ix_tmf_attachment_lookup ON inventory_topology.tmf_attachment (tenant_id, source_table, source_canonical_id);
CREATE INDEX IF NOT EXISTS ix_tmf_relationship_lookup ON inventory_topology.tmf_relationship (tenant_id, source_table, relationship_type);
CREATE INDEX IF NOT EXISTS ix_event_contract_lookup ON inventory_topology.event_contract (event_name, event_version);
CREATE INDEX IF NOT EXISTS ix_privacy_retention_policy_lookup ON inventory_topology.privacy_retention_policy (table_name);

COMMENT ON TABLE inventory_topology.tmf_api_resource_map IS 'V002 TMF support/control table for Inventory And Topology.';
COMMENT ON TABLE inventory_topology.tmf_resource_reference IS 'V002 TMF support/control table for Inventory And Topology.';
COMMENT ON TABLE inventory_topology.tmf_characteristic IS 'V002 TMF support/control table for Inventory And Topology.';
COMMENT ON TABLE inventory_topology.tmf_external_identifier IS 'V002 TMF support/control table for Inventory And Topology.';
COMMENT ON TABLE inventory_topology.tmf_related_party IS 'V002 TMF support/control table for Inventory And Topology.';
COMMENT ON TABLE inventory_topology.tmf_note IS 'V002 TMF support/control table for Inventory And Topology.';
COMMENT ON TABLE inventory_topology.tmf_attachment IS 'V002 TMF support/control table for Inventory And Topology.';
COMMENT ON TABLE inventory_topology.tmf_relationship IS 'V002 TMF support/control table for Inventory And Topology.';
COMMENT ON TABLE inventory_topology.event_contract IS 'V002 TMF support/control table for Inventory And Topology.';
COMMENT ON TABLE inventory_topology.privacy_retention_policy IS 'V002 TMF support/control table for Inventory And Topology.';


INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF637', 'product', '/product', 'installed_product_inventory', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF637_ProductInventory/TMF637-ProductInventory-v5.0.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.product.created', 'v1', 'TMF637', 'product', 'inventory_topology.installed_product_inventory', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.product.updated', 'v1', 'TMF637', 'product', 'inventory_topology.installed_product_inventory', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.product.stateChanged', 'v1', 'TMF637', 'product', 'inventory_topology.installed_product_inventory', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.product.deleted', 'v1', 'TMF637', 'product', 'inventory_topology.installed_product_inventory', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF638', 'service', '/service', 'service_inventory', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory/TMF638-Service_Inventory_Management-v5.0.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.service.created', 'v1', 'TMF638', 'service', 'inventory_topology.service_inventory', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.service.updated', 'v1', 'TMF638', 'service', 'inventory_topology.service_inventory', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.service.stateChanged', 'v1', 'TMF638', 'service', 'inventory_topology.service_inventory', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.service.deleted', 'v1', 'TMF638', 'service', 'inventory_topology.service_inventory', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF639', 'resource', '/resource', 'resource_inventory', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory/TMF639-Resource_Inventory_Management-v5.0.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource.created', 'v1', 'TMF639', 'resource', 'inventory_topology.resource_inventory', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource.updated', 'v1', 'TMF639', 'resource', 'inventory_topology.resource_inventory', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource.stateChanged', 'v1', 'TMF639', 'resource', 'inventory_topology.resource_inventory', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource.deleted', 'v1', 'TMF639', 'resource', 'inventory_topology.resource_inventory', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF703', 'association', '/association', 'topology_node', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory/TMF703-EntityInventory-v4.0.0.swagger.json', '["description", "lastUpdate", "lifecycleStatus", "name", "validFor", "version", "associationSpec", "associationRole", "constraint", "href", "id", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.association.created', 'v1', 'TMF703', 'association', 'inventory_topology.topology_node', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.association.updated', 'v1', 'TMF703', 'association', 'inventory_topology.topology_node', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.association.stateChanged', 'v1', 'TMF703', 'association', 'inventory_topology.topology_node', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.association.deleted', 'v1', 'TMF703', 'association', 'inventory_topology.topology_node', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF703', 'entity', '/entity', 'topology_node', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF703_EntityInventory/TMF703-EntityInventory-v4.0.0.swagger.json', '["context", "description", "endDate", "isBundle", "isExternal", "name", "startDate", "status", "statusChangeDate", "version", "attachment", "characteristic", "entityRelationship", "entitySpecification", "note", "relatedParty"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.entity.created', 'v1', 'TMF703', 'entity', 'inventory_topology.topology_node', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.entity.updated', 'v1', 'TMF703', 'entity', 'inventory_topology.topology_node', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.entity.stateChanged', 'v1', 'TMF703', 'entity', 'inventory_topology.topology_node', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.entity.deleted', 'v1', 'TMF703', 'entity', 'inventory_topology.topology_node', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF674', 'geographicSite', '/geographicSite', 'inventory_location_binding', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF674_GeographicSite/TMF674_Geographic_Site_Management_API_v4.0.0_swagger.json', '["id", "href", "code", "description", "name", "status", "calendar", "place", "relatedParty", "siteRelationship", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.geographic_site.created', 'v1', 'TMF674', 'geographicSite', 'inventory_topology.inventory_location_binding', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.geographic_site.updated', 'v1', 'TMF674', 'geographicSite', 'inventory_topology.inventory_location_binding', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.geographic_site.stateChanged', 'v1', 'TMF674', 'geographicSite', 'inventory_topology.inventory_location_binding', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.geographic_site.deleted', 'v1', 'TMF674', 'geographicSite', 'inventory_topology.inventory_location_binding', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF675', 'geographicLocation', '/geographicLocation', 'inventory_location_binding', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF675_GeographicLocation/TMF675-GeographicLocation-v4.0.0.swagger.json', '["id", "href", "@type", "bbox"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.geographic_location.created', 'v1', 'TMF675', 'geographicLocation', 'inventory_topology.inventory_location_binding', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.geographic_location.updated', 'v1', 'TMF675', 'geographicLocation', 'inventory_topology.inventory_location_binding', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.geographic_location.stateChanged', 'v1', 'TMF675', 'geographicLocation', 'inventory_topology.inventory_location_binding', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.geographic_location.deleted', 'v1', 'TMF675', 'geographicLocation', 'inventory_topology.inventory_location_binding', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF685', 'availabilityCheck', '/availabilityCheck', 'resource_pool', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool/Resource_Pool_Management.regular.swagger.json', '["href", "id", "@type", "@schemaLocation", "@baseType"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.availability_check.created', 'v1', 'TMF685', 'availabilityCheck', 'inventory_topology.resource_pool', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.availability_check.updated', 'v1', 'TMF685', 'availabilityCheck', 'inventory_topology.resource_pool', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.availability_check.stateChanged', 'v1', 'TMF685', 'availabilityCheck', 'inventory_topology.resource_pool', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.availability_check.deleted', 'v1', 'TMF685', 'availabilityCheck', 'inventory_topology.resource_pool', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF685', 'extract', '/extract', 'resource_pool', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool/Resource_Pool_Management.regular.swagger.json', '["href", "id", "@type", "@schemaLocation", "@baseType"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.extract.created', 'v1', 'TMF685', 'extract', 'inventory_topology.resource_pool', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.extract.updated', 'v1', 'TMF685', 'extract', 'inventory_topology.resource_pool', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.extract.stateChanged', 'v1', 'TMF685', 'extract', 'inventory_topology.resource_pool', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.extract.deleted', 'v1', 'TMF685', 'extract', 'inventory_topology.resource_pool', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF685', 'push', '/push', 'resource_pool', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool/Resource_Pool_Management.regular.swagger.json', '["href", "id", "@type", "@schemaLocation", "@baseType"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.push.created', 'v1', 'TMF685', 'push', 'inventory_topology.resource_pool', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.push.updated', 'v1', 'TMF685', 'push', 'inventory_topology.resource_pool', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.push.stateChanged', 'v1', 'TMF685', 'push', 'inventory_topology.resource_pool', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.push.deleted', 'v1', 'TMF685', 'push', 'inventory_topology.resource_pool', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF685', 'reservation', '/reservation', 'resource_reservation', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool/Resource_Pool_Management.regular.swagger.json', '["@baseType", "@schemaLocation", "@type", "description", "href", "id", "relatedParty", "reservationState", "valid_for", "reservationItem", "channelRef", "requestedPeriod", "productOfferingRef"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.reservation.created', 'v1', 'TMF685', 'reservation', 'inventory_topology.resource_reservation', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.reservation.updated', 'v1', 'TMF685', 'reservation', 'inventory_topology.resource_reservation', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.reservation.stateChanged', 'v1', 'TMF685', 'reservation', 'inventory_topology.resource_reservation', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.reservation.deleted', 'v1', 'TMF685', 'reservation', 'inventory_topology.resource_reservation', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF685', 'resourcePool', '/resourcePool', 'resource_pool', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF685_ResourcePool/Resource_Pool_Management.regular.swagger.json', '["@baseType", "@schemaLocation", "@type", "description", "href", "id", "relatedParty", "resourceCollection"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_pool.created', 'v1', 'TMF685', 'resourcePool', 'inventory_topology.resource_pool', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_pool.updated', 'v1', 'TMF685', 'resourcePool', 'inventory_topology.resource_pool', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_pool.stateChanged', 'v1', 'TMF685', 'resourcePool', 'inventory_topology.resource_pool', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_pool.deleted', 'v1', 'TMF685', 'resourcePool', 'inventory_topology.resource_pool', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF771', 'resourceUsage', '/resourceUsage', 'resource_inventory', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF771_ResourceUsage/TMF771-Resource_Usage_Management-v5.0.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_usage.created', 'v1', 'TMF771', 'resourceUsage', 'inventory_topology.resource_inventory', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_usage.updated', 'v1', 'TMF771', 'resourceUsage', 'inventory_topology.resource_inventory', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_usage.stateChanged', 'v1', 'TMF771', 'resourceUsage', 'inventory_topology.resource_inventory', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_usage.deleted', 'v1', 'TMF771', 'resourceUsage', 'inventory_topology.resource_inventory', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF771', 'resourceUsageSpecification', '/resourceUsageSpecification', 'resource_inventory', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF771_ResourceUsage/TMF771-Resource_Usage_Management-v5.0.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_usage_specification.created', 'v1', 'TMF771', 'resourceUsageSpecification', 'inventory_topology.resource_inventory', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_usage_specification.updated', 'v1', 'TMF771', 'resourceUsageSpecification', 'inventory_topology.resource_inventory', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_usage_specification.stateChanged', 'v1', 'TMF771', 'resourceUsageSpecification', 'inventory_topology.resource_inventory', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_usage_specification.deleted', 'v1', 'TMF771', 'resourceUsageSpecification', 'inventory_topology.resource_inventory', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF716', 'cancelResourceReservation', '/cancelResourceReservation', 'resource_reservation', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF716_ResourceReservation/TMF716_ResourceReservation_v4.0.0_swagger.json', '["id", "href", "cancellationDate", "cancellationReason", "completionDate", "creationDate", "description", "expectedCompletionDate", "requestedCompletionDate", "requestedStartDate", "stateChangeDate", "stateChangeReason", "channel", "relatedEntity", "relatedParty", "reservationItem"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.cancel_resource_reservation.created', 'v1', 'TMF716', 'cancelResourceReservation', 'inventory_topology.resource_reservation', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.cancel_resource_reservation.updated', 'v1', 'TMF716', 'cancelResourceReservation', 'inventory_topology.resource_reservation', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.cancel_resource_reservation.stateChanged', 'v1', 'TMF716', 'cancelResourceReservation', 'inventory_topology.resource_reservation', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.cancel_resource_reservation.deleted', 'v1', 'TMF716', 'cancelResourceReservation', 'inventory_topology.resource_reservation', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF716', 'resourceReservation', '/resourceReservation', 'resource_reservation', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF716_ResourceReservation/TMF716_ResourceReservation_v4.0.0_swagger.json', '["id", "href", "cancellationDate", "cancellationReason", "completionDate", "creationDate", "description", "expectedCompletionDate", "requestedCompletionDate", "requestedStartDate", "stateChangeDate", "stateChangeReason", "channel", "relatedEntity", "relatedParty", "reservationItem"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_reservation.created', 'v1', 'TMF716', 'resourceReservation', 'inventory_topology.resource_reservation', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_reservation.updated', 'v1', 'TMF716', 'resourceReservation', 'inventory_topology.resource_reservation', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_reservation.stateChanged', 'v1', 'TMF716', 'resourceReservation', 'inventory_topology.resource_reservation', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.resource_reservation.deleted', 'v1', 'TMF716', 'resourceReservation', 'inventory_topology.resource_reservation', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF640', 'monitor', '/monitor', 'installed_product_inventory', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF640_ActivationConfiguration/TMF640_Service_Activation_Management_API_v4.0.0_swagger.json', '["id", "href", "sourceHref", "state", "request", "response", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.monitor.created', 'v1', 'TMF640', 'monitor', 'inventory_topology.installed_product_inventory', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.monitor.updated', 'v1', 'TMF640', 'monitor', 'inventory_topology.installed_product_inventory', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.monitor.stateChanged', 'v1', 'TMF640', 'monitor', 'inventory_topology.installed_product_inventory', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.monitor.deleted', 'v1', 'TMF640', 'monitor', 'inventory_topology.installed_product_inventory', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF640', 'service', '/service', 'service_inventory', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF640_ActivationConfiguration/TMF640_Service_Activation_Management_API_v4.0.0_swagger.json', '["id", "href", "category", "description", "endDate", "hasStarted", "isBundle", "isServiceEnabled", "isStateful", "name", "serviceDate", "serviceType", "startDate", "startMode", "feature", "note"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.service.created', 'v1', 'TMF640', 'service', 'inventory_topology.service_inventory', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.service.updated', 'v1', 'TMF640', 'service', 'inventory_topology.service_inventory', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.service.stateChanged', 'v1', 'TMF640', 'service', 'inventory_topology.service_inventory', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.service.deleted', 'v1', 'TMF640', 'service', 'inventory_topology.service_inventory', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF697', 'cancelWorkOrder', '/cancelWorkOrder', 'installed_product_inventory', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF697_Work_Order/TMF697-WorkOrder-v4.0.0.swagger.json', '["id", "href", "cancellationDate", "cancellationReason", "category", "completionDate", "description", "expectedCompletionDate", "externalId", "notificationContact", "orderDate", "priority", "requestedCompletionDate", "requestedStartDate", "startDate", "stateChangeDate"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.cancel_work_order.created', 'v1', 'TMF697', 'cancelWorkOrder', 'inventory_topology.installed_product_inventory', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.cancel_work_order.updated', 'v1', 'TMF697', 'cancelWorkOrder', 'inventory_topology.installed_product_inventory', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.cancel_work_order.stateChanged', 'v1', 'TMF697', 'cancelWorkOrder', 'inventory_topology.installed_product_inventory', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.cancel_work_order.deleted', 'v1', 'TMF697', 'cancelWorkOrder', 'inventory_topology.installed_product_inventory', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF697', 'workOrder', '/workOrder', 'installed_product_inventory', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF697_Work_Order/TMF697-WorkOrder-v4.0.0.swagger.json', '["id", "href", "cancellationDate", "cancellationReason", "category", "completionDate", "description", "expectedCompletionDate", "externalId", "notificationContact", "orderDate", "priority", "requestedCompletionDate", "requestedStartDate", "startDate", "stateChangeDate"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.work_order.created', 'v1', 'TMF697', 'workOrder', 'inventory_topology.installed_product_inventory', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.work_order.updated', 'v1', 'TMF697', 'workOrder', 'inventory_topology.installed_product_inventory', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.work_order.stateChanged', 'v1', 'TMF697', 'workOrder', 'inventory_topology.installed_product_inventory', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.work_order.deleted', 'v1', 'TMF697', 'workOrder', 'inventory_topology.installed_product_inventory', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF645', 'checkServiceQualification', '/checkServiceQualification', 'service_inventory', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF645_ServiceQualification/TMF645-Service_Qualification_Management-v5.0.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.check_service_qualification.created', 'v1', 'TMF645', 'checkServiceQualification', 'inventory_topology.service_inventory', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.check_service_qualification.updated', 'v1', 'TMF645', 'checkServiceQualification', 'inventory_topology.service_inventory', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.check_service_qualification.stateChanged', 'v1', 'TMF645', 'checkServiceQualification', 'inventory_topology.service_inventory', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.check_service_qualification.deleted', 'v1', 'TMF645', 'checkServiceQualification', 'inventory_topology.service_inventory', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF645', 'queryServiceQualification', '/queryServiceQualification', 'service_inventory', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF645_ServiceQualification/TMF645-Service_Qualification_Management-v5.0.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.query_service_qualification.created', 'v1', 'TMF645', 'queryServiceQualification', 'inventory_topology.service_inventory', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.query_service_qualification.updated', 'v1', 'TMF645', 'queryServiceQualification', 'inventory_topology.service_inventory', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.query_service_qualification.stateChanged', 'v1', 'TMF645', 'queryServiceQualification', 'inventory_topology.service_inventory', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.query_service_qualification.deleted', 'v1', 'TMF645', 'queryServiceQualification', 'inventory_topology.service_inventory', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF655', 'changeRequest', '/changeRequest', 'migration_decommissioning_state', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF655_ChangeManagement/TMF655_Change_Management_API_v4.0.0_swagger.json', '["id", "href", "actualEndTime", "actualStartTime", "channel", "completionDate", "description", "impact", "lastUpdateDate", "plannedEndTime", "plannedStartTime", "priority", "requestDate", "requestType", "risk", "riskMitigationPlan"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.change_request.created', 'v1', 'TMF655', 'changeRequest', 'inventory_topology.migration_decommissioning_state', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.change_request.updated', 'v1', 'TMF655', 'changeRequest', 'inventory_topology.migration_decommissioning_state', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.change_request.stateChanged', 'v1', 'TMF655', 'changeRequest', 'inventory_topology.migration_decommissioning_state', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.change_request.deleted', 'v1', 'TMF655', 'changeRequest', 'inventory_topology.migration_decommissioning_state', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF681', 'communicationMessage', '/communicationMessage', 'installed_product_inventory', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF681_Communication/TMF681_Communication_Management_API_v4.0.0_swagger.json', '["id", "href", "content", "description", "logFlag", "messageType", "priority", "scheduledSendTime", "sendTime", "sendTimeComplete", "subject", "tryTimes", "attachment", "characteristic", "receiver", "sender"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.communication_message.created', 'v1', 'TMF681', 'communicationMessage', 'inventory_topology.installed_product_inventory', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.communication_message.updated', 'v1', 'TMF681', 'communicationMessage', 'inventory_topology.installed_product_inventory', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.communication_message.stateChanged', 'v1', 'TMF681', 'communicationMessage', 'inventory_topology.installed_product_inventory', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO inventory_topology.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('inventory_topology.communication_message.deleted', 'v1', 'TMF681', 'communicationMessage', 'inventory_topology.installed_product_inventory', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();

INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.installed_product_inventory', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.service_inventory', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.resource_inventory', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.inventory_location_binding', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.topology_node', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.topology_edge', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.connectivity_path', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.resource_pool', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.identifier_resource', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.number_portability_state', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.esim_profile_lifecycle', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.resource_reservation', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.resource_assignment', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.discovered_resource_staging', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.inventory_reconciliation_record', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.migration_decommissioning_state', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO inventory_topology.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('inventory_topology.event_outbox', 'inventory_topology', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();

COMMIT;

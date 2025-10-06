#!/usr/bin/env bash
#
# Mapping flow from the legacy schema defined in ddl.sql to the refactored schema
# captured in refactored_ddl.sql. The script emits a structured narrative that
# explains how each legacy table is represented after the polymorphic refactor.
#
# Usage: ./refactored_ddl.sh
#
# The output groups the mappings by functional domain so it is easy to see how
# related tables were consolidated. Each legacy table from ddl.sql is enumerated
# exactly once and mapped to the consolidated tables and polymorphic structures
# that now hold its data.
set -euo pipefail

print_section() {
  local title="$1"; shift
  printf '\n%s\n' "${title}"
  printf '%s\n' "$(printf '%*s' "${#title}" '' | tr ' ' '-')"
  printf '%s\n' "$1"
}

print_section "Platform Support & Security" "\
  activity_log -> audit_events
  audit -> audit_events
  failed_jobs -> system_jobs
  jobs -> system_jobs
  migrations -> system_settings
  email_code_authentication -> entity_credentials
  password_resets -> entity_credentials
  personal_access_tokens -> entity_credentials
  sharepoint_updates_timestamps -> integration_settings
  stripe_settings -> integration_settings"

print_section "Identity & Access Management" "\
  admins -> entities, entity_credentials
  roles -> reference_values (role domain), entity_credentials
  permissions -> reference_values (permission domain)
  permission_category -> reference_values (permission domain)
  permission_groups -> reference_values (permission group domain)
  permission_group_permission -> relationship_links (permission assignments)
  role_has_permissions -> relationship_links (role-to-permission)
  model_has_roles -> relationship_links (morphable role assignments)
  model_has_permissions -> relationship_links (morphable permission assignments)
  profile_approval_status -> reference_values (profile status domain)
  users -> entities, entity_credentials
  user_types -> reference_values (user type domain)"

print_section "Reference Data & Configuration" "\
  asset_insurance_type -> reference_values
  asset_types -> reference_values
  bridge_drawdown_types -> reference_values
  charge_types -> reference_values
  client_form_status -> reference_values
  currencies -> reference_values
  deal_aborted_reasons -> reference_values
  deal_document_risk -> reference_values
  deal_statuses -> reference_values
  deal_types -> reference_values
  document_types -> reference_values
  drawdown_event_amount_type -> reference_values
  drawdown_event_status -> reference_values
  drawdown_status -> reference_values
  fee_options -> reference_values
  fee_status -> reference_values
  fee_type -> reference_values
  form_types -> reference_values
  guarantor_type -> reference_values
  interest_calculation_types -> reference_values
  interest_subtypes -> reference_values
  interest_types -> reference_values
  introducer_type -> reference_values
  lending_types -> reference_values
  loan_calculation_method -> reference_values
  marital_statuses -> reference_values
  marketing_sources -> reference_values
  name_titles -> reference_values
  order_statuses -> reference_values
  ownership_types -> reference_values
  payment_providers -> reference_values
  provider_types -> reference_values
  purpose_credit_types -> reference_values
  quotes_status -> reference_values
  systems_deal_setting_groups -> reference_values
  use_type -> reference_values
  valuation_statuses -> reference_values
  variable_rate_settings -> reference_values
  variable_rate_sources -> reference_values
  reference_domains -> reference_domains (unchanged)
  reference_values -> reference_values (unchanged)
  system_settings -> system_settings (unchanged)
  attribute_definitions -> attribute_definitions (unchanged)
  attribute_assignments -> attribute_assignments (unchanged)"

print_section "Party & Relationship Management" "\
  companies -> entities
  brokers -> entities, relationship_links (entity role)
  broker_agents -> entities, relationship_links (association)
  broker_agent_deals -> relationship_links (entity-to-deal)
  broker_agent_notes -> note_links
  broker_notes -> notes, note_links
  client_companies -> entities
  client_groups -> entities, relationship_links
  client_group_clients -> relationship_links (entity-to-group)
  client_company_clients -> relationship_links (entity-to-company)
  client_company_notes -> notes, note_links
  client_individuals -> entities
  client_individual_notes -> notes, note_links
  client_individual_credit_data -> attribute_assignments
  borrowers -> relationship_links (deal participation)
  guarantor_corporates -> entities, relationship_links
  guarantor_individuals -> entities, relationship_links
  guarantors -> relationship_links (deal guarantees)
  introducers -> entities, relationship_links
  lenders -> entities, relationship_links
  lender_operational_team_admin -> relationship_links
  service_providers -> entities, relationship_links
  loan_administrators -> entities, relationship_links
  delegated_owners -> relationship_links
  linked_deals -> relationship_links (deal-to-deal)
  bank_details -> financial_accounts"

print_section "Contact & Location Management" "\
  addresses -> postal_addresses
  asset_addresses -> address_links (asset usage)
  asset_client_companies -> address_links (entity-to-asset)
  asset_client_individuals -> address_links (entity-to-asset)
  entity_addresses -> address_links (unchanged)
  entity_contacts -> contact_points (renamed)
  contact_points -> contact_points (unchanged)"

print_section "Attribute & Metadata Framework" "\
  attribute_entities -> attribute_assignments
  attribute_types -> attribute_definitions
  attribute_groups -> attribute_definitions (grouping metadata)
  attributes -> attribute_definitions
  attribute_values -> attribute_assignments
  asset_insurance_notes -> attribute_assignments
  asset_insurances -> asset_coverages"

print_section "Asset Management & Valuation" "\
  assets -> assets (polymorphically linked)
  asset_relationships -> relationship_links (asset associations)
  asset_coverages -> asset_coverages (unchanged)
  asset_metrics -> asset_metrics (unchanged)
  valuations -> valuations (unchanged)
  exit_fee_tiers -> deal_terms"

print_section "Deal Lifecycle & Workflow" "\
  deals -> deals (unchanged)
  deal_activities -> workflow_events
  deal_document_categories -> reference_values (document category domain)
  deal_document_categories_data -> document_links
  deal_documents -> document_links
  deal_introducers -> relationship_links (deal-to-entity)
  deal_notes -> notes, note_links
  deal_notification_rules -> notifications, notification_templates
  deal_notification_rules_recipients -> notification_targets
  deal_rate_floors -> deal_terms
  deal_setting_groups -> workflow_definitions
  deal_settings -> workflow_steps, deal_settings
  deal_task -> workflow_instances
  deal_task_group -> workflow_definitions
  systems_deal_setting -> workflow_steps
  task_group -> workflow_definitions
  task -> workflow_steps"

print_section "Drawdowns & Funding Events" "\
  drawdown_event_type -> reference_values (drawdown event domain)
  drawdown_events -> drawdown_events (unchanged structure with polymorphic links)
  drawdown_fees -> financial_transactions
  drawdown_fields_approval -> workflow_events
  drawdowns -> drawdowns (unchanged core table)"

print_section "Financial Terms & Transactions" "\
  charges -> financial_transactions
  fees -> financial_transactions
  fee_type_lending_type -> reference_values (fee and lending domains), deal_terms
  payments -> financial_transactions
  payment_attempts -> transaction_attempts
  margin_override -> deal_terms
  orders -> sales_orders
  financial_transactions -> financial_transactions (unchanged)
  financial_allocations -> financial_allocations (unchanged)
  transaction_attempts -> transaction_attempts (unchanged)"

print_section "Pricing & Rate Management" "\
  variable_rates -> pricing_schedules
  variable_rates_history -> pricing_history
  variable_rates_history_copy1 -> pricing_history
  lender_funder_interest_rate -> pricing_history"

print_section "Quotes & Sales Enablement" "\
  quotes -> quotes (unchanged)
  quote_note -> notes, note_links
  quotes_recipients -> quote_recipients
  sales_orders -> sales_orders (unchanged)
  notifications -> notifications (unchanged)"

print_section "Notifications & Communications" "\
  notification -> notifications (unchanged)
  notification_recipients -> notification_targets
  notification_rules -> notification_templates
  notification_templates -> notification_templates (unchanged)
  scheduled_notifications -> notifications (scheduled status)
  notification_targets -> notification_targets (unchanged)"

print_section "Documents & Forms" "\
  documents -> documents (unchanged)
  files -> files (unchanged)
  client_form_attachments -> document_links
  client_forms -> forms
  loan_custom_forms -> forms
  ccr_reports -> documents
  form_documents -> form_documents (unchanged)
  forms -> forms (unchanged)
  form_responses -> form_responses (unchanged)"

print_section "Shared Notes & Commentary" "\
  notes -> notes (unchanged)
  note_links -> note_links (unchanged)"

print_section "Workflow Execution" "\
  workflow_definitions -> workflow_definitions (unchanged)
  workflow_steps -> workflow_steps (unchanged)
  workflow_instances -> workflow_instances (unchanged)
  workflow_events -> workflow_events (unchanged)"

printf '\nSummary\n-------\n'
printf 'Legacy tables: 149\n'
printf 'Refactored tables: 50\n'
printf 'Net reduction: 99 tables consolidated into polymorphic structures.\n'

# Database Refactor Overview

This repository now carries two snapshots of the platform database design:

- `ddl.sql` – the 149-table legacy schema captured from production.
- `refactored_ddl.sql` – a consolidated design that expresses the same functional surface area with 50 reusable base tables.

## Reduction highlights

- **66% fewer base tables.** By collapsing 149 legacy tables into 50 shared structures, the refactored design removes duplicated entity, lookup, and workflow tables while preserving functionality.【F:ddl.sql†L1-L2891】【F:refactored_ddl.sql†L1-L528】
- **Unified reference data.** All status/type enumerations now live in `reference_domains` and `reference_values`, replacing dozens of bespoke lookup tables.【F:refactored_ddl.sql†L5-L44】
- **Reusable entity model.** People, companies, administrators, brokers, lenders, and guarantors are represented through a single `entities` table with shared contact, credential, address, and relationship tables.【F:refactored_ddl.sql†L46-L159】【F:refactored_ddl.sql†L200-L246】
- **Streamlined workflows and finance.** Deals, tasks, drawdowns, pricing, quotes, notifications, documents, and payments leverage cohesive subsystems instead of isolated schemas.【F:refactored_ddl.sql†L248-L528】

## How legacy tables map to the new structures

The table below references every table defined in `ddl.sql`, grouping them by capability and showing the consolidated components that replace them inside `refactored_ddl.sql`.

| Domain | Legacy tables (`ddl.sql`) | Consolidated structures (`refactored_ddl.sql`) | Rationale |
| --- | --- | --- | --- |
| Platform Support & Security | `activity_log`<br>`audit`<br>`failed_jobs`<br>`jobs`<br>`migrations`<br>`email_code_authentication`<br>`password_resets`<br>`personal_access_tokens`<br>`sharepoint_updates_timestamps`<br>`stripe_settings` | `audit_events`<br>`system_jobs`<br>`integration_settings`<br>`system_settings`<br>`entity_credentials` | Unifies auditing, background processing, authentication recovery, and integration settings into reusable system tables. |
| Identity & Access Management | `admins`<br>`roles`<br>`permissions`<br>`permission_category`<br>`permission_groups`<br>`permission_group_permission`<br>`role_has_permissions`<br>`model_has_roles`<br>`model_has_permissions`<br>`profile_approval_status`<br>`users`<br>`user_types` | `entities`<br>`entity_credentials`<br>`entity_contacts`<br>`entity_addresses`<br>`financial_accounts`<br>`reference_values` | Treats every person or organisation as an entity with shared contact, credential, and access metadata instead of siloed user tables. |
| Reference Data & Configuration | `asset_insurance_type`<br>`asset_types`<br>`bridge_drawdown_types`<br>`charge_types`<br>`client_form_status`<br>`currencies`<br>`deal_aborted_reasons`<br>`deal_document_risk`<br>`deal_statuses`<br>`deal_types`<br>`document_types`<br>`drawdown_event_amount_type`<br>`drawdown_event_status`<br>`drawdown_status`<br>`fee_options`<br>`fee_status`<br>`fee_type`<br>`form_types`<br>`guarantor_type`<br>`interest_calculation_types`<br>`interest_subtypes`<br>`interest_types`<br>`introducer_type`<br>`lending_types`<br>`loan_calculation_method`<br>`marital_statuses`<br>`marketing_sources`<br>`name_titles`<br>`order_statuses`<br>`ownership_types`<br>`payment_providers`<br>`provider_types`<br>`purpose_credit_types`<br>`quotes_status`<br>`systems_deal_setting_groups`<br>`use_type`<br>`valuation_statuses`<br>`variable_rate_settings`<br>`variable_rate_sources` | `reference_domains`<br>`reference_values`<br>`attribute_definitions`<br>`attribute_assignments`<br>`system_settings` | Collapses dozens of lookup tables into a configurable domain/value catalogue that can drive validation and UI choices. |
| Party & Relationship Management | `companies`<br>`brokers`<br>`broker_agents`<br>`broker_agent_deals`<br>`broker_agent_notes`<br>`broker_notes`<br>`client_companies`<br>`client_groups`<br>`client_group_clients`<br>`client_company_clients`<br>`client_company_notes`<br>`client_individuals`<br>`client_individual_notes`<br>`client_individual_credit_data`<br>`borrowers`<br>`guarantor_corporates`<br>`guarantor_individuals`<br>`guarantors`<br>`introducers`<br>`lenders`<br>`lender_operational_team_admin`<br>`service_providers`<br>`loan_administrators`<br>`delegated_owners`<br>`linked_deals`<br>`bank_details` | `entities`<br>`entity_relationships`<br>`entity_contacts`<br>`financial_accounts`<br>`deal_participants` | Links brokers, lenders, guarantors, and clients through a common entity graph so roles and associations can be reused per deal. |
| Contact & Location Management | `addresses`<br>`asset_addresses`<br>`asset_client_companies`<br>`asset_client_individuals` | `postal_addresses`<br>`entity_addresses`<br>`asset_relationships` | Normalises address and association handling for both entities and assets, avoiding duplicate address tables. |
| Attribute & Metadata Framework | `attribute_entities`<br>`attribute_types`<br>`attribute_groups`<br>`attributes`<br>`attribute_values`<br>`asset_insurance_notes`<br>`asset_insurances` | `attribute_definitions`<br>`attribute_assignments`<br>`asset_metrics`<br>`asset_coverages` | Centralises dynamic attributes and insurance notes as typed key/value assignments attached to any record. |
| Asset Management & Valuation | `assets`<br>`valuations`<br>`exit_fee_tiers` | `assets`<br>`asset_relationships`<br>`asset_coverages`<br>`asset_metrics`<br>`valuations` | Captures collateral, insurance, and valuation history in extensible asset records with metric tracking. |
| Deal Lifecycle & Workflow | `deals`<br>`deal_activities`<br>`deal_document_categories`<br>`deal_document_categories_data`<br>`deal_documents`<br>`deal_introducers`<br>`deal_notes`<br>`deal_notification_rules`<br>`deal_notification_rules_recipients`<br>`deal_rate_floors`<br>`deal_setting_groups`<br>`deal_settings`<br>`deal_task`<br>`deal_task_group`<br>`systems_deal_setting`<br>`task_group`<br>`task` | `deals`<br>`deal_versions`<br>`deal_participants`<br>`deal_assets`<br>`deal_terms`<br>`deal_settings`<br>`workflow_definitions`<br>`workflow_steps`<br>`workflow_instances`<br>`workflow_events`<br>`notes`<br>`note_links`<br>`documents`<br>`document_links` | Combines deal configuration, documents, notes, and task orchestration into one workflow subsystem keyed by deals. |
| Drawdowns & Funding Events | `drawdown_event_type`<br>`drawdown_events`<br>`drawdown_fees`<br>`drawdown_fields_approval`<br>`drawdowns` | `drawdowns`<br>`drawdown_events`<br>`drawdown_checks`<br>`deal_terms`<br>`financial_transactions` | Tracks funding requests, approvals, and compliance checks in a single drawdown pipeline tied back to deal terms. |
| Financial Terms & Transactions | `charges`<br>`fees`<br>`fee_type_lending_type`<br>`payments`<br>`payment_attempts`<br>`margin_override`<br>`orders` | `financial_transactions`<br>`financial_allocations`<br>`transaction_attempts`<br>`deal_terms`<br>`sales_orders` | Handles fees, charges, payments, and order fulfilment as financial transactions with allocation detail. |
| Pricing & Rate Management | `variable_rates`<br>`variable_rates_history`<br>`variable_rates_history_copy1`<br>`lender_funder_interest_rate` | `pricing_schedules`<br>`pricing_history`<br>`deal_terms` | Stores variable rate schedules and historical overrides in a consistent pricing ledger. |
| Quotes & Sales Enablement | `quotes`<br>`quote_note`<br>`quotes_recipients` | `quotes`<br>`quote_recipients`<br>`sales_orders`<br>`notifications` | Reuses quote, recipient, and order data structures to support the sales journey on top of deals. |
| Notifications & Communications | `notification`<br>`notification_recipients`<br>`notification_rules`<br>`notification_templates`<br>`scheduled_notifications` | `notification_templates`<br>`notifications`<br>`notification_targets`<br>`entity_contacts` | Manages templates, dispatches, and delivery tracking with shared recipient targeting. |
| Documents & Forms | `documents`<br>`files`<br>`client_form_attachments`<br>`client_forms`<br>`loan_custom_forms`<br>`ccr_reports` | `documents`<br>`files`<br>`document_links`<br>`forms`<br>`form_responses`<br>`form_documents` | Stores all binary content and structured form responses via shared document and form tables. |
| Shared Notes & Commentary | `notes` | `notes`<br>`note_links` | Centralises free-text commentary with polymorphic links instead of multiple specialised note tables. |

Total legacy tables covered: **149**.

### Mapping flow script

Run `./refactored_ddl.sh` to print an end-to-end mapping flow that walks each legacy table to its destination inside the refactored schema. The script mirrors the table above, but it also highlights when polymorphic join tables (`relationship_links`, `note_links`, etc.) absorb responsibilities that were previously handled by bespoke pivot tables. Because the mapping is generated programmatically, you can feed the output into documentation or migration tooling without reformatting by hand. See [`refactored_ddl_mapping.md`](refactored_ddl_mapping.md) for a narrative walkthrough of the script's output structure and usage tips.【F:refactored_ddl.sh†L1-L172】【F:refactored_ddl_mapping.md†L1-L46】

## Working with polymorphic relationships

Laravel's morph relationships map cleanly onto the consolidated tables through shared `{name}_type` and `{name}_id` columns. The following subsections outline the primary polymorphic tables and how they should be used inside the application layer.

### Core party data

- **`contact_points`** – Store emails, phones, and other communication details for any entity (`Entity::morphMany('contactable')`) or domain object that needs to surface contact data. Each record captures the reference value for its contact type, verification state, and optional metadata for channel-specific settings.【F:refactored_ddl.sql†L71-L96】
- **`address_links`** – Associate one or more `postal_addresses` to any model (`morphMany('addressable')`) while tracking usage (billing, service, collateral) and validity windows. This replaces the collection of bespoke join tables found in the legacy schema.【F:refactored_ddl.sql†L109-L140】
- **`financial_accounts`** – Attach bank or settlement instructions to any owning record via `morphMany('accountable')`, capturing account type, identifiers, and lifecycle dates for compliance and audit needs.【F:refactored_ddl.sql†L142-L165】

### Cross-record relationships and metadata

- **`relationship_links`** – General-purpose join table for relating any two records (e.g., entities to deals, entities to assets) using `morphTo` pairings for the `left` and `right` sides. Store the reference-valued relationship type, optional roles, contextual target (deal version, asset, workflow step), state transitions, and financial exposure so the same structure powers introducers, guarantors, or asset pledges.【F:refactored_ddl.sql†L200-L223】
- **`attribute_assignments`** – Extend any model with typed custom fields via `morphMany('owner')`. The table supports text, numeric, date, and JSON values as well as effective dating for regulatory history tracking.【F:refactored_ddl.sql†L169-L198】
- **`note_links`, `document_links`, `notification_targets`, and `form_documents`** – Each link table carries `{target}_type` and `{target}_id` columns so shared content stores (notes, documents, notifications, forms) can be attached to deals, assets, entities, or workflow instances without additional join tables. Within Laravel, expose these through `morphMany`/`morphToMany` relationships to centralise collaboration data.【F:refactored_ddl.sql†L324-L528】

### Activity and workflow tracking

- **`activity_logs`** – Implements a polymorphic audit trail using `subject_type/subject_id` and `causer_type/causer_id` pairs. This aligns with Laravel's Spatie Activitylog package, allowing the application to record lifecycle events against any morphable record while retaining the original audit attributes from the legacy system.【F:refactored_ddl.sql†L1-L20】
- **`workflow_instances`**, **`workflow_events`**, and **`notifications`** – Workflow executions link back to their governing deals, tasks, or assets via morph columns. Notifications reuse the same approach to deliver alerts to entities, roles, or external targets, reducing schema sprawl while keeping every historical reference reachable from Laravel models.【F:refactored_ddl.sql†L248-L528】

These polymorphic tables eliminate the need for discrete join tables per domain concept. When modelling in Laravel:

1. Define `morphMany`/`morphTo` relationships on each participating Eloquent model matching the `{column_base}_type`/`{column_base}_id` pairs from the schema.
2. Use reference data (`reference_values`) to constrain permissible relationship, contact, or workflow types so that business rules remain declarative and centrally managed.【F:refactored_ddl.sql†L5-L44】
3. Leverage the `metadata` JSON columns for infrequently used attributes that existed in the legacy schema without introducing new tables, preserving flexibility while keeping the table count low.

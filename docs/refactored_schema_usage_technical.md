# Refactored Schema Usage Guide (Technical)

## Overview
The refactored schema replaces 149 legacy tables with 50 consolidated structures that embrace polymorphic patterns while preserving every functional data set, eliminating 99 bespoke tables in the process.【F:refactored_ddl.sh†L228-L231】 It is designed to centralise reusable concepts—reference data, parties, documents, workflows, finance events—so engineering teams can model new business capabilities by composing existing primitives instead of adding more bespoke join tables.

## Core building blocks

### Reference data system
`reference_domains` and `reference_values` provide a governed lookup registry for enumerations that previously lived in dozens of single-purpose tables. Each value is assigned to a domain and can carry metadata such as descriptions, ordering, and activity flags, enabling code-driven validation and UI rendering across modules.【F:refactored_ddl.sql†L33-L53】 All legacy lookup tables (e.g., `deal_statuses`, `fee_type`, `marital_statuses`) now converge here by assigning a domain per concept, removing redundant DDL while maintaining business semantics.【F:refactored_ddl.sh†L48-L92】

### Entity and credential model
`entities` captures both organisations and people with flexible naming, registration, and lifecycle attributes, while `entity_credentials` stores authentication and authorisation identifiers keyed back to the owning entity and credential type.【F:refactored_ddl.sql†L57-L95】 Legacy structures such as `admins`, `users`, and credential reset tables map into these polymorphic records so identity management is centralised.【F:refactored_ddl.sh†L34-L46】 Reference-value lookups drive status, type, and gender without specialised columns in each source table.

### Communication and location services
`contact_points` generalises phone, email, and messaging channels through `{contactable_type, contactable_id}` morph columns, letting any model publish communication details with primary and verification flags.【F:refactored_ddl.sql†L97-L115】 `postal_addresses` stores canonical addresses, while `address_links` binds addresses to any record with usage typing, primacy, and effective dating.【F:refactored_ddl.sql†L117-L155】 Legacy `entity_contacts`, `entity_addresses`, and asset address bridges now roll into these shared services, massively reducing duplication.【F:refactored_ddl.sh†L122-L129】【F:ddl.sql†L48-L63】

### Financial account catalogue
`financial_accounts` holds bank, escrow, and suspense accounts through polymorphic `{accountable_type, accountable_id}` pointers with enforced uniqueness on the account reference plus routing metadata.【F:refactored_ddl.sql†L157-L178】 The former `bank_details` table and any other account-specific artifacts migrate here, using reference-value account types to distinguish context.【F:refactored_ddl.sh†L94-L120】【F:ddl.sql†L124-L137】 Downstream payment and transaction modules link to these records via `financial_transactions` and `financial_allocations`.

### Attribute extension framework
`attribute_definitions` and `attribute_assignments` replace bespoke extension tables by storing metadata-driven definitions and polymorphic values (text, numeric, date, boolean) tied to any owner, complete with temporal validity.【F:refactored_ddl.sql†L180-L211】 Legacy tables such as `attribute_entities`, `attribute_values`, and client credit data transform into definition rows plus scoped assignments, ensuring strongly typed extensibility without schema bloat.【F:refactored_ddl.sh†L131-L138】

### Relationship fabric
`relationship_links` consolidates every association table by storing left/right morph pairs, relationship/role/status lookups, amounts, ratios, and time ranges.【F:refactored_ddl.sql†L229-L257】 Deal participants, guarantors, broker assignments, and cross-deal links all become specialised instances identified by reference domains, allowing you to add new relationship roles with reference data instead of DDL changes.【F:refactored_ddl.sh†L94-L120】

### Deal and workflow spine
Core deal tracking remains anchored on `deals`, `deal_versions`, `deal_terms`, and `deal_settings`, complemented by workflow automation tables (`workflow_definitions`, `workflow_steps`, `workflow_instances`, `workflow_events`).【F:refactored_ddl.sql†L285-L399】 Legacy scheduler structures (`deal_task`, `task_group`) are mapped into these workflow primitives, standardising lifecycle orchestration and enabling auditable automation metadata.【F:refactored_ddl.sh†L148-L165】

### Document, note, and notification services
Documents are normalised through `documents` and `files`, with polymorphic `document_links` attaching artefacts to any record while maintaining role metadata.【F:refactored_ddl.sql†L401-L447】 Notes leverage the same pattern via `notes` and `note_links` for cross-entity commentary.【F:refactored_ddl.sql†L448-L472】 Notification workflows use `notification_templates`, `notifications`, and `notification_targets` to manage multi-channel delivery with polymorphic recipients, replacing legacy rule and recipient bridges.【F:refactored_ddl.sql†L473-L520】【F:refactored_ddl.sh†L200-L205】

### Financial events and pricing
`financial_transactions`, `financial_allocations`, and `transaction_attempts` provide a unified ledger for charges, fees, payments, drawdown fees, and allocation breakdowns.【F:refactored_ddl.sql†L521-L566】 Pricing governance is delivered through `pricing_schedules` and `pricing_history`, capturing rate movements and lender contributions that previously lived in bespoke history tables.【F:refactored_ddl.sql†L567-L598】【F:refactored_ddl.sh†L174-L190】

### Forms, quotes, and valuations
Quotes, sales orders, and recipients move into dedicated tables with polymorphic recipient tracking, while form lifecycles span `forms`, `form_sections`, `form_questions`, `form_responses`, and `form_response_answers` to standardise data capture workflows.【F:refactored_ddl.sql†L598-L770】 Valuations become polymorphic through `valuations`, enabling asset, deal, or collateral appraisals without new schema.【F:refactored_ddl.sql†L772-L787】 Legacy quote recipient and bespoke form tables converge into these reusable models.【F:refactored_ddl.sh†L192-L220】

### Platform operations and auditability
System automation is centralised via `system_jobs` for asynchronous work, while `audit_events` and `audit_event_changes` capture actor, scope, and field-level deltas for any resource.【F:refactored_ddl.sql†L788-L830】 Integration metadata and scoped configuration live in `integration_settings` and `system_settings`, preserving tenant overrides formerly stored in narrow tables.【F:refactored_ddl.sql†L832-L863】【F:refactored_ddl.sh†L22-L33】

## Migration and usage patterns
1. **Classify legacy tables by domain.** Use `refactored_ddl.sh` to list the target destinations per domain and confirm coverage before writing migrations.【F:refactored_ddl.sh†L22-L220】
2. **Load lookup values first.** Populate `reference_domains` and `reference_values` so foreign keys from entities, deals, workflows, and transactions resolve during bulk loads.【F:refactored_ddl.sql†L33-L53】
3. **Seed core parties.** Migrate entities (companies, individuals, intermediaries) and create the appropriate relationship links to deals, assets, and workflows. This unlocks downstream migrations that depend on party identifiers.【F:refactored_ddl.sql†L57-L257】【F:refactored_ddl.sh†L94-L120】
4. **Attach communications and locations.** Translate contact and address records into `contact_points` and `address_links`, ensuring usage types are defined in reference values.【F:refactored_ddl.sql†L97-L155】【F:refactored_ddl.sh†L122-L129】
5. **Migrate transactional history.** Bring across drawdowns, charges, fees, payments, and allocations after the prerequisite deals and reference data exist.【F:refactored_ddl.sql†L521-L659】【F:refactored_ddl.sh†L167-L185】
6. **Synchronise documents, notes, and forms.** Load base artefacts followed by their polymorphic links so cross-entity attachments remain intact.【F:refactored_ddl.sql†L401-L705】【F:refactored_ddl.sh†L148-L220】
7. **Enable automation and audit.** Seed workflow definitions, steps, and events, then migrate job queues and audit trails to keep operational continuity.【F:refactored_ddl.sql†L347-L399】【F:refactored_ddl.sql†L788-L830】【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sh†L148-L165】

## Implementation checklist
- Confirm every legacy table has a mapping entry; rerun `./refactored_ddl.sh` after schema updates to validate coverage.【F:refactored_ddl.sh†L22-L231】
- Use reference domains to introduce new enumerations instead of creating new lookup tables, keeping the refactored model lean.【F:refactored_ddl.sql†L33-L53】
- Prefer polymorphic link tables (`relationship_links`, `address_links`, `document_links`, `note_links`, `notification_targets`) when connecting records; avoid new bespoke joins unless polymorphism cannot express the requirement.【F:refactored_ddl.sql†L229-L447】
- Store bespoke metadata through `attribute_definitions`/`attribute_assignments` to remain forward compatible with future schema reductions.【F:refactored_ddl.sql†L180-L211】

## Legacy table coverage index
To complement the column-level mapping, the **Legacy-to-Refactored Table Convergence** matrix captures every source table from `ddl.sql` with its target structures, ordered by functional domain. Reference it during migration planning, ETL development, and stakeholder sign-off to evidence that all 149 inputs have an explicit landing zone in the new schema.【F:docs/refactored_table_convergence.md†L1-L230】【F:docs/refactored_table_convergence.md†L230-L366】【F:docs/refactored_table_convergence.md†L366-L407】

### Using the matrix
- **Filter by domain** to generate work packages (e.g., finance engineers focus on “Financial Terms & Transactions” plus “Pricing & Rate Management”).【F:docs/refactored_table_convergence.md†L172-L318】【F:docs/refactored_table_convergence.md†L318-L366】
- **Map dependencies** by cross-referencing polymorphic targets (entities, deals, workflows) so load order respects foreign-key constraints outlined earlier in this guide.【F:docs/refactored_table_convergence.md†L12-L171】【F:docs/refactored_table_convergence.md†L230-L318】
- **Share with business partners** by embedding the “Convergence detail” narrative directly into runbooks; it explains how users will access equivalent data in the refactored platform.【F:docs/refactored_table_convergence.md†L12-L171】【F:docs/refactored_table_convergence.md†L230-L318】

> 📎 **Appendix A – Legacy-to-Refactored Table Matrix**: `docs/refactored_table_convergence.md` is the canonical list and should be version-controlled alongside migrations so changes remain auditably linked to releases.【F:docs/refactored_table_convergence.md†L1-L407】

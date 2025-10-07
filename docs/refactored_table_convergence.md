# Legacy-to-Refactored Table Convergence

This reference lists every table from `ddl.sql` and the structures that replace it in `refactored_ddl.sql`, now grouped by the refactored destination tables so you can inspect every legacy source for a given target. Use it to validate migration scope and to brief stakeholders on how data flows through the consolidated model. The mappings are sourced from `refactored_ddl.sh` and aligned with the target table definitions in `refactored_ddl.sql`.【F:refactored_ddl.sh†L22-L231】【F:refactored_ddl.sql†L9-L863】

## address_links

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| asset_addresses | asset usage | Asset-specific address joins become address links referencing the shared address catalog.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L140-L155】 |
| asset_client_companies | entity-to-asset | Company-to-asset address associations are modelled as polymorphic links.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L140-L155】 |
| asset_client_individuals | entity-to-asset | Individual-to-asset address joins use the same polymorphic link table.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L140-L155】 |
| entity_addresses | unchanged | Entity address records already align with the polymorphic pattern and migrate directly.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L140-L155】 |

## asset_coverages

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| asset_coverages | unchanged | Coverage table persists with clearer foreign keys to entities and reference values.【F:refactored_ddl.sh†L140-L146】【F:refactored_ddl.sql†L258-L270】 |
| asset_insurances | — | Insurance policies move into `asset_coverages` with explicit coverage metadata.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L258-L270】 |

## asset_metrics

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| asset_metrics | unchanged | Metrics table remains with typed value columns for analytics.【F:refactored_ddl.sh†L140-L146】【F:refactored_ddl.sql†L272-L283】 |

## assets

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| assets | polymorphically linked | Asset master data remains but gains polymorphic ties to owners and addresses.【F:refactored_ddl.sh†L140-L146】【F:refactored_ddl.sql†L213-L227】 |

## attribute_assignments

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| asset_insurance_notes | — | Insurance note details map to attribute assignments scoped to coverages or assets.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L195-L211】 |
| attribute_assignments | — | Assignment table remains to store polymorphic attribute payloads.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L195-L211】 |
| attribute_entities | — | Attribute ownership metadata becomes assignment rows keyed by owner type and ID.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L195-L211】 |
| attribute_values | — | Attribute value payloads become polymorphic assignment records with typed columns.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L195-L211】 |
| client_individual_credit_data | — | Credit metrics migrate into attribute assignments for typed storage.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L195-L211】 |

## attribute_definitions

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| attribute_definitions | — | Definitions persist with domain linkage for extensibility.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L182-L191】 |
| attribute_groups | grouping descriptors | Grouping concepts convert into definition metadata to cluster attributes.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L182-L191】 |
| attribute_types | — | Attribute type definitions migrate directly with additional typing metadata.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L182-L191】 |
| attributes | — | Core attribute definitions persist with explicit data types and defaults.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L182-L191】 |

## audit_events

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| activity_log | — | Audit trail rows move into `audit_events`/`audit_event_changes`, keeping actor, scope, and field-level change tracking unified.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L804-L830】 |
| audit | — | Core audit history also standardises on `audit_events` for consistent reporting and retention.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L804-L830】 |

## contact_points

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| contact_points | unchanged | Existing polymorphic contact table is retained with enhanced constraints.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L99-L112】 |
| entity_contacts | renamed | Contacts map to `contact_points` retaining morph references and verification flags.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L99-L112】 |

## deal_settings

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| deal_settings | — | Settings split into workflow steps (for orchestration) and persisted deal settings values.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L333-L345】【F:refactored_ddl.sql†L363-L372】 |

## deal_terms

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| deal_rate_floors | — | Rate floor configurations become deal terms with rate and effective date metadata.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L315-L329】 |
| exit_fee_tiers | — | Exit fee configurations become typed deal term entries for consistent application.【F:refactored_ddl.sh†L140-L146】【F:refactored_ddl.sql†L315-L329】 |
| fee_type_lending_type | — | Cross-reference table becomes reference domain metadata plus deal term associations.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L33-L53】【F:refactored_ddl.sql†L315-L329】 |
| margin_override | — | Margin adjustments become deal terms with explicit rate columns.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L315-L329】 |

## deals

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| deals | unchanged | Deal master table persists with streamlined foreign keys and timestamps.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L285-L298】 |

## document_links

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| client_form_attachments | — | Attachments transform into document links referencing form responses or entities.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L430-L447】 |
| deal_document_categories_data | — | Category assignments convert into document links with role metadata.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L430-L447】 |
| deal_documents | — | Deal-to-document joins use polymorphic links for reuse across modules.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L430-L447】 |

## documents

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| ccr_reports | — | CCR documents remain as document rows linked via document links where required.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L401-L447】 |
| documents | unchanged | Document master records persist with stronger foreign key enforcement.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L401-L428】 |

## drawdown_events

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| drawdown_events | unchanged structure with polymorphic links | Table persists but emphasises polymorphic references and richer metadata.【F:refactored_ddl.sh†L167-L172】【F:refactored_ddl.sql†L609-L620】 |

## drawdowns

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| drawdowns | unchanged core table | Core drawdown table remains with streamlined foreign keys and timestamps.【F:refactored_ddl.sh†L167-L172】【F:refactored_ddl.sql†L598-L607】 |

## entities

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| admins | — | Administrator profiles become entities with linked credentials for authentication.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L57-L95】 |
| broker_agents | — | Agents convert into entities with association links to brokers and deals.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| brokers | — | Broker records map to entities with role-specific relationship links for engagements.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| client_companies | — | Client company data consolidates into entities with shared attributes.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L57-L95】 |
| client_groups | — | Groups become entities with relationship links connecting member clients.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| client_individuals | — | Individual clients merge into the unified entity model with personal attributes.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L57-L95】 |
| companies | — | Corporate parties become entity rows linked to deals and assets via relationships.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L57-L95】 |
| guarantor_corporates | — | Corporate guarantors map to entities with guarantee relationships to deals.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| guarantor_individuals | — | Individual guarantors follow the same entity-plus-relationship model.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| introducers | — | Introducers become entities with role-based relationships to deals and parties.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| lenders | — | Lenders consolidate into entities with deal relationship metadata.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| loan_administrators | — | Loan admin records follow the same entity-based association pattern.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| service_providers | — | Service partners convert into entities attached through polymorphic relationships.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| users | — | Application users convert into entities with credentials, de-duplicating identity data.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L57-L95】 |

## entity_credentials

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| admins | — | Administrator profiles become entities with linked credentials for authentication.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L57-L95】 |
| email_code_authentication | — | Temporary authentication codes convert into credential records keyed by entity and credential type.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L83-L95】 |
| password_resets | — | Password reset tokens are modelled as credential entries with expiry tracking.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L83-L95】 |
| personal_access_tokens | — | Personal tokens map to credential rows so permission scoping uses the same infrastructure.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L83-L95】 |
| roles | — | Role definitions are reference values; assignments occur through credentials and relationship links.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】【F:refactored_ddl.sql†L83-L95】 |
| users | — | Application users convert into entities with credentials, de-duplicating identity data.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L57-L95】 |

## files

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| files | unchanged | File metadata table remains and enforces unique storage keys.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L414-L427】 |

## financial_accounts

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| bank_details | — | Bank account metadata consolidates into `financial_accounts` with accountable polymorphism.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L157-L178】 |

## financial_allocations

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| financial_allocations | unchanged | Allocation breakdowns stay in their dedicated table referencing transactions.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L543-L550】 |

## financial_transactions

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| charges | — | Charges convert into transaction rows with counterparty polymorphism.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L523-L536】 |
| drawdown_fees | — | Fee charges are represented as financial transactions tied to drawdowns or entities.【F:refactored_ddl.sh†L167-L172】【F:refactored_ddl.sql†L523-L536】 |
| fees | — | Fee entries share the same transaction ledger for consistent accounting.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L523-L536】 |
| financial_transactions | unchanged | Core transaction table remains as the central ledger.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L523-L536】 |
| payments | — | Payment records migrate into the unified transaction table with allocation support.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L523-L536】 |

## form_documents

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| form_documents | unchanged | Join table persists to link responses and documents with uniqueness constraints.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L707-L714】 |

## form_responses

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| form_responses | unchanged | Response table persists with polymorphic subject references for reuse.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L693-L705】 |

## forms

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| client_forms | — | Client forms map into the unified `forms` catalogue with versioning.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L675-L689】 |
| forms | unchanged | Core forms table remains with enhanced versioning constraints.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L675-L689】 |
| loan_custom_forms | — | Custom loan forms become entries in the same forms catalogue for reuse.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L675-L689】 |

## integration_settings

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| sharepoint_updates_timestamps | — | Integration timestamps store within `integration_settings` alongside endpoint metadata.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L832-L845】 |
| stripe_settings | — | Payment gateway configuration consolidates into `integration_settings` for governed secrets and toggles.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L832-L845】 |

## note_links

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| broker_agent_notes | — | Agent note associations become polymorphic note links for reuse.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L448-L472】 |
| broker_notes | — | Note content lives in `notes`, linked to brokers via `note_links`.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L448-L472】 |
| client_company_notes | — | Notes remain but attach to companies via polymorphic links.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L448-L472】 |
| client_individual_notes | — | Individual notes reuse the shared notes infrastructure.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L448-L472】 |
| deal_notes | — | Deal commentary migrates into shared notes linked to deals polymorphically.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L448-L472】 |
| note_links | unchanged | Polymorphic note linking persists to attach commentary across modules.【F:refactored_ddl.sh†L218-L220】【F:refactored_ddl.sql†L461-L471】 |
| quote_note | — | Quote notes become shared note records linked to quotes.【F:refactored_ddl.sh†L192-L197】【F:refactored_ddl.sql†L448-L472】 |

## notes

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| broker_notes | — | Note content lives in `notes`, linked to brokers via `note_links`.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L448-L472】 |
| client_company_notes | — | Notes remain but attach to companies via polymorphic links.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L448-L472】 |
| client_individual_notes | — | Individual notes reuse the shared notes infrastructure.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L448-L472】 |
| deal_notes | — | Deal commentary migrates into shared notes linked to deals polymorphically.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L448-L472】 |
| notes | unchanged | Note body storage remains centralised with author and visibility metadata.【F:refactored_ddl.sh†L218-L220】【F:refactored_ddl.sql†L450-L457】 |
| quote_note | — | Quote notes become shared note records linked to quotes.【F:refactored_ddl.sh†L192-L197】【F:refactored_ddl.sql†L448-L472】 |

## notification_targets

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| deal_notification_rules_recipients | — | Recipient rows become notification targets storing delivery context.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L502-L520】 |
| notification_recipients | — | Recipient rows become polymorphic notification targets for flexible delivery.【F:refactored_ddl.sh†L199-L205】【F:refactored_ddl.sql†L504-L520】 |
| notification_targets | unchanged | Target table continues to drive polymorphic delivery management.【F:refactored_ddl.sh†L199-L205】【F:refactored_ddl.sql†L504-L520】 |

## notification_templates

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| deal_notification_rules | — | Notification triggers split into template definitions and notification instances.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L475-L520】 |
| notification_rules | — | Rule definitions map to reusable templates governing channel, subject, and body content.【F:refactored_ddl.sh†L199-L205】【F:refactored_ddl.sql†L473-L485】 |
| notification_templates | unchanged | Template table persists with enhanced metadata for rendering.【F:refactored_ddl.sh†L199-L205】【F:refactored_ddl.sql†L475-L485】 |

## notifications

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| deal_notification_rules | — | Notification triggers split into template definitions and notification instances.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L475-L520】 |
| notification | unchanged | Table continues to record outbound communications with status tracking.【F:refactored_ddl.sh†L199-L205】【F:refactored_ddl.sql†L488-L500】 |
| notifications | unchanged | Core notification log persists with context metadata for auditing.【F:refactored_ddl.sh†L192-L197】【F:refactored_ddl.sql†L488-L500】 |
| scheduled_notifications | scheduled status | Scheduled jobs record in `notifications` with status values controlling dispatch timing.【F:refactored_ddl.sh†L199-L205】【F:refactored_ddl.sql†L488-L500】 |

## postal_addresses

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| addresses | — | Address catalog entries lift-and-shift into the canonical address table.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L117-L136】 |

## pricing_history

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| lender_funder_interest_rate | — | Lender/funder contributions are tracked as pricing history events.【F:refactored_ddl.sh†L186-L190】【F:refactored_ddl.sql†L582-L597】 |
| variable_rates_history | — | Historical rates move into `pricing_history` with source references.【F:refactored_ddl.sh†L186-L190】【F:refactored_ddl.sql†L582-L597】 |
| variable_rates_history_copy1 | — | Duplicate history table merges with the same pricing history stream.【F:refactored_ddl.sh†L186-L190】【F:refactored_ddl.sql†L582-L597】 |

## pricing_schedules

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| variable_rates | — | Rate schedules consolidate into `pricing_schedules` with effective dating.【F:refactored_ddl.sh†L186-L190】【F:refactored_ddl.sql†L569-L580】 |

## quote_recipients

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| quotes_recipients | — | Recipient table remains with polymorphic subject columns for reuse.【F:refactored_ddl.sh†L192-L197】【F:refactored_ddl.sql†L648-L662】 |

## quotes

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| quotes | unchanged | Quotes persist with richer polymorphic recipient handling.【F:refactored_ddl.sh†L192-L197】【F:refactored_ddl.sql†L636-L646】 |

## reference_domains

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| reference_domains | — | Table retained; used to label lookup domains after migration.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L40】 |

## reference_values

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| asset_insurance_type | — | Each lookup row becomes a reference value under the insurance domain.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| asset_types | — | Asset categories are stored as values reused by assets and deals.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| bridge_drawdown_types | — | Drawdown classifications become part of the shared lookup catalog.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| charge_types | — | Charge purposes transform into reference codes for transactions.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| client_form_status | — | Form states are reference-driven to align UI and workflow triggers.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| currencies | — | Currency list retains ISO metadata via reference entries.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| deal_aborted_reasons | — | Abort reasons live in the central reference domain for analytics.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| deal_document_categories | document category domain | Category codes become reference values controlling document tagging.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L33-L53】 |
| deal_document_risk | — | Risk categories become reference codes consumed by documents.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| deal_statuses | — | Deal lifecycle statuses centralise for reuse across modules.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| deal_types | — | Deal type options normalise into lookup values consumed by `deals`.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L285-L298】 |
| document_types | — | Document categories convert into lookup values reused by documents and workflows.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L401-L447】 |
| drawdown_event_amount_type | — | Amount classifications become shared reference values.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| drawdown_event_status | — | Drawdown event statuses now rely on the shared lookup service.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| drawdown_event_type | drawdown event domain | Event type options are reference-managed for reuse across workflows.【F:refactored_ddl.sh†L167-L172】【F:refactored_ddl.sql†L33-L53】 |
| drawdown_status | — | Core drawdown states are reference-coded for uniform validation.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| fee_options | — | Fee configuration options become reference values referenced by deal terms.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| fee_status | — | Fee lifecycle statuses adopt the shared lookup system.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| fee_type | — | Fee type enumerations centralise for reuse across transactions and pricing.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| fee_type_lending_type | fee and lending domains | Cross-reference table becomes reference domain metadata plus deal term associations.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L33-L53】【F:refactored_ddl.sql†L315-L329】 |
| form_types | — | Form typology is managed via reference values, simplifying UI filters.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| guarantor_type | — | Guarantor categories become lookup codes referenced by relationship links.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L229-L257】 |
| interest_calculation_types | — | Interest calculation methods consolidate into shared lookups.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| interest_subtypes | — | Subtypes follow the same lookup model for pricing calculations.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| interest_types | — | High-level interest types convert into reference values consumed by deal terms.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| introducer_type | — | Introducer categories are now managed via the lookup registry.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| lending_types | — | Lending strategies are referenced as shared values for analytics.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| loan_calculation_method | — | Calculation options convert into values that drive pricing engines.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| marital_statuses | — | Marital statuses become shared lookups for onboarding forms.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| marketing_sources | — | Marketing attribution codes centralise for campaign tracking.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| name_titles | — | Honorifics become reference entries for entities and contacts.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| order_statuses | — | Order lifecycle statuses migrate into the reference framework.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| ownership_types | — | Ownership descriptors become shared lookups applied to assets and entities.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| payment_providers | — | Provider catalogues convert into configurable reference values.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| permission_category | permission domain | Categories become lookup values tied to the permission domain.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】 |
| permission_groups | permission group domain | Permission groups are reference-driven classifications for policy control.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】 |
| permissions | permission domain | Permission catalog normalises into reference values for reuse across products.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】 |
| profile_approval_status | profile status domain | Approval states are expressed as reference values for governance flows.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】 |
| provider_types | — | Provider classifications are stored alongside other lookup values.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| purpose_credit_types | — | Credit purposes become reference-coded for credit policy management.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| quotes_status | — | Quote statuses move into the lookup engine feeding sales workflows.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| reference_values | — | Table retained with enhanced governance fields.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L44-L53】 |
| roles | role domain | Role definitions are reference values; assignments occur through credentials and relationship links.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】【F:refactored_ddl.sql†L83-L95】 |
| systems_deal_setting_groups | — | Deal setting groups are reference-managed for workflow inheritance.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| use_type | — | Usage types populate the lookup table and power `address_links` and assets.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L117-L155】 |
| user_types | user type domain | User type metadata becomes a reference domain for consistent classification.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】 |
| valuation_statuses | — | Valuation states are handled via the shared reference catalogue.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| variable_rate_settings | — | Rate setting options convert into reusable lookup values.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| variable_rate_sources | — | Source identifiers map into shared lookup entries for pricing history.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |

## relationship_links

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| asset_relationships | asset associations | Asset-to-asset or asset-to-entity relationships map into the shared relationship fabric.【F:refactored_ddl.sh†L140-L146】【F:refactored_ddl.sql†L229-L257】 |
| borrowers | deal participation | Borrower associations become relationship rows linking entities to deals.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| broker_agent_deals | entity-to-deal | Deal participation now stored as left/right relationship rows with role metadata.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| broker_agents | association | Agents convert into entities with association links to brokers and deals.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| brokers | entity role | Broker records map to entities with role-specific relationship links for engagements.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| client_company_clients | entity-to-company | Company-client associations become relationship link rows with usage typing.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| client_group_clients | entity-to-group | Membership joins transition to relationship links capturing role context.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| client_groups | — | Groups become entities with relationship links connecting member clients.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| deal_introducers | deal-to-entity | Introducer participation becomes a typed relationship row between deals and entities.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L229-L257】 |
| delegated_owners | — | Delegated ownership becomes a relationship record capturing scope and timing.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| guarantor_corporates | — | Corporate guarantors map to entities with guarantee relationships to deals.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| guarantor_individuals | — | Individual guarantors follow the same entity-plus-relationship model.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| guarantors | deal guarantees | Guarantee records become typed relationship links capturing coverage amounts and durations.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| introducers | — | Introducers become entities with role-based relationships to deals and parties.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| lender_operational_team_admin | — | Operational team membership becomes relationship links between entities.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| lenders | — | Lenders consolidate into entities with deal relationship metadata.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| linked_deals | deal-to-deal | Inter-deal associations map to relationship links with both sides pointing at deals.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| loan_administrators | — | Loan admin records follow the same entity-based association pattern.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| model_has_permissions | morphable permission assignments | Permission bindings follow the same pattern for uniform enforcement.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L229-L257】 |
| model_has_roles | morphable role assignments | Model role bindings leverage polymorphic left/right identifiers to support any subject model.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L229-L257】 |
| permission_group_permission | permission assignments | Group-to-permission joins become typed relationship links with role metadata.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L229-L257】 |
| role_has_permissions | role-to-permission | Role assignments map to the same polymorphic relationship infrastructure.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L229-L257】 |
| service_providers | — | Service partners convert into entities attached through polymorphic relationships.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |

## sales_orders

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| orders | — | Orders map into `sales_orders` with clearer relationships to quotes and deals.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L664-L673】 |
| sales_orders | unchanged | Sales orders stay in their dedicated table with ties to quotes and deals.【F:refactored_ddl.sh†L192-L197】【F:refactored_ddl.sql†L664-L673】 |

## system_jobs

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| failed_jobs | — | Background job metadata centralises in `system_jobs`, preserving retry details and related records.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L788-L803】 |
| jobs | — | Active queue records join the unified job table to simplify worker orchestration.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L788-L803】 |

## system_settings

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| migrations | — | Deployment metadata is retained as configuration entries scoped by setting key and context.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L847-L863】 |
| system_settings | — | Configuration remains but gains scope polymorphism for tenant overrides.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L847-L863】 |

## transaction_attempts

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| payment_attempts | — | Attempt-level history persists in `transaction_attempts` keyed to transactions.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L552-L565】 |
| transaction_attempts | unchanged | Attempt tracking persists with unique constraints per transaction.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L552-L565】 |

## valuations

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| valuations | unchanged | Valuations persist but now use morph columns to attach to any valuable record.【F:refactored_ddl.sh†L140-L146】【F:refactored_ddl.sql†L772-L787】 |

## workflow_definitions

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| deal_setting_groups | — | Groupings translate into workflow definitions that govern automation scope.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L347-L359】 |
| deal_task_group | — | Task groups become workflow definitions for reuse across deals.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L347-L359】 |
| task_group | — | Generic task groups join the workflow definition catalogue.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L347-L359】 |
| workflow_definitions | unchanged | Workflow blueprints persist with scope polymorphism for tenant/product targeting.【F:refactored_ddl.sh†L222-L226】【F:refactored_ddl.sql†L347-L359】 |

## workflow_events

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| deal_activities | — | Deal activity history maps into workflow events tied to workflow instances.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L391-L399】 |
| drawdown_fields_approval | — | Approval checkpoints become workflow events linked to workflow steps and entities.【F:refactored_ddl.sh†L167-L172】【F:refactored_ddl.sql†L391-L399】 |
| workflow_events | unchanged | Event logging table remains for auditable workflow execution history.【F:refactored_ddl.sh†L222-L226】【F:refactored_ddl.sql†L391-L399】 |

## workflow_instances

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| deal_task | — | Individual tasks convert into workflow instances referencing subject deals.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L374-L388】 |
| workflow_instances | unchanged | Instances persist with subject polymorphism and status tracking.【F:refactored_ddl.sh†L222-L226】【F:refactored_ddl.sql†L374-L388】 |

## workflow_steps

| Legacy source | Usage scope | Convergence detail |
| --- | --- | --- |
| deal_settings | — | Settings split into workflow steps (for orchestration) and persisted deal settings values.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L333-L345】【F:refactored_ddl.sql†L363-L372】 |
| systems_deal_setting | — | System-level deal settings map into workflow steps to standardise automation logic.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L363-L372】 |
| task | — | Individual tasks become steps within workflow definitions for consistent execution.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L363-L372】 |
| workflow_steps | unchanged | Step definitions remain with sequencing constraints and role assignments.【F:refactored_ddl.sh†L222-L226】【F:refactored_ddl.sql†L363-L372】 |

## Summary
- **Legacy tables covered:** 149
- **Refactored tables receiving data:** 50
- **Net consolidation:** 99 tables removed via polymorphic consolidation while retaining all business capabilities.【F:refactored_ddl.sh†L228-L231】

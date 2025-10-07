# Legacy-to-Refactored Table Convergence

This reference lists every table from `ddl.sql` and the structures that replace it in `refactored_ddl.sql`, grouped by functional domain. Use it to validate migration scope and to brief stakeholders on how data flows through the consolidated model. The mappings are sourced from `refactored_ddl.sh` and aligned with the target table definitions in `refactored_ddl.sql`.【F:refactored_ddl.sh†L22-L231】【F:refactored_ddl.sql†L9-L863】

## Platform Support & Security
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| activity_log | audit_events | Audit trail rows move into `audit_events`/`audit_event_changes`, keeping actor, scope, and field-level change tracking unified.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L804-L830】 |
| audit | audit_events | Core audit history also standardises on `audit_events` for consistent reporting and retention.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L804-L830】 |
| failed_jobs | system_jobs | Background job metadata centralises in `system_jobs`, preserving retry details and related records.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L788-L803】 |
| jobs | system_jobs | Active queue records join the unified job table to simplify worker orchestration.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L788-L803】 |
| migrations | system_settings | Deployment metadata is retained as configuration entries scoped by setting key and context.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L847-L863】 |
| email_code_authentication | entity_credentials | Temporary authentication codes convert into credential records keyed by entity and credential type.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L83-L95】 |
| password_resets | entity_credentials | Password reset tokens are modelled as credential entries with expiry tracking.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L83-L95】 |
| personal_access_tokens | entity_credentials | Personal tokens map to credential rows so permission scoping uses the same infrastructure.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L83-L95】 |
| sharepoint_updates_timestamps | integration_settings | Integration timestamps store within `integration_settings` alongside endpoint metadata.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L832-L845】 |
| stripe_settings | integration_settings | Payment gateway configuration consolidates into `integration_settings` for governed secrets and toggles.【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sql†L832-L845】 |

## Identity & Access Management
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| admins | entities; entity_credentials | Administrator profiles become entities with linked credentials for authentication.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L57-L95】 |
| roles | reference_values (role domain); entity_credentials | Role definitions are reference values; assignments occur through credentials and relationship links.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】【F:refactored_ddl.sql†L83-L95】 |
| permissions | reference_values (permission domain) | Permission catalog normalises into reference values for reuse across products.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】 |
| permission_category | reference_values (permission domain) | Categories become lookup values tied to the permission domain.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】 |
| permission_groups | reference_values (permission group domain) | Permission groups are reference-driven classifications for policy control.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】 |
| permission_group_permission | relationship_links (permission assignments) | Group-to-permission joins become typed relationship links with role metadata.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L229-L257】 |
| role_has_permissions | relationship_links (role-to-permission) | Role assignments map to the same polymorphic relationship infrastructure.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L229-L257】 |
| model_has_roles | relationship_links (morphable role assignments) | Model role bindings leverage polymorphic left/right identifiers to support any subject model.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L229-L257】 |
| model_has_permissions | relationship_links (morphable permission assignments) | Permission bindings follow the same pattern for uniform enforcement.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L229-L257】 |
| profile_approval_status | reference_values (profile status domain) | Approval states are expressed as reference values for governance flows.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】 |
| users | entities; entity_credentials | Application users convert into entities with credentials, de-duplicating identity data.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L57-L95】 |
| user_types | reference_values (user type domain) | User type metadata becomes a reference domain for consistent classification.【F:refactored_ddl.sh†L34-L46】【F:refactored_ddl.sql†L33-L53】 |

## Reference Data & Configuration
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| asset_insurance_type | reference_values | Each lookup row becomes a reference value under the insurance domain.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| asset_types | reference_values | Asset categories are stored as values reused by assets and deals.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| bridge_drawdown_types | reference_values | Drawdown classifications become part of the shared lookup catalog.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| charge_types | reference_values | Charge purposes transform into reference codes for transactions.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| client_form_status | reference_values | Form states are reference-driven to align UI and workflow triggers.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| currencies | reference_values | Currency list retains ISO metadata via reference entries.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| deal_aborted_reasons | reference_values | Abort reasons live in the central reference domain for analytics.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| deal_document_risk | reference_values | Risk categories become reference codes consumed by documents.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| deal_statuses | reference_values | Deal lifecycle statuses centralise for reuse across modules.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| deal_types | reference_values | Deal type options normalise into lookup values consumed by `deals`.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L285-L298】 |
| document_types | reference_values | Document categories convert into lookup values reused by documents and workflows.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L401-L447】 |
| drawdown_event_amount_type | reference_values | Amount classifications become shared reference values.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| drawdown_event_status | reference_values | Drawdown event statuses now rely on the shared lookup service.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| drawdown_status | reference_values | Core drawdown states are reference-coded for uniform validation.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| fee_options | reference_values | Fee configuration options become reference values referenced by deal terms.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| fee_status | reference_values | Fee lifecycle statuses adopt the shared lookup system.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| fee_type | reference_values | Fee type enumerations centralise for reuse across transactions and pricing.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| form_types | reference_values | Form typology is managed via reference values, simplifying UI filters.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| guarantor_type | reference_values | Guarantor categories become lookup codes referenced by relationship links.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L229-L257】 |
| interest_calculation_types | reference_values | Interest calculation methods consolidate into shared lookups.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| interest_subtypes | reference_values | Subtypes follow the same lookup model for pricing calculations.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| interest_types | reference_values | High-level interest types convert into reference values consumed by deal terms.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| introducer_type | reference_values | Introducer categories are now managed via the lookup registry.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| lending_types | reference_values | Lending strategies are referenced as shared values for analytics.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| loan_calculation_method | reference_values | Calculation options convert into values that drive pricing engines.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| marital_statuses | reference_values | Marital statuses become shared lookups for onboarding forms.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| marketing_sources | reference_values | Marketing attribution codes centralise for campaign tracking.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| name_titles | reference_values | Honorifics become reference entries for entities and contacts.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| order_statuses | reference_values | Order lifecycle statuses migrate into the reference framework.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| ownership_types | reference_values | Ownership descriptors become shared lookups applied to assets and entities.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| payment_providers | reference_values | Provider catalogues convert into configurable reference values.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| provider_types | reference_values | Provider classifications are stored alongside other lookup values.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| purpose_credit_types | reference_values | Credit purposes become reference-coded for credit policy management.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| quotes_status | reference_values | Quote statuses move into the lookup engine feeding sales workflows.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| systems_deal_setting_groups | reference_values | Deal setting groups are reference-managed for workflow inheritance.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| use_type | reference_values | Usage types populate the lookup table and power `address_links` and assets.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L117-L155】 |
| valuation_statuses | reference_values | Valuation states are handled via the shared reference catalogue.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| variable_rate_settings | reference_values | Rate setting options convert into reusable lookup values.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| variable_rate_sources | reference_values | Source identifiers map into shared lookup entries for pricing history.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L53】 |
| reference_domains | reference_domains | Table retained; used to label lookup domains after migration.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L33-L40】 |
| reference_values | reference_values | Table retained with enhanced governance fields.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L44-L53】 |
| system_settings | system_settings | Configuration remains but gains scope polymorphism for tenant overrides.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L847-L863】 |
| attribute_definitions | attribute_definitions | Definitions persist with domain linkage for extensibility.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L182-L191】 |
| attribute_assignments | attribute_assignments | Assignment table remains to store polymorphic attribute payloads.【F:refactored_ddl.sh†L48-L92】【F:refactored_ddl.sql†L195-L211】 |

## Party & Relationship Management
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| companies | entities | Corporate parties become entity rows linked to deals and assets via relationships.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L57-L95】 |
| brokers | entities; relationship_links (entity role) | Broker records map to entities with role-specific relationship links for engagements.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| broker_agents | entities; relationship_links (association) | Agents convert into entities with association links to brokers and deals.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| broker_agent_deals | relationship_links (entity-to-deal) | Deal participation now stored as left/right relationship rows with role metadata.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| broker_agent_notes | note_links | Agent note associations become polymorphic note links for reuse.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L448-L472】 |
| broker_notes | notes; note_links | Note content lives in `notes`, linked to brokers via `note_links`.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L448-L472】 |
| client_companies | entities | Client company data consolidates into entities with shared attributes.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L57-L95】 |
| client_groups | entities; relationship_links | Groups become entities with relationship links connecting member clients.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| client_group_clients | relationship_links (entity-to-group) | Membership joins transition to relationship links capturing role context.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| client_company_clients | relationship_links (entity-to-company) | Company-client associations become relationship link rows with usage typing.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| client_company_notes | notes; note_links | Notes remain but attach to companies via polymorphic links.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L448-L472】 |
| client_individuals | entities | Individual clients merge into the unified entity model with personal attributes.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L57-L95】 |
| client_individual_notes | notes; note_links | Individual notes reuse the shared notes infrastructure.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L448-L472】 |
| client_individual_credit_data | attribute_assignments | Credit metrics migrate into attribute assignments for typed storage.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L195-L211】 |
| borrowers | relationship_links (deal participation) | Borrower associations become relationship rows linking entities to deals.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| guarantor_corporates | entities; relationship_links | Corporate guarantors map to entities with guarantee relationships to deals.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| guarantor_individuals | entities; relationship_links | Individual guarantors follow the same entity-plus-relationship model.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| guarantors | relationship_links (deal guarantees) | Guarantee records become typed relationship links capturing coverage amounts and durations.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| introducers | entities; relationship_links | Introducers become entities with role-based relationships to deals and parties.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| lenders | entities; relationship_links | Lenders consolidate into entities with deal relationship metadata.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| lender_operational_team_admin | relationship_links | Operational team membership becomes relationship links between entities.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| service_providers | entities; relationship_links | Service partners convert into entities attached through polymorphic relationships.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| loan_administrators | entities; relationship_links | Loan admin records follow the same entity-based association pattern.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| delegated_owners | relationship_links | Delegated ownership becomes a relationship record capturing scope and timing.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| linked_deals | relationship_links (deal-to-deal) | Inter-deal associations map to relationship links with both sides pointing at deals.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L229-L257】 |
| bank_details | financial_accounts | Bank account metadata consolidates into `financial_accounts` with accountable polymorphism.【F:refactored_ddl.sh†L94-L120】【F:refactored_ddl.sql†L157-L178】 |

## Contact & Location Management
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| addresses | postal_addresses | Address catalog entries lift-and-shift into the canonical address table.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L117-L136】 |
| asset_addresses | address_links (asset usage) | Asset-specific address joins become address links referencing the shared address catalog.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L140-L155】 |
| asset_client_companies | address_links (entity-to-asset) | Company-to-asset address associations are modelled as polymorphic links.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L140-L155】 |
| asset_client_individuals | address_links (entity-to-asset) | Individual-to-asset address joins use the same polymorphic link table.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L140-L155】 |
| entity_addresses | address_links (unchanged) | Entity address records already align with the polymorphic pattern and migrate directly.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L140-L155】 |
| entity_contacts | contact_points (renamed) | Contacts map to `contact_points` retaining morph references and verification flags.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L99-L112】 |
| contact_points | contact_points (unchanged) | Existing polymorphic contact table is retained with enhanced constraints.【F:refactored_ddl.sh†L122-L129】【F:refactored_ddl.sql†L99-L112】 |

## Attribute Extension Framework
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| attribute_entities | attribute_assignments | Attribute ownership metadata becomes assignment rows keyed by owner type and ID.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L195-L211】 |
| attribute_types | attribute_definitions | Attribute type definitions migrate directly with additional typing metadata.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L182-L191】 |
| attribute_groups | attribute_definitions (grouping descriptors) | Grouping concepts convert into definition metadata to cluster attributes.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L182-L191】 |
| attributes | attribute_definitions | Core attribute definitions persist with explicit data types and defaults.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L182-L191】 |
| attribute_values | attribute_assignments | Attribute value payloads become polymorphic assignment records with typed columns.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L195-L211】 |
| asset_insurance_notes | attribute_assignments | Insurance note details map to attribute assignments scoped to coverages or assets.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L195-L211】 |
| asset_insurances | asset_coverages | Insurance policies move into `asset_coverages` with explicit coverage metadata.【F:refactored_ddl.sh†L131-L138】【F:refactored_ddl.sql†L258-L270】 |

## Asset Management & Valuation
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| assets | assets (polymorphically linked) | Asset master data remains but gains polymorphic ties to owners and addresses.【F:refactored_ddl.sh†L140-L146】【F:refactored_ddl.sql†L213-L227】 |
| asset_relationships | relationship_links (asset associations) | Asset-to-asset or asset-to-entity relationships map into the shared relationship fabric.【F:refactored_ddl.sh†L140-L146】【F:refactored_ddl.sql†L229-L257】 |
| asset_coverages | asset_coverages (unchanged) | Coverage table persists with clearer foreign keys to entities and reference values.【F:refactored_ddl.sh†L140-L146】【F:refactored_ddl.sql†L258-L270】 |
| asset_metrics | asset_metrics (unchanged) | Metrics table remains with typed value columns for analytics.【F:refactored_ddl.sh†L140-L146】【F:refactored_ddl.sql†L272-L283】 |
| valuations | valuations (unchanged) | Valuations persist but now use morph columns to attach to any valuable record.【F:refactored_ddl.sh†L140-L146】【F:refactored_ddl.sql†L772-L787】 |
| exit_fee_tiers | deal_terms | Exit fee configurations become typed deal term entries for consistent application.【F:refactored_ddl.sh†L140-L146】【F:refactored_ddl.sql†L315-L329】 |

## Deal Lifecycle & Workflow
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| deals | deals (unchanged) | Deal master table persists with streamlined foreign keys and timestamps.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L285-L298】 |
| deal_activities | workflow_events | Deal activity history maps into workflow events tied to workflow instances.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L391-L399】 |
| deal_document_categories | reference_values (document category domain) | Category codes become reference values controlling document tagging.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L33-L53】 |
| deal_document_categories_data | document_links | Category assignments convert into document links with role metadata.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L430-L447】 |
| deal_documents | document_links | Deal-to-document joins use polymorphic links for reuse across modules.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L430-L447】 |
| deal_introducers | relationship_links (deal-to-entity) | Introducer participation becomes a typed relationship row between deals and entities.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L229-L257】 |
| deal_notes | notes; note_links | Deal commentary migrates into shared notes linked to deals polymorphically.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L448-L472】 |
| deal_notification_rules | notifications; notification_templates | Notification triggers split into template definitions and notification instances.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L475-L520】 |
| deal_notification_rules_recipients | notification_targets | Recipient rows become notification targets storing delivery context.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L502-L520】 |
| deal_rate_floors | deal_terms | Rate floor configurations become deal terms with rate and effective date metadata.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L315-L329】 |
| deal_setting_groups | workflow_definitions | Groupings translate into workflow definitions that govern automation scope.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L347-L359】 |
| deal_settings | workflow_steps; deal_settings | Settings split into workflow steps (for orchestration) and persisted deal settings values.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L333-L345】【F:refactored_ddl.sql†L363-L372】 |
| deal_task | workflow_instances | Individual tasks convert into workflow instances referencing subject deals.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L374-L388】 |
| deal_task_group | workflow_definitions | Task groups become workflow definitions for reuse across deals.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L347-L359】 |
| systems_deal_setting | workflow_steps | System-level deal settings map into workflow steps to standardise automation logic.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L363-L372】 |
| task_group | workflow_definitions | Generic task groups join the workflow definition catalogue.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L347-L359】 |
| task | workflow_steps | Individual tasks become steps within workflow definitions for consistent execution.【F:refactored_ddl.sh†L148-L165】【F:refactored_ddl.sql†L363-L372】 |

## Drawdowns & Funding Events
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| drawdown_event_type | reference_values (drawdown event domain) | Event type options are reference-managed for reuse across workflows.【F:refactored_ddl.sh†L167-L172】【F:refactored_ddl.sql†L33-L53】 |
| drawdown_events | drawdown_events (unchanged structure with polymorphic links) | Table persists but emphasises polymorphic references and richer metadata.【F:refactored_ddl.sh†L167-L172】【F:refactored_ddl.sql†L609-L620】 |
| drawdown_fees | financial_transactions | Fee charges are represented as financial transactions tied to drawdowns or entities.【F:refactored_ddl.sh†L167-L172】【F:refactored_ddl.sql†L523-L536】 |
| drawdown_fields_approval | workflow_events | Approval checkpoints become workflow events linked to workflow steps and entities.【F:refactored_ddl.sh†L167-L172】【F:refactored_ddl.sql†L391-L399】 |
| drawdowns | drawdowns (unchanged core table) | Core drawdown table remains with streamlined foreign keys and timestamps.【F:refactored_ddl.sh†L167-L172】【F:refactored_ddl.sql†L598-L607】 |

## Financial Terms & Transactions
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| charges | financial_transactions | Charges convert into transaction rows with counterparty polymorphism.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L523-L536】 |
| fees | financial_transactions | Fee entries share the same transaction ledger for consistent accounting.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L523-L536】 |
| fee_type_lending_type | reference_values (fee and lending domains); deal_terms | Cross-reference table becomes reference domain metadata plus deal term associations.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L33-L53】【F:refactored_ddl.sql†L315-L329】 |
| payments | financial_transactions | Payment records migrate into the unified transaction table with allocation support.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L523-L536】 |
| payment_attempts | transaction_attempts | Attempt-level history persists in `transaction_attempts` keyed to transactions.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L552-L565】 |
| margin_override | deal_terms | Margin adjustments become deal terms with explicit rate columns.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L315-L329】 |
| orders | sales_orders | Orders map into `sales_orders` with clearer relationships to quotes and deals.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L664-L673】 |
| financial_transactions | financial_transactions (unchanged) | Core transaction table remains as the central ledger.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L523-L536】 |
| financial_allocations | financial_allocations (unchanged) | Allocation breakdowns stay in their dedicated table referencing transactions.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L543-L550】 |
| transaction_attempts | transaction_attempts (unchanged) | Attempt tracking persists with unique constraints per transaction.【F:refactored_ddl.sh†L174-L185】【F:refactored_ddl.sql†L552-L565】 |

## Pricing & Rate Management
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| variable_rates | pricing_schedules | Rate schedules consolidate into `pricing_schedules` with effective dating.【F:refactored_ddl.sh†L186-L190】【F:refactored_ddl.sql†L569-L580】 |
| variable_rates_history | pricing_history | Historical rates move into `pricing_history` with source references.【F:refactored_ddl.sh†L186-L190】【F:refactored_ddl.sql†L582-L597】 |
| variable_rates_history_copy1 | pricing_history | Duplicate history table merges with the same pricing history stream.【F:refactored_ddl.sh†L186-L190】【F:refactored_ddl.sql†L582-L597】 |
| lender_funder_interest_rate | pricing_history | Lender/funder contributions are tracked as pricing history events.【F:refactored_ddl.sh†L186-L190】【F:refactored_ddl.sql†L582-L597】 |

## Quotes & Sales Enablement
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| quotes | quotes (unchanged) | Quotes persist with richer polymorphic recipient handling.【F:refactored_ddl.sh†L192-L197】【F:refactored_ddl.sql†L636-L646】 |
| quote_note | notes; note_links | Quote notes become shared note records linked to quotes.【F:refactored_ddl.sh†L192-L197】【F:refactored_ddl.sql†L448-L472】 |
| quotes_recipients | quote_recipients | Recipient table remains with polymorphic subject columns for reuse.【F:refactored_ddl.sh†L192-L197】【F:refactored_ddl.sql†L648-L662】 |
| sales_orders | sales_orders (unchanged) | Sales orders stay in their dedicated table with ties to quotes and deals.【F:refactored_ddl.sh†L192-L197】【F:refactored_ddl.sql†L664-L673】 |
| notifications | notifications (unchanged) | Core notification log persists with context metadata for auditing.【F:refactored_ddl.sh†L192-L197】【F:refactored_ddl.sql†L488-L500】 |

## Notifications & Communications
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| notification | notifications (unchanged) | Table continues to record outbound communications with status tracking.【F:refactored_ddl.sh†L199-L205】【F:refactored_ddl.sql†L488-L500】 |
| notification_recipients | notification_targets | Recipient rows become polymorphic notification targets for flexible delivery.【F:refactored_ddl.sh†L199-L205】【F:refactored_ddl.sql†L504-L520】 |
| notification_rules | notification_templates | Rule definitions map to reusable templates governing channel, subject, and body content.【F:refactored_ddl.sh†L199-L205】【F:refactored_ddl.sql†L473-L485】 |
| notification_templates | notification_templates (unchanged) | Template table persists with enhanced metadata for rendering.【F:refactored_ddl.sh†L199-L205】【F:refactored_ddl.sql†L475-L485】 |
| scheduled_notifications | notifications (scheduled status) | Scheduled jobs record in `notifications` with status values controlling dispatch timing.【F:refactored_ddl.sh†L199-L205】【F:refactored_ddl.sql†L488-L500】 |
| notification_targets | notification_targets (unchanged) | Target table continues to drive polymorphic delivery management.【F:refactored_ddl.sh†L199-L205】【F:refactored_ddl.sql†L504-L520】 |

## Documents & Forms
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| documents | documents (unchanged) | Document master records persist with stronger foreign key enforcement.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L401-L428】 |
| files | files (unchanged) | File metadata table remains and enforces unique storage keys.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L414-L427】 |
| client_form_attachments | document_links | Attachments transform into document links referencing form responses or entities.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L430-L447】 |
| client_forms | forms | Client forms map into the unified `forms` catalogue with versioning.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L675-L689】 |
| loan_custom_forms | forms | Custom loan forms become entries in the same forms catalogue for reuse.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L675-L689】 |
| ccr_reports | documents | CCR documents remain as document rows linked via document links where required.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L401-L447】 |
| form_documents | form_documents (unchanged) | Join table persists to link responses and documents with uniqueness constraints.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L707-L714】 |
| forms | forms (unchanged) | Core forms table remains with enhanced versioning constraints.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L675-L689】 |
| form_responses | form_responses (unchanged) | Response table persists with polymorphic subject references for reuse.【F:refactored_ddl.sh†L207-L216】【F:refactored_ddl.sql†L693-L705】 |

## Shared Notes & Commentary
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| notes | notes (unchanged) | Note body storage remains centralised with author and visibility metadata.【F:refactored_ddl.sh†L218-L220】【F:refactored_ddl.sql†L450-L457】 |
| note_links | note_links (unchanged) | Polymorphic note linking persists to attach commentary across modules.【F:refactored_ddl.sh†L218-L220】【F:refactored_ddl.sql†L461-L471】 |

## Workflow Execution
| Legacy table | Refactored destination(s) | Convergence detail |
| --- | --- | --- |
| workflow_definitions | workflow_definitions (unchanged) | Workflow blueprints persist with scope polymorphism for tenant/product targeting.【F:refactored_ddl.sh†L222-L226】【F:refactored_ddl.sql†L347-L359】 |
| workflow_steps | workflow_steps (unchanged) | Step definitions remain with sequencing constraints and role assignments.【F:refactored_ddl.sh†L222-L226】【F:refactored_ddl.sql†L363-L372】 |
| workflow_instances | workflow_instances (unchanged) | Instances persist with subject polymorphism and status tracking.【F:refactored_ddl.sh†L222-L226】【F:refactored_ddl.sql†L374-L388】 |
| workflow_events | workflow_events (unchanged) | Event logging table remains for auditable workflow execution history.【F:refactored_ddl.sh†L222-L226】【F:refactored_ddl.sql†L391-L399】 |

## Summary
- **Legacy tables covered:** 149
- **Refactored tables receiving data:** 50
- **Net consolidation:** 99 tables removed via polymorphic consolidation while retaining all business capabilities.【F:refactored_ddl.sh†L228-L231】

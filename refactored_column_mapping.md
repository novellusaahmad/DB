# Comprehensive Legacy-to-Refactored Column Mapping

This table enumerates every column defined in the legacy `ddl.sql` schema and captures its default landing zone inside the refactored design. Mappings are derived by cross-referencing `refactored_ddl.sh` with shared column names in `refactored_ddl.sql`. Columns without a direct twin are annotated with the canonical pattern to use during migration.

| Legacy table | Legacy column | Target structure | Mapping guidance |
| --- | --- | --- | --- |
| `activity_log` | `id` | audit_events.id | Direct column carried forward. |
| `activity_log` | `log_name` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `activity_log` | `description` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `activity_log` | `subject_type` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `activity_log` | `event` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `activity_log` | `subject_id` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `activity_log` | `causer_type` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `activity_log` | `causer_id` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `activity_log` | `properties` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `activity_log` | `batch_uuid` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `activity_log` | `created_at` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `activity_log` | `updated_at` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `activity_log` | `deleted_at` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `addresses` | `id` | postal_addresses.id | Direct column carried forward. |
| `addresses` | `ownership_type_id` | postal_addresses | Normalized address catalog shared via address_links. |
| `addresses` | `postcode` | postal_addresses.postcode | Direct column carried forward. |
| `addresses` | `country` | postal_addresses | Normalized address catalog shared via address_links. |
| `addresses` | `county` | postal_addresses.county | Direct column carried forward. |
| `addresses` | `city` | postal_addresses.city | Direct column carried forward. |
| `addresses` | `district` | postal_addresses.district | Direct column carried forward. |
| `addresses` | `street` | postal_addresses.street | Direct column carried forward. |
| `addresses` | `house_number` | postal_addresses.house_number | Direct column carried forward. |
| `addresses` | `lived_for_months` | postal_addresses | Normalized address catalog shared via address_links. |
| `addresses` | `lived_for_years` | postal_addresses | Normalized address catalog shared via address_links. |
| `addresses` | `created_at` | postal_addresses.created_at | Direct column carried forward. |
| `addresses` | `updated_at` | postal_addresses.updated_at | Direct column carried forward. |
| `addresses` | `deleted_at` | postal_addresses | Normalized address catalog shared via address_links. |
| `admins` | `id` | entities.id, entity_credentials.id | Direct column carried forward. |
| `admins` | `title` | entities.title | Direct column carried forward. |
| `admins` | `first_name` | entities.first_name | Direct column carried forward. |
| `admins` | `middle_name` | entities.middle_name | Direct column carried forward. |
| `admins` | `last_name` | entities.last_name | Direct column carried forward. |
| `admins` | `email` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `admins` | `phone` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `admins` | `created_at` | entities.created_at, entity_credentials.created_at | Direct column carried forward. |
| `admins` | `updated_at` | entities.updated_at, entity_credentials.updated_at | Direct column carried forward. |
| `admins` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `asset_addresses` | `id` | address_links.id | Direct column carried forward. |
| `asset_addresses` | `postcode` | address_links | Associative link between owner and postal address. Use addressable_type/addressable_id for polymorphism. |
| `asset_addresses` | `country` | address_links | Associative link between owner and postal address. Use addressable_type/addressable_id for polymorphism. |
| `asset_addresses` | `county` | address_links | Associative link between owner and postal address. Use addressable_type/addressable_id for polymorphism. |
| `asset_addresses` | `city` | address_links | Associative link between owner and postal address. Use addressable_type/addressable_id for polymorphism. |
| `asset_addresses` | `district` | address_links | Associative link between owner and postal address. Use addressable_type/addressable_id for polymorphism. |
| `asset_addresses` | `street` | address_links | Associative link between owner and postal address. Use addressable_type/addressable_id for polymorphism. |
| `asset_addresses` | `house_number` | address_links | Associative link between owner and postal address. Use addressable_type/addressable_id for polymorphism. |
| `asset_addresses` | `created_at` | address_links.created_at | Direct column carried forward. |
| `asset_addresses` | `updated_at` | address_links.updated_at | Direct column carried forward. |
| `asset_addresses` | `deleted_at` | address_links | Associative link between owner and postal address. Use addressable_type/addressable_id for polymorphism. |
| `asset_client_companies` | `id` | address_links.id | Direct column carried forward. |
| `asset_client_companies` | `asset_id` | address_links.address_id | Linked to shared address row via address_id. |
| `asset_client_companies` | `client_company_id` | address_links.address_id | Linked to shared address row via address_id. |
| `asset_client_companies` | `created_at` | address_links.created_at | Direct column carried forward. |
| `asset_client_companies` | `updated_at` | address_links.updated_at | Direct column carried forward. |
| `asset_client_companies` | `deleted_at` | address_links | Associative link between owner and postal address. Use addressable_type/addressable_id for polymorphism. |
| `asset_client_individuals` | `id` | address_links.id | Direct column carried forward. |
| `asset_client_individuals` | `asset_id` | address_links.address_id | Linked to shared address row via address_id. |
| `asset_client_individuals` | `client_individual_id` | address_links.address_id | Linked to shared address row via address_id. |
| `asset_client_individuals` | `created_at` | address_links.created_at | Direct column carried forward. |
| `asset_client_individuals` | `updated_at` | address_links.updated_at | Direct column carried forward. |
| `asset_client_individuals` | `deleted_at` | address_links | Associative link between owner and postal address. Use addressable_type/addressable_id for polymorphism. |
| `asset_insurance_notes` | `id` | attribute_assignments.id | Direct column carried forward. |
| `asset_insurance_notes` | `asset_insurance_id` | attribute_assignments.owner_id | Mapped into owner identifier. |
| `asset_insurance_notes` | `note_id` | attribute_assignments.owner_id | Mapped into owner identifier. |
| `asset_insurance_notes` | `created_at` | attribute_assignments.created_at | Direct column carried forward. |
| `asset_insurance_notes` | `updated_at` | attribute_assignments.updated_at | Direct column carried forward. |
| `asset_insurance_notes` | `deleted_at` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `asset_insurance_type` | `id` | reference_values.id | Direct column carried forward. |
| `asset_insurance_type` | `name` | reference_values.name | Direct column carried forward. |
| `asset_insurance_type` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `asset_insurance_type` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `asset_insurances` | `id` | asset_coverages.id | Direct column carried forward. |
| `asset_insurances` | `asset_id` | asset_coverages.asset_id | Direct column carried forward. |
| `asset_insurances` | `policy_number` | asset_coverages.policy_number | Direct column carried forward. |
| `asset_insurances` | `is_novellus_nominated_payee` | asset_coverages | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `asset_insurances` | `type_loss_payee` | asset_coverages | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `asset_insurances` | `expiry_date` | asset_coverages | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `asset_insurances` | `sum_insured` | asset_coverages | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `asset_insurances` | `created_at` | asset_coverages | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `asset_insurances` | `updated_at` | asset_coverages | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `asset_insurances` | `deleted_at` | asset_coverages | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `asset_insurances` | `asset_insurance_type_id` | asset_coverages | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `asset_types` | `id` | reference_values.id | Direct column carried forward. |
| `asset_types` | `name` | reference_values.name | Direct column carried forward. |
| `asset_types` | `max_ltv` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `asset_types` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `asset_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `asset_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `assets` | `id` | assets.id | Direct column carried forward. |
| `assets` | `asset_type_id` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `assets` | `client_group_id` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `assets` | `name` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `assets` | `security` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `assets` | `jointly_owned` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `assets` | `independent_valuation` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `assets` | `internal_valuation` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `assets` | `asset_description` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `assets` | `deleted_at` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `assets` | `created_at` | assets.created_at | Direct column carried forward. |
| `assets` | `updated_at` | assets.updated_at | Direct column carried forward. |
| `assets` | `asset_address_id` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `assets` | `deal_id` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `assets` | `use_type_id` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `assets` | `insurance_expiry_date` | assets | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attribute_entities` | `id` | attribute_assignments.id | Direct column carried forward. |
| `attribute_entities` | `name` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `attribute_entities` | `class` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `attribute_entities` | `created_at` | attribute_assignments.created_at | Direct column carried forward. |
| `attribute_entities` | `updated_at` | attribute_assignments.updated_at | Direct column carried forward. |
| `attribute_entities` | `deleted_at` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `attribute_groups` | `id` | attribute_definitions.id | Direct column carried forward. |
| `attribute_groups` | `attribute_entity_id` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attribute_groups` | `name` | attribute_definitions.name | Direct column carried forward. |
| `attribute_groups` | `created_at` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attribute_groups` | `updated_at` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attribute_groups` | `deleted_at` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attribute_types` | `id` | attribute_definitions.id | Direct column carried forward. |
| `attribute_types` | `name` | attribute_definitions.name | Direct column carried forward. |
| `attribute_types` | `created_at` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attribute_types` | `updated_at` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attribute_types` | `is_system_type` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attribute_types` | `deleted_at` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attribute_values` | `id` | attribute_assignments.id | Direct column carried forward. |
| `attribute_values` | `client_form_id` | attribute_assignments.owner_id | Mapped into owner identifier. |
| `attribute_values` | `attribute_id` | attribute_assignments.owner_id | Mapped into owner identifier. |
| `attribute_values` | `value` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `attribute_values` | `created_at` | attribute_assignments.created_at | Direct column carried forward. |
| `attribute_values` | `updated_at` | attribute_assignments.updated_at | Direct column carried forward. |
| `attribute_values` | `deleted_at` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `attributes` | `id` | attribute_definitions.id | Direct column carried forward. |
| `attributes` | `parent_id` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attributes` | `attribute_batch` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attributes` | `attribute_group_id` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attributes` | `attribute_type_id` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attributes` | `reference` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attributes` | `is_system_attribute` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attributes` | `created_at` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attributes` | `updated_at` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attributes` | `field_name` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `attributes` | `deleted_at` | attribute_definitions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `audit` | `id` | audit_events.id | Direct column carried forward. |
| `audit` | `user_id` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `model` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `model_id` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `deal_id` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `event_group_id` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `event_type` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `record_created` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `field` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `field_name` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `from_data` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `from_data_text` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `to_data` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `to_data_text` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `created_at` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `updated_at` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `audit` | `deleted_at` | audit_events | Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes. |
| `bank_details` | `id` | financial_accounts.id | Direct column carried forward. |
| `bank_details` | `sort_code` | financial_accounts.sort_code | Direct column carried forward. |
| `bank_details` | `account_number` | financial_accounts | Standardized financial account schema; use attribute assignments for any institution-specific extensions. |
| `bank_details` | `bic` | financial_accounts.bic | Direct column carried forward. |
| `bank_details` | `iban` | financial_accounts.iban | Direct column carried forward. |
| `bank_details` | `created_at` | financial_accounts.created_at | Direct column carried forward. |
| `bank_details` | `updated_at` | financial_accounts.updated_at | Direct column carried forward. |
| `bank_details` | `deleted_at` | financial_accounts | Standardized financial account schema; use attribute assignments for any institution-specific extensions. |
| `borrowers` | `id` | relationship_links.id | Direct column carried forward. |
| `borrowers` | `deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `client_individual_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `client_company_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `client_group_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `admin_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `guarantor_individual_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `guarantor_corporate_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `main_contact` | relationship_links | Polymorphic join row. Use left/right identifiers according to the relationship semantics documented in refactored_ddl.sh. |
| `borrowers` | `administrator` | relationship_links | Polymorphic join row. Use left/right identifiers according to the relationship semantics documented in refactored_ddl.sh. |
| `borrowers` | `guarantor` | relationship_links | Polymorphic join row. Use left/right identifiers according to the relationship semantics documented in refactored_ddl.sh. |
| `borrowers` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `borrowers` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `borrowers` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `bridge_drawdown_types` | `id` | reference_values.id | Direct column carried forward. |
| `bridge_drawdown_types` | `name` | reference_values.name | Direct column carried forward. |
| `bridge_drawdown_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `bridge_drawdown_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `broker_agent_deals` | `id` | relationship_links.id | Direct column carried forward. |
| `broker_agent_deals` | `broker_agent_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `broker_agent_deals` | `broker_agent_main_contact` | relationship_links | Polymorphic join row. Use left/right identifiers according to the relationship semantics documented in refactored_ddl.sh. |
| `broker_agent_deals` | `deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `broker_agent_deals` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `broker_agent_deals` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `broker_agent_deals` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `broker_agent_notes` | `id` | note_links.id | Direct column carried forward. |
| `broker_agent_notes` | `broker_agent_id` | note_links | Polymorphic note attachment. Use notable_type/notable_id with curated role references. |
| `broker_agent_notes` | `note_id` | note_links.note_id | Direct column carried forward. |
| `broker_agent_notes` | `created_at` | note_links | Polymorphic note attachment. Use notable_type/notable_id with curated role references. |
| `broker_agent_notes` | `updated_at` | note_links | Polymorphic note attachment. Use notable_type/notable_id with curated role references. |
| `broker_agent_notes` | `deleted_at` | note_links | Polymorphic note attachment. Use notable_type/notable_id with curated role references. |
| `broker_agent_notes` | `negative_relationship` | note_links | Polymorphic note attachment. Use notable_type/notable_id with curated role references. |
| `broker_agents` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `broker_agents` | `broker_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `broker_agents` | `user_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `broker_agents` | `name` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `broker_agents` | `email` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `broker_agents` | `phone` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `broker_agents` | `bank_details_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `broker_agents` | `questionable` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `broker_agents` | `created_at` | entities.created_at | Direct column carried forward. |
| `broker_agents` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `broker_agents` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `broker_agents` | `address_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `broker_agents` | `landline` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `broker_agents` | `mobile` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `broker_notes` | `id` | notes.id, note_links.id | Direct column carried forward. |
| `broker_notes` | `broker_id` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `broker_notes` | `note_id` | note_links.note_id | Direct column carried forward. |
| `broker_notes` | `created_at` | notes.created_at | Direct column carried forward. |
| `broker_notes` | `updated_at` | notes.updated_at | Direct column carried forward. |
| `broker_notes` | `deleted_at` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `brokers` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `brokers` | `name` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `brokers` | `email` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `brokers` | `phone` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `brokers` | `commission_rate` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `brokers` | `created_at` | entities.created_at | Direct column carried forward. |
| `brokers` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `brokers` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `brokers` | `engagement_letter` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `brokers` | `address_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `brokers` | `landline` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `brokers` | `mobile` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `brokers` | `location` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `brokers` | `secondary_phone` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `brokers` | `bank_details_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `brokers` | `point_of_contact_name` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `ccr_reports` | `id` | documents.id | Direct column carried forward. |
| `ccr_reports` | `title` | documents.title | Direct column carried forward. |
| `ccr_reports` | `created_at` | documents | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `ccr_reports` | `updated_at` | documents | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `ccr_reports` | `file_id` | documents.file_id | Direct column carried forward. |
| `ccr_reports` | `deleted_at` | documents | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `charge_types` | `id` | reference_values.id | Direct column carried forward. |
| `charge_types` | `name` | reference_values.name | Direct column carried forward. |
| `charge_types` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `charge_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `charge_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `charges` | `id` | financial_transactions.id | Direct column carried forward. |
| `charges` | `parent_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `charges` | `charge` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `charges` | `date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `charges` | `note` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `charges` | `removed` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `charges` | `asset_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `charges` | `lender_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `charges` | `charge_type_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `charges` | `deleted_at` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `charges` | `created_at` | financial_transactions.created_at | Direct column carried forward. |
| `charges` | `updated_at` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_companies` | `id` | entities.id | Direct column carried forward. |
| `client_companies` | `company_id` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_companies` | `name` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_companies` | `email` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_companies` | `phone` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_companies` | `created_at` | entities.created_at | Direct column carried forward. |
| `client_companies` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `client_companies` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `client_companies` | `address_id` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_companies` | `landline` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_companies` | `mobile` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_companies` | `bank_details` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_companies` | `bank_details_id` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_company_clients` | `id` | relationship_links.id | Direct column carried forward. |
| `client_company_clients` | `client_company_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_company_clients` | `client_individual_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_company_clients` | `shareholding_percentage` | relationship_links | Polymorphic join row. Use left/right identifiers according to the relationship semantics documented in refactored_ddl.sh. |
| `client_company_clients` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `client_company_clients` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `client_company_clients` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `client_company_notes` | `id` | notes.id, note_links.id | Direct column carried forward. |
| `client_company_notes` | `client_company_id` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `client_company_notes` | `note_id` | note_links.note_id | Direct column carried forward. |
| `client_company_notes` | `deleted_at` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `client_company_notes` | `created_at` | notes.created_at | Direct column carried forward. |
| `client_company_notes` | `updated_at` | notes.updated_at | Direct column carried forward. |
| `client_form_attachments` | `id` | document_links.id | Direct column carried forward. |
| `client_form_attachments` | `client_form_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `client_form_attachments` | `file_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `client_form_attachments` | `form_attribute_reference` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `client_form_attachments` | `deleted_at` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `client_form_attachments` | `created_at` | document_links.created_at | Direct column carried forward. |
| `client_form_attachments` | `updated_at` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `client_form_status` | `id` | reference_values.id | Direct column carried forward. |
| `client_form_status` | `name` | reference_values.name | Direct column carried forward. |
| `client_form_status` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `client_form_status` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `client_form_status` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `client_forms` | `id` | forms.id | Direct column carried forward. |
| `client_forms` | `client_form_hash` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `form_id` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `client_form_batch_id` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `paid` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `deal_id` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `broker_agent_id` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `main_recipient` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `client_id` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `client_company_id` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `client_group_id` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `form_data_json` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `sent_by_user_id` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `form_sent_at` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `form_populated_at` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `form_completed_at` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `docusign_document_sent` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `created_at` | forms.created_at | Direct column carried forward. |
| `client_forms` | `updated_at` | forms.updated_at | Direct column carried forward. |
| `client_forms` | `client_form_status_id` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `docusign_envelope_id` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `docusign_completed_datetime` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_forms` | `deleted_at` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `client_group_clients` | `id` | relationship_links.id | Direct column carried forward. |
| `client_group_clients` | `client_group_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_group_clients` | `client_company_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_group_clients` | `client_individual_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_group_clients` | `group_leader` | relationship_links | Polymorphic join row. Use left/right identifiers according to the relationship semantics documented in refactored_ddl.sh. |
| `client_group_clients` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `client_group_clients` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `client_group_clients` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `client_groups` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `client_groups` | `company_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_groups` | `name` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_groups` | `email` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_groups` | `phone` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_groups` | `created_at` | entities.created_at | Direct column carried forward. |
| `client_groups` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `client_groups` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `client_groups` | `landline` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_groups` | `mobile` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_groups` | `bank_details` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_groups` | `address_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_groups` | `bank_details_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_individual_credit_data` | `id` | attribute_assignments.id | Direct column carried forward. |
| `client_individual_credit_data` | `client_individual_id` | attribute_assignments.owner_id | Mapped into owner identifier. |
| `client_individual_credit_data` | `input_dob` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `input_name` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `input_surname` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `input_county` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `risk_factor` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `num_defaulter` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `num_drn` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `num_shareholding` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `num_pia` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `num_directorship_prev` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `num_disqualification` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `num_pc` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `num_directorship` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `num_bankruptcy` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `num_dsa` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `num_judgment` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `num_business_name` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_credit_data` | `created_at` | attribute_assignments.created_at | Direct column carried forward. |
| `client_individual_credit_data` | `updated_at` | attribute_assignments.updated_at | Direct column carried forward. |
| `client_individual_credit_data` | `deleted_at` | attribute_assignments | Reusable attribute fabric that captures governed extensions by data type. |
| `client_individual_notes` | `id` | notes.id, note_links.id | Direct column carried forward. |
| `client_individual_notes` | `client_individual_id` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `client_individual_notes` | `note_id` | note_links.note_id | Direct column carried forward. |
| `client_individual_notes` | `created_at` | notes.created_at | Direct column carried forward. |
| `client_individual_notes` | `updated_at` | notes.updated_at | Direct column carried forward. |
| `client_individual_notes` | `deleted_at` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `client_individuals` | `id` | entities.id | Direct column carried forward. |
| `client_individuals` | `address_id` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `previous_address_id` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `user_id` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `permanent_uk_resident` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `name_title_id` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `marital_status_id` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `total_gross_income` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `employment_status` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `residency_status` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `job_title` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `nature_of_business` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `employer_name` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `passport_number` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `is_administrator_only` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `dob_day` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `dob_month` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `dob_year` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `previous_names` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `nationality` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `client_individuals` | `created_at` | entities.created_at | Direct column carried forward. |
| `client_individuals` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `client_individuals` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `companies` | `id` | entities.id | Direct column carried forward. |
| `companies` | `name` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `companies` | `created_at` | entities.created_at | Direct column carried forward. |
| `companies` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `companies` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `currencies` | `id` | reference_values.id | Direct column carried forward. |
| `currencies` | `label` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `currencies` | `currency_code` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `currencies` | `prefix` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `currencies` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `currencies` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `currencies` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_aborted_reasons` | `id` | reference_values.id | Direct column carried forward. |
| `deal_aborted_reasons` | `title` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_aborted_reasons` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_aborted_reasons` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_aborted_reasons` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_activities` | `id` | workflow_events.id | Direct column carried forward. |
| `deal_activities` | `deal_id` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `deal_activities` | `note` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `deal_activities` | `user_id` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `deal_activities` | `audit_id` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `deal_activities` | `file_id` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `deal_activities` | `deleted_at` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `deal_activities` | `created_at` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `deal_activities` | `updated_at` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `deal_activities` | `date` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `deal_activities` | `time_taken` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `deal_document_categories` | `id` | reference_values.id | Direct column carried forward. |
| `deal_document_categories` | `sharepoint_unique_id` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_document_categories` | `folder_path` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_document_categories` | `parent_id` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_document_categories` | `name` | reference_values.name | Direct column carried forward. |
| `deal_document_categories` | `file_count` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_document_categories` | `deal_id` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_document_categories` | `size` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_document_categories` | `last_updated` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_document_categories` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_document_categories` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_document_categories` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_document_categories_data` | `id` | document_links.id | Direct column carried forward. |
| `deal_document_categories_data` | `deal_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_document_categories_data` | `deal_document_category_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_document_categories_data` | `file_count` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_document_categories_data` | `size` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_document_categories_data` | `last_updated` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_document_categories_data` | `deleted_at` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_document_categories_data` | `created_at` | document_links.created_at | Direct column carried forward. |
| `deal_document_categories_data` | `updated_at` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_document_risk` | `id` | reference_values.id | Direct column carried forward. |
| `deal_document_risk` | `name` | reference_values.name | Direct column carried forward. |
| `deal_document_risk` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_document_risk` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_document_risk` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_documents` | `id` | document_links.id | Direct column carried forward. |
| `deal_documents` | `deal_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_documents` | `file_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_documents` | `deal_document_category_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_documents` | `borrower_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_documents` | `client_company_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_documents` | `deal_document_risk_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_documents` | `client_individual_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_documents` | `asset_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_documents` | `description` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_documents` | `deleted_at` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_documents` | `created_at` | document_links.created_at | Direct column carried forward. |
| `deal_documents` | `updated_at` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id. |
| `deal_introducers` | `id` | relationship_links.id | Direct column carried forward. |
| `deal_introducers` | `introducer_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `deal_introducers` | `deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `deal_introducers` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `deal_introducers` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `deal_introducers` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `deal_introducers` | `broker_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `deal_introducers` | `introducer_type_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `deal_notes` | `id` | notes.id, note_links.id | Direct column carried forward. |
| `deal_notes` | `deal_id` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `deal_notes` | `created_at` | notes.created_at | Direct column carried forward. |
| `deal_notes` | `updated_at` | notes.updated_at | Direct column carried forward. |
| `deal_notes` | `deleted_at` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `deal_notes` | `replied_to_id` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `deal_notes` | `created_by_user_id` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `deal_notes` | `important` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `deal_notes` | `note` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `deal_notification_rules` | `id` | notifications.id, notification_templates.id | Direct column carried forward. |
| `deal_notification_rules` | `deal_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `deal_notification_rules` | `drawdown_event_type_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `deal_notification_rules` | `file_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `deal_notification_rules` | `notification_rule_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `deal_notification_rules` | `scheduled_for` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `deal_notification_rules` | `interval_type` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `deal_notification_rules` | `subject` | notification_templates.subject | Direct column carried forward. |
| `deal_notification_rules` | `body` | notification_templates.body | Direct column carried forward. |
| `deal_notification_rules` | `deleted_at` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `deal_notification_rules` | `created_at` | notifications.created_at, notification_templates.created_at | Direct column carried forward. |
| `deal_notification_rules` | `updated_at` | notification_templates.updated_at | Direct column carried forward. |
| `deal_notification_rules` | `scheduled_date` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `deal_notification_rules` | `notification_template_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `deal_notification_rules_recipients` | `id` | notification_targets.id | Direct column carried forward. |
| `deal_notification_rules_recipients` | `deal_notification_rule_id` | notification_targets.target_id | Mapped into generic target identifier. |
| `deal_notification_rules_recipients` | `client_individual_id` | notification_targets.target_id | Mapped into generic target identifier. |
| `deal_notification_rules_recipients` | `deleted_at` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with explicit delivery result columns. |
| `deal_notification_rules_recipients` | `created_at` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with explicit delivery result columns. |
| `deal_notification_rules_recipients` | `updated_at` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with explicit delivery result columns. |
| `deal_rate_floors` | `id` | deal_terms.id | Direct column carried forward. |
| `deal_rate_floors` | `variable_source_id` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings. |
| `deal_rate_floors` | `deal_id` | deal_terms.deal_id | Direct column carried forward. |
| `deal_rate_floors` | `floor_rate` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings. |
| `deal_rate_floors` | `deleted_at` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings. |
| `deal_setting_groups` | `id` | workflow_definitions.id | Direct column carried forward. |
| `deal_setting_groups` | `name` | workflow_definitions.name | Direct column carried forward. |
| `deal_setting_groups` | `order_id` | workflow_definitions | Workflow definition catalog. Persist structural details through workflow_steps and related tables. |
| `deal_setting_groups` | `deal_id` | workflow_definitions | Workflow definition catalog. Persist structural details through workflow_steps and related tables. |
| `deal_setting_groups` | `deleted_at` | workflow_definitions | Workflow definition catalog. Persist structural details through workflow_steps and related tables. |
| `deal_setting_groups` | `created_at` | workflow_definitions.created_at | Direct column carried forward. |
| `deal_setting_groups` | `updated_at` | workflow_definitions.updated_at | Direct column carried forward. |
| `deal_settings` | `id` | workflow_steps.id, deal_settings.id | Direct column carried forward. |
| `deal_settings` | `name` | workflow_steps.name | Direct column carried forward. |
| `deal_settings` | `status` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `deal_settings` | `order_id` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `deal_settings` | `deal_setting_group_id` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `deal_settings` | `deleted_at` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `deal_settings` | `created_at` | deal_settings.created_at | Direct column carried forward. |
| `deal_settings` | `updated_at` | deal_settings.updated_at | Direct column carried forward. |
| `deal_statuses` | `id` | reference_values.id | Direct column carried forward. |
| `deal_statuses` | `name` | reference_values.name | Direct column carried forward. |
| `deal_statuses` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_statuses` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_statuses` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_task` | `id` | workflow_instances.id | Direct column carried forward. |
| `deal_task` | `name` | workflow_instances | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deal_task` | `complete` | workflow_instances | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deal_task` | `order_id` | workflow_instances | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deal_task` | `deal_task_group_id` | workflow_instances | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deal_task` | `actioned_by_user_id` | workflow_instances | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deal_task` | `assigned_to_user_id` | workflow_instances | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deal_task` | `date_due` | workflow_instances | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deal_task` | `date` | workflow_instances | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deal_task` | `auto_assign_to_case_owner` | workflow_instances | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deal_task` | `deleted_at` | workflow_instances | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deal_task` | `created_at` | workflow_instances.started_at | Temporal column normalized during refactor. |
| `deal_task` | `updated_at` | workflow_instances | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deal_task` | `na` | workflow_instances | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deal_task_group` | `id` | workflow_definitions.id | Direct column carried forward. |
| `deal_task_group` | `name` | workflow_definitions.name | Direct column carried forward. |
| `deal_task_group` | `order_id` | workflow_definitions | Workflow definition catalog. Persist structural details through workflow_steps and related tables. |
| `deal_task_group` | `deal_id` | workflow_definitions | Workflow definition catalog. Persist structural details through workflow_steps and related tables. |
| `deal_task_group` | `deleted_at` | workflow_definitions | Workflow definition catalog. Persist structural details through workflow_steps and related tables. |
| `deal_task_group` | `created_at` | workflow_definitions.created_at | Direct column carried forward. |
| `deal_task_group` | `updated_at` | workflow_definitions.updated_at | Direct column carried forward. |
| `deal_types` | `id` | reference_values.id | Direct column carried forward. |
| `deal_types` | `name` | reference_values.name | Direct column carried forward. |
| `deal_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deal_types` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `deals` | `id` | deals.id | Direct column carried forward. |
| `deals` | `name` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `parent_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `case_owner_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `reference` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `type_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `guarantor_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `client_group_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `currency_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `status_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `approval_requested_by` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `approved_by` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `date_of_approval_required` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `date_of_approval` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `purpose_credit_type_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `base_rate_floor` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `loan_term` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `purchase_price` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `amount_required` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `max_ltv` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `marketing_source_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `usage_details` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `undervalue_details` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `funds_going_to_be_used_for` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `shortfall_balance_details` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `exit_strategy` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `created_at` | deals.created_at | Direct column carried forward. |
| `deals` | `updated_at` | deals.updated_at | Direct column carried forward. |
| `deals` | `deleted_at` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `marketing_source_utm` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `marketing_campaign_utm` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `aborted_reason_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `previous_status_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `estimated_sale_time` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `estimated_construction_time` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `square_footage` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `price_per_square_foot` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `private_investor` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `novellus_reference` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `novellus_name` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `lending_type_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `interest_calculation_type_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `interest_type_id` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `deals` | `purpose_of_loan` | deals | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `delegated_owners` | `id` | relationship_links.id | Direct column carried forward. |
| `delegated_owners` | `deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `delegated_owners` | `user_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `delegated_owners` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `delegated_owners` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `delegated_owners` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `document_types` | `id` | reference_values.id | Direct column carried forward. |
| `document_types` | `name` | reference_values.name | Direct column carried forward. |
| `document_types` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `document_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `document_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `documents` | `id` | documents.id | Direct column carried forward. |
| `documents` | `filename` | documents | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `documents` | `document_type_id` | documents.document_type_id | Direct column carried forward. |
| `documents` | `deleted_at` | documents | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `documents` | `created_at` | documents | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `documents` | `updated_at` | documents | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_event_amount_type` | `id` | reference_values.id | Direct column carried forward. |
| `drawdown_event_amount_type` | `name` | reference_values.name | Direct column carried forward. |
| `drawdown_event_amount_type` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_event_amount_type` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_event_amount_type` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_event_status` | `id` | reference_values.id | Direct column carried forward. |
| `drawdown_event_status` | `name` | reference_values.name | Direct column carried forward. |
| `drawdown_event_status` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_event_status` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_event_status` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_event_type` | `id` | reference_values.id | Direct column carried forward. |
| `drawdown_event_type` | `drawdown_event_amount_type_id` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_event_type` | `name` | reference_values.name | Direct column carried forward. |
| `drawdown_event_type` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_event_type` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_event_type` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_event_type` | `enabled_to_schedule_before` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_events` | `id` | drawdown_events.id | Direct column carried forward. |
| `drawdown_events` | `event_date` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `financial_date` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `drawdown_id` | drawdown_events.drawdown_id | Direct column carried forward. |
| `drawdown_events` | `event_type_id` | drawdown_events.event_type_id | Direct column carried forward. |
| `drawdown_events` | `event_status_id` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `amount` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `variable_rate_source_id` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `accrued_amount` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `note` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `deleted_at` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `created_at` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `updated_at` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `end_date` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `amount_of_loan_in_default` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `default_interest_rate` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_events` | `rate_override` | drawdown_events | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `id` | financial_transactions.id | Direct column carried forward. |
| `drawdown_fees` | `drawdown_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `fee_status_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `fee_type_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `service_provider_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `currency_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `broker_agent_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `invoice_paid_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `fee_amount` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `fee_amount_perc` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `added_to_loan` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `generate_invoice` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `invoice_due_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `notes` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `fee_interest` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `start_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `end_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `retained_from_net_advance` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `commitment_fee_refund_amount` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `commitment_fee_refund_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `commitment_fee_refund_period` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `active` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `quoted_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `quote_confirmed_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `undertaking_confirmed_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `created_at` | financial_transactions.created_at | Direct column carried forward. |
| `drawdown_fees` | `updated_at` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fees` | `deleted_at` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdown_fields_approval` | `id` | workflow_events.id | Direct column carried forward. |
| `drawdown_fields_approval` | `field_name` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `drawdown_fields_approval` | `is_approved` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `drawdown_fields_approval` | `approved_by` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `drawdown_fields_approval` | `drawdown_id` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `drawdown_fields_approval` | `created_at` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `drawdown_fields_approval` | `updated_at` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `drawdown_fields_approval` | `deleted_at` | workflow_events | Workflow audit trail. Map timestamps and actor references into normalized event fields. |
| `drawdown_status` | `id` | reference_values.id | Direct column carried forward. |
| `drawdown_status` | `name` | reference_values.name | Direct column carried forward. |
| `drawdown_status` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_status` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdown_status` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `drawdowns` | `id` | drawdowns.id | Direct column carried forward. |
| `drawdowns` | `name` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `deal_id` | drawdowns.deal_id | Direct column carried forward. |
| `drawdowns` | `drawdown_status_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `lender_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `interest_rate` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `redemption_date` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `deleted_at` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `created_at` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `updated_at` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `interest_calculation_type_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `total_net_loan` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `gross_loan` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `term_months` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `term_days` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `monthly_rate` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `daily_rate` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `loan_start_date` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `refinanced_date` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `refinance_gross_amount` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `refinanced_from_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `refinanced_to_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `loan_administration_start_date` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `loan_end_date` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `deal_type_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `interest_type_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `bridging_drawdown_type_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `interest_subtype_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `max_loan_amount` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `ltv` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `interest_payment` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `actual_accrued_interest_payment` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `monthly_interest` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `daily_interest` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `total_net_advance` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `total_investment` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `estimated_return` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `estimated_margin` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `redemption_value` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `loan_calculation_method_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `asset_value` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `asset_type_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `max_ltv` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `ltv_override_reason` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `variable_rate_source_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `source_rate` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `margin` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `variable_rate_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `total_fees` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `total_interest_on_fees` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `retained_interest` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `redeem_date` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `exit_fee_calculated` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `funder_interest_rate` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `hybrid_parent_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `is_hybrid_parent` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `exit_strategies` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `marketing_channel_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `default_rate` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `year_type` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `compound_day` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `funder_arrangement_fee` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `funder_arrangement_fee_is_percent` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `notice_period_days` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `additional_interest_rate` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `extended_from` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `extension_date` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `extended_gross_amount` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `gross_development_value` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `gross_development_value_gross_loan_greater_note` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `asset_value_day_net_advance_greater_note` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `total_drawn_amount` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `drawdowns_start_date` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `drawdowns_end_date` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `number_of_drawdowns` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `tranch_strategy` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `used_floor_rate` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `used_floor_rate_note` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `profile_approval_status_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `first_approval_user_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `first_approval_datetime` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `second_approval_user_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `submitted_by_user_id` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `approval_datetime` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `drawdowns` | `rejected_note` | drawdowns | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `email_code_authentication` | `id` | entity_credentials.id | Direct column carried forward. |
| `email_code_authentication` | `user_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `email_code_authentication` | `code` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; extend via attribute_assignments when necessary. |
| `email_code_authentication` | `created_at` | entity_credentials.created_at | Direct column carried forward. |
| `email_code_authentication` | `expires_at` | entity_credentials.expires_at | Direct column carried forward. |
| `email_code_authentication` | `deleted_at` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; extend via attribute_assignments when necessary. |
| `exit_fee_tiers` | `id` | deal_terms.id | Direct column carried forward. |
| `exit_fee_tiers` | `deal_id` | deal_terms.deal_id | Direct column carried forward. |
| `exit_fee_tiers` | `term_month` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings. |
| `exit_fee_tiers` | `fee_percent` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings. |
| `exit_fee_tiers` | `deleted_at` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings. |
| `exit_fee_tiers` | `created_at` | deal_terms.created_at | Direct column carried forward. |
| `exit_fee_tiers` | `updated_at` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings. |
| `failed_jobs` | `id` | system_jobs.id | Direct column carried forward. |
| `failed_jobs` | `uuid` | system_jobs | Asynchronous job queue. Persist handler arguments in dedicated columns and optional related-record pointers. |
| `failed_jobs` | `connection` | system_jobs | Asynchronous job queue. Persist handler arguments in dedicated columns and optional related-record pointers. |
| `failed_jobs` | `queue` | system_jobs | Asynchronous job queue. Persist handler arguments in dedicated columns and optional related-record pointers. |
| `failed_jobs` | `payload` | system_jobs | Asynchronous job queue. Persist handler arguments in dedicated columns and optional related-record pointers. |
| `failed_jobs` | `exception` | system_jobs | Asynchronous job queue. Persist handler arguments in dedicated columns and optional related-record pointers. |
| `failed_jobs` | `failed_at` | system_jobs | Asynchronous job queue. Persist handler arguments in dedicated columns and optional related-record pointers. |
| `fee_options` | `id` | reference_values.id | Direct column carried forward. |
| `fee_options` | `name` | reference_values.name | Direct column carried forward. |
| `fee_options` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_options` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_options` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_status` | `id` | reference_values.id | Direct column carried forward. |
| `fee_status` | `name` | reference_values.name | Direct column carried forward. |
| `fee_status` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_status` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_status` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_type` | `id` | reference_values.id | Direct column carried forward. |
| `fee_type` | `name` | reference_values.name | Direct column carried forward. |
| `fee_type` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_type` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_type` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_type` | `default_value_flat` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_type` | `default_value_perc` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_type` | `not_deletable` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_type` | `active` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_type_lending_type` | `id` | reference_values.id, deal_terms.id | Direct column carried forward. |
| `fee_type_lending_type` | `fee_type_id` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_type_lending_type` | `lending_type_id` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fee_type_lending_type` | `created_at` | deal_terms.created_at | Direct column carried forward. |
| `fee_type_lending_type` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `fees` | `id` | financial_transactions.id | Direct column carried forward. |
| `fees` | `fee_status_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `invoice_paid_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `fee_type_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `service_provider_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `fee_amount` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `fee_amount_perc` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `currency_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `deal_id` | financial_transactions.deal_id | Direct column carried forward. |
| `fees` | `fee_interest` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `generate_invoice` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `invoice_due_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `notes` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `created_at` | financial_transactions.created_at | Direct column carried forward. |
| `fees` | `updated_at` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `deleted_at` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `added_to_loan` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `start_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `end_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `broker_agent_id` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `retained_from_net_advance` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `commitment_fee_refund_amount` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `commitment_fee_refund_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `commitment_fee_refund_period` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `quoted_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `quote_confirmed_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `undertaking_confirmed_date` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `fees` | `active` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `files` | `id` | files.id | Direct column carried forward. |
| `files` | `deal_document_category_id` | files | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `files` | `directory` | files | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `files` | `filename` | files | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `files` | `original_filename` | files | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `files` | `mime` | files | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `files` | `size` | files | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `files` | `user_id` | files | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `files` | `document_folder` | files | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `files` | `sharepoint_path` | files | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `files` | `created_at` | files.created_at | Direct column carried forward. |
| `files` | `updated_at` | files | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `files` | `deleted_at` | files | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `files` | `sharepoint_unique_id` | files | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `form_types` | `id` | reference_values.id | Direct column carried forward. |
| `form_types` | `name` | reference_values.name | Direct column carried forward. |
| `form_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `form_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `form_types` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `guarantor_corporates` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `guarantor_corporates` | `company_name` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_corporates` | `company_number` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_corporates` | `email` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_corporates` | `phone` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_corporates` | `created_at` | entities.created_at | Direct column carried forward. |
| `guarantor_corporates` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `guarantor_corporates` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `guarantor_individuals` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `guarantor_individuals` | `title` | entities.title | Direct column carried forward. |
| `guarantor_individuals` | `first_name` | entities.first_name | Direct column carried forward. |
| `guarantor_individuals` | `middle_name` | entities.middle_name | Direct column carried forward. |
| `guarantor_individuals` | `last_name` | entities.last_name | Direct column carried forward. |
| `guarantor_individuals` | `email` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_individuals` | `phone` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_individuals` | `previous_name` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_individuals` | `marital_status` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_individuals` | `date_of_birth` | entities.date_of_birth | Direct column carried forward. |
| `guarantor_individuals` | `nationality` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_individuals` | `passport_number` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_individuals` | `permanent_right_to_reside` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_individuals` | `address_history` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_individuals` | `ppsn` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `guarantor_individuals` | `created_at` | entities.created_at | Direct column carried forward. |
| `guarantor_individuals` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `guarantor_individuals` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `guarantor_type` | `id` | reference_values.id | Direct column carried forward. |
| `guarantor_type` | `name` | reference_values.name | Direct column carried forward. |
| `guarantor_type` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `guarantor_type` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `guarantor_type` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `guarantors` | `id` | relationship_links.id | Direct column carried forward. |
| `guarantors` | `deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `guarantors` | `client_individual_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `guarantors` | `client_company_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `guarantors` | `client_group_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `guarantors` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `guarantors` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `guarantors` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `guarantors` | `guarantor_type_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `interest_calculation_types` | `id` | reference_values.id | Direct column carried forward. |
| `interest_calculation_types` | `name` | reference_values.name | Direct column carried forward. |
| `interest_calculation_types` | `formula` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `interest_calculation_types` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `interest_calculation_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `interest_calculation_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `interest_subtypes` | `id` | reference_values.id | Direct column carried forward. |
| `interest_subtypes` | `name` | reference_values.name | Direct column carried forward. |
| `interest_subtypes` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `interest_subtypes` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `interest_types` | `id` | reference_values.id | Direct column carried forward. |
| `interest_types` | `name` | reference_values.name | Direct column carried forward. |
| `interest_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `interest_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `interest_types` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `introducer_type` | `id` | reference_values.id | Direct column carried forward. |
| `introducer_type` | `name` | reference_values.name | Direct column carried forward. |
| `introducer_type` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `introducer_type` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `introducer_type` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `introducers` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `introducers` | `company` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `introducers` | `contact` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `introducers` | `email` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `introducers` | `phone` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `introducers` | `created_at` | entities.created_at | Direct column carried forward. |
| `introducers` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `introducers` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `introducers` | `introducer_type_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `jobs` | `id` | system_jobs.id | Direct column carried forward. |
| `jobs` | `queue` | system_jobs | Asynchronous job queue. Persist handler arguments in dedicated columns and optional related-record pointers. |
| `jobs` | `payload` | system_jobs | Asynchronous job queue. Persist handler arguments in dedicated columns and optional related-record pointers. |
| `jobs` | `attempts` | system_jobs.attempts | Direct column carried forward. |
| `jobs` | `reserved_at` | system_jobs | Asynchronous job queue. Persist handler arguments in dedicated columns and optional related-record pointers. |
| `jobs` | `available_at` | system_jobs.available_at | Direct column carried forward. |
| `jobs` | `created_at` | system_jobs.created_at | Direct column carried forward. |
| `lender_funder_interest_rate` | `id` | pricing_history.id | Direct column carried forward. |
| `lender_funder_interest_rate` | `lender_id` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `lender_funder_interest_rate` | `interest_rate` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `lender_funder_interest_rate` | `created_at` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `lender_funder_interest_rate` | `updated_at` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `lender_funder_interest_rate` | `deleted_at` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `lender_operational_team_admin` | `id` | relationship_links.id | Direct column carried forward. |
| `lender_operational_team_admin` | `user_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `lender_operational_team_admin` | `lender_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `lender_operational_team_admin` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `lender_operational_team_admin` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `lender_operational_team_admin` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `lenders` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `lenders` | `name` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `lenders` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `lenders` | `created_at` | entities.created_at | Direct column carried forward. |
| `lenders` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `lenders` | `historical` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `lenders` | `stripe_settings_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `lending_types` | `id` | reference_values.id | Direct column carried forward. |
| `lending_types` | `name` | reference_values.name | Direct column carried forward. |
| `lending_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `lending_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `linked_deals` | `id` | relationship_links.id | Direct column carried forward. |
| `linked_deals` | `deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `linked_deals` | `linked_deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `linked_deals` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `linked_deals` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `linked_deals` | `cross_collateralized` | relationship_links | Polymorphic join row. Use left/right identifiers according to the relationship semantics documented in refactored_ddl.sh. |
| `linked_deals` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `loan_administrators` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `loan_administrators` | `deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `loan_administrators` | `client_individual_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `loan_administrators` | `client_company_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `loan_administrators` | `client_group_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `loan_administrators` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `loan_administrators` | `created_at` | entities.created_at | Direct column carried forward. |
| `loan_administrators` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `loan_calculation_method` | `id` | reference_values.id | Direct column carried forward. |
| `loan_calculation_method` | `name` | reference_values.name | Direct column carried forward. |
| `loan_calculation_method` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `loan_calculation_method` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `loan_calculation_method` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `loan_custom_forms` | `id` | forms.id | Direct column carried forward. |
| `loan_custom_forms` | `name` | forms.name | Direct column carried forward. |
| `loan_custom_forms` | `form_data` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `loan_custom_forms` | `created_by` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `loan_custom_forms` | `created_at` | forms.created_at | Direct column carried forward. |
| `loan_custom_forms` | `updated_at` | forms.updated_at | Direct column carried forward. |
| `loan_custom_forms` | `deleted_at` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `loan_custom_forms` | `reference` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `loan_custom_forms` | `form_type_id` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `loan_custom_forms` | `payment_required` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `loan_custom_forms` | `application_form` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `loan_custom_forms` | `payment_fee` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `loan_custom_forms` | `e_sign_required` | forms | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `margin_override` | `id` | deal_terms.id | Direct column carried forward. |
| `margin_override` | `drawdown_id` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings. |
| `margin_override` | `from` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings. |
| `margin_override` | `to` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings. |
| `margin_override` | `rate` | deal_terms.rate | Direct column carried forward. |
| `margin_override` | `created_at` | deal_terms.created_at | Direct column carried forward. |
| `margin_override` | `updated_at` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings. |
| `margin_override` | `deleted_at` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings. |
| `marital_statuses` | `id` | reference_values.id | Direct column carried forward. |
| `marital_statuses` | `name` | reference_values.name | Direct column carried forward. |
| `marital_statuses` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `marital_statuses` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `marital_statuses` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `marketing_sources` | `id` | reference_values.id | Direct column carried forward. |
| `marketing_sources` | `name` | reference_values.name | Direct column carried forward. |
| `marketing_sources` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `marketing_sources` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `marketing_sources` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `migrations` | `id` | system_settings.id | Direct column carried forward. |
| `migrations` | `migration` | system_settings | Configuration registry. Typed columns replace generic value blobs for clearer governance. |
| `migrations` | `batch` | system_settings | Configuration registry. Typed columns replace generic value blobs for clearer governance. |
| `model_has_permissions` | `permission_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `model_has_permissions` | `model_type` | relationship_links | Polymorphic join row. Use left/right identifiers according to the relationship semantics documented in refactored_ddl.sh. |
| `model_has_permissions` | `model_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `model_has_roles` | `role_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `model_has_roles` | `model_type` | relationship_links | Polymorphic join row. Use left/right identifiers according to the relationship semantics documented in refactored_ddl.sh. |
| `model_has_roles` | `model_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `name_titles` | `id` | reference_values.id | Direct column carried forward. |
| `name_titles` | `name` | reference_values.name | Direct column carried forward. |
| `name_titles` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `name_titles` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `name_titles` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `notes` | `id` | notes.id | Direct column carried forward. |
| `notes` | `note` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `notes` | `created_by` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `notes` | `created_at` | notes.created_at | Direct column carried forward. |
| `notes` | `updated_at` | notes.updated_at | Direct column carried forward. |
| `notes` | `deleted_at` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `notification` | `id` | notifications.id | Direct column carried forward. |
| `notification` | `deal_notification_rule_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `notification` | `deal_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `notification` | `drawdown_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `notification` | `drawdown_event_type_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `notification` | `file_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `notification` | `deleted_at` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `notification` | `created_at` | notifications.created_at | Direct column carried forward. |
| `notification` | `updated_at` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `notification_recipients` | `id` | notification_targets.id | Direct column carried forward. |
| `notification_recipients` | `notification_id` | notification_targets.notification_id | Direct column carried forward. |
| `notification_recipients` | `client_individual_id` | notification_targets.target_id | Mapped into generic target identifier. |
| `notification_recipients` | `used_email_address` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with explicit delivery result columns. |
| `notification_recipients` | `subject` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with explicit delivery result columns. |
| `notification_recipients` | `body` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with explicit delivery result columns. |
| `notification_recipients` | `sent` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with explicit delivery result columns. |
| `notification_recipients` | `deleted_at` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with explicit delivery result columns. |
| `notification_recipients` | `created_at` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with explicit delivery result columns. |
| `notification_recipients` | `updated_at` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with explicit delivery result columns. |
| `notification_rules` | `id` | notification_templates.id | Direct column carried forward. |
| `notification_rules` | `notification_template_id` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_rules` | `drawdown_event_type_id` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_rules` | `scheduled_for` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_rules` | `interval_type` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_rules` | `subject_override` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_rules` | `body_override` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_rules` | `file_id` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_rules` | `deleted_at` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_rules` | `created_at` | notification_templates.created_at | Direct column carried forward. |
| `notification_rules` | `updated_at` | notification_templates.updated_at | Direct column carried forward. |
| `notification_rules` | `recipient_setting` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_rules` | `lending_type_id` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_templates` | `id` | notification_templates.id | Direct column carried forward. |
| `notification_templates` | `doc_reference` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_templates` | `subject` | notification_templates.subject | Direct column carried forward. |
| `notification_templates` | `body` | notification_templates.body | Direct column carried forward. |
| `notification_templates` | `file_id` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_templates` | `deleted_at` | notification_templates | Notification template library. Port subject/body into template fields; use attribute_assignments for variants. |
| `notification_templates` | `created_at` | notification_templates.created_at | Direct column carried forward. |
| `notification_templates` | `updated_at` | notification_templates.updated_at | Direct column carried forward. |
| `order_statuses` | `id` | reference_values.id | Direct column carried forward. |
| `order_statuses` | `name` | reference_values.name | Direct column carried forward. |
| `order_statuses` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `order_statuses` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `order_statuses` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `orders` | `id` | sales_orders.id | Direct column carried forward. |
| `orders` | `reference` | sales_orders | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `orders` | `client_form_id` | sales_orders | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `orders` | `user_id` | sales_orders | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `orders` | `order_status_id` | sales_orders.order_status_id | Direct column carried forward. |
| `orders` | `payment_id` | sales_orders | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `orders` | `net_total` | sales_orders | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `orders` | `gross_total` | sales_orders | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `orders` | `vat_rate` | sales_orders | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `orders` | `created_at` | sales_orders | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `orders` | `updated_at` | sales_orders | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `orders` | `deleted_at` | sales_orders | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `ownership_types` | `id` | reference_values.id | Direct column carried forward. |
| `ownership_types` | `name` | reference_values.name | Direct column carried forward. |
| `ownership_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `ownership_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `ownership_types` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `password_resets` | `my_row_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `password_resets` | `email` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; extend via attribute_assignments when necessary. |
| `password_resets` | `token` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; extend via attribute_assignments when necessary. |
| `password_resets` | `created_at` | entity_credentials.created_at | Direct column carried forward. |
| `payment_attempts` | `id` | transaction_attempts.id | Direct column carried forward. |
| `payment_attempts` | `payment_id` | transaction_attempts | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payment_attempts` | `amount` | transaction_attempts | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payment_attempts` | `status` | transaction_attempts | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payment_attempts` | `error_message` | transaction_attempts.error_message | Direct column carried forward. |
| `payment_attempts` | `payment_method_id` | transaction_attempts | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payment_attempts` | `payment_intent_id` | transaction_attempts | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payment_attempts` | `payment_reference` | transaction_attempts | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payment_attempts` | `created_at` | transaction_attempts | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payment_attempts` | `updated_at` | transaction_attempts | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payment_attempts` | `deleted_at` | transaction_attempts | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payment_providers` | `id` | reference_values.id | Direct column carried forward. |
| `payment_providers` | `name` | reference_values.name | Direct column carried forward. |
| `payment_providers` | `is_default` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `payment_providers` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `payment_providers` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `payment_providers` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `payments` | `id` | financial_transactions.id | Direct column carried forward. |
| `payments` | `base_cost` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payments` | `vat_rate` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payments` | `gross_total` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payments` | `charge_outcome` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payments` | `created_at` | financial_transactions.created_at | Direct column carried forward. |
| `payments` | `updated_at` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `payments` | `deleted_at` | financial_transactions | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `permission_category` | `id` | reference_values.id | Direct column carried forward. |
| `permission_category` | `name` | reference_values.name | Direct column carried forward. |
| `permission_category` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `permission_category` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `permission_group_permission` | `id` | relationship_links.id | Direct column carried forward. |
| `permission_group_permission` | `permission_group_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `permission_group_permission` | `permission_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `permission_group_permission` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `permission_group_permission` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `permission_groups` | `id` | reference_values.id | Direct column carried forward. |
| `permission_groups` | `name` | reference_values.name | Direct column carried forward. |
| `permission_groups` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `permission_groups` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `permissions` | `id` | reference_values.id | Direct column carried forward. |
| `permissions` | `name` | reference_values.name | Direct column carried forward. |
| `permissions` | `guard_name` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `permissions` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `permissions` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `permissions` | `permission_category_id` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `permissions` | `parent_id` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `personal_access_tokens` | `id` | entity_credentials.id | Direct column carried forward. |
| `personal_access_tokens` | `tokenable_type` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; extend via attribute_assignments when necessary. |
| `personal_access_tokens` | `tokenable_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `personal_access_tokens` | `name` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; extend via attribute_assignments when necessary. |
| `personal_access_tokens` | `token` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; extend via attribute_assignments when necessary. |
| `personal_access_tokens` | `abilities` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; extend via attribute_assignments when necessary. |
| `personal_access_tokens` | `last_used_at` | entity_credentials.last_used_at | Direct column carried forward. |
| `personal_access_tokens` | `created_at` | entity_credentials.created_at | Direct column carried forward. |
| `personal_access_tokens` | `updated_at` | entity_credentials.updated_at | Direct column carried forward. |
| `profile_approval_status` | `id` | reference_values.id | Direct column carried forward. |
| `profile_approval_status` | `name` | reference_values.name | Direct column carried forward. |
| `profile_approval_status` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `profile_approval_status` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `provider_types` | `id` | reference_values.id | Direct column carried forward. |
| `provider_types` | `name` | reference_values.name | Direct column carried forward. |
| `provider_types` | `details` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `provider_types` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `provider_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `provider_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `purpose_credit_types` | `id` | reference_values.id | Direct column carried forward. |
| `purpose_credit_types` | `name` | reference_values.name | Direct column carried forward. |
| `purpose_credit_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `purpose_credit_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `purpose_credit_types` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `quote_note` | `id` | notes.id, note_links.id | Direct column carried forward. |
| `quote_note` | `quote_id` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `quote_note` | `notes` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `quote_note` | `deleted_at` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `quote_note` | `created_at` | notes.created_at | Direct column carried forward. |
| `quote_note` | `updated_at` | notes.updated_at | Direct column carried forward. |
| `quotes` | `id` | quotes.id | Direct column carried forward. |
| `quotes` | `drawdown_profile_id` | quotes | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes` | `quotes_status_id` | quotes | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes` | `deal_id` | quotes.deal_id | Direct column carried forward. |
| `quotes` | `file_id` | quotes | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes` | `notes` | quotes | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes` | `deleted_at` | quotes | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes` | `created_at` | quotes.created_at | Direct column carried forward. |
| `quotes` | `updated_at` | quotes | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes_recipients` | `id` | quote_recipients.id | Direct column carried forward. |
| `quotes_recipients` | `quote_id` | quote_recipients.quote_id | Direct column carried forward. |
| `quotes_recipients` | `client_individual_id` | quote_recipients | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes_recipients` | `used_email_address` | quote_recipients | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes_recipients` | `deleted_at` | quote_recipients | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes_recipients` | `created_at` | quote_recipients | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes_recipients` | `updated_at` | quote_recipients | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes_recipients` | `client_company_id` | quote_recipients | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes_recipients` | `client_group_id` | quote_recipients | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes_recipients` | `broker_agent_id` | quote_recipients | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `quotes_status` | `id` | reference_values.id | Direct column carried forward. |
| `quotes_status` | `name` | reference_values.name | Direct column carried forward. |
| `quotes_status` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `quotes_status` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `quotes_status` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `role_has_permissions` | `permission_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `role_has_permissions` | `role_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `roles` | `id` | reference_values.id, entity_credentials.id | Direct column carried forward. |
| `roles` | `name` | reference_values.name | Direct column carried forward. |
| `roles` | `guard_name` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `roles` | `created_at` | entity_credentials.created_at | Direct column carried forward. |
| `roles` | `updated_at` | entity_credentials.updated_at | Direct column carried forward. |
| `roles` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `scheduled_notifications` | `id` | notifications.id | Direct column carried forward. |
| `scheduled_notifications` | `deal_notification_rule_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `scheduled_notifications` | `scheduled_date` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `scheduled_notifications` | `enabled` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `scheduled_notifications` | `enabled_by_user_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `scheduled_notifications` | `sent` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `scheduled_notifications` | `datetime_sent` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `scheduled_notifications` | `subject_sent` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `scheduled_notifications` | `body_sent` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `scheduled_notifications` | `created_at` | notifications.created_at | Direct column carried forward. |
| `scheduled_notifications` | `updated_at` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `scheduled_notifications` | `deleted_at` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `scheduled_notifications` | `drawdown_event_id` | notifications | Notification blueprint. Context references live in structured columns or notification_targets rows. |
| `service_providers` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `service_providers` | `provider_type_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `service_providers` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `service_providers` | `created_at` | entities.created_at | Direct column carried forward. |
| `service_providers` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `service_providers` | `forename` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `service_providers` | `surname` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `service_providers` | `company` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `service_providers` | `email` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `service_providers` | `phone` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `service_providers` | `engagement_letter` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `sharepoint_updates_timestamps` | `id` | integration_settings.id | Direct column carried forward. |
| `sharepoint_updates_timestamps` | `last_update` | integration_settings | Integration configuration. Dedicated columns store endpoint and credential references. |
| `sharepoint_updates_timestamps` | `change_token` | integration_settings | Integration configuration. Dedicated columns store endpoint and credential references. |
| `stripe_settings` | `id` | integration_settings.id | Direct column carried forward. |
| `stripe_settings` | `name` | integration_settings | Integration configuration. Dedicated columns store endpoint and credential references. |
| `stripe_settings` | `stripe_key` | integration_settings | Integration configuration. Dedicated columns store endpoint and credential references. |
| `stripe_settings` | `stripe_secret` | integration_settings | Integration configuration. Dedicated columns store endpoint and credential references. |
| `stripe_settings` | `stripe_webhook_secret` | integration_settings | Integration configuration. Dedicated columns store endpoint and credential references. |
| `stripe_settings` | `created_at` | integration_settings.created_at | Direct column carried forward. |
| `stripe_settings` | `updated_at` | integration_settings.updated_at | Direct column carried forward. |
| `stripe_settings` | `deleted_at` | integration_settings | Integration configuration. Dedicated columns store endpoint and credential references. |
| `systems_deal_setting` | `id` | workflow_steps.id | Direct column carried forward. |
| `systems_deal_setting` | `name` | workflow_steps.name | Direct column carried forward. |
| `systems_deal_setting` | `order_id` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `systems_deal_setting` | `systems_deal_setting_group_id` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `systems_deal_setting` | `status` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `systems_deal_setting` | `deleted_at` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `systems_deal_setting` | `created_at` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `systems_deal_setting` | `updated_at` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `systems_deal_setting_groups` | `id` | reference_values.id | Direct column carried forward. |
| `systems_deal_setting_groups` | `name` | reference_values.name | Direct column carried forward. |
| `systems_deal_setting_groups` | `order_id` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `systems_deal_setting_groups` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `systems_deal_setting_groups` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `systems_deal_setting_groups` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `task` | `id` | workflow_steps.id | Direct column carried forward. |
| `task` | `name` | workflow_steps.name | Direct column carried forward. |
| `task` | `order_id` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `task` | `task_group_id` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `task` | `auto_assign_to_case_owner` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `task` | `deleted_at` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `task` | `created_at` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `task` | `updated_at` | workflow_steps | Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior. |
| `task_group` | `id` | workflow_definitions.id | Direct column carried forward. |
| `task_group` | `lending_type_id` | workflow_definitions | Workflow definition catalog. Persist structural details through workflow_steps and related tables. |
| `task_group` | `name` | workflow_definitions.name | Direct column carried forward. |
| `task_group` | `order_id` | workflow_definitions | Workflow definition catalog. Persist structural details through workflow_steps and related tables. |
| `task_group` | `deleted_at` | workflow_definitions | Workflow definition catalog. Persist structural details through workflow_steps and related tables. |
| `task_group` | `created_at` | workflow_definitions.created_at | Direct column carried forward. |
| `task_group` | `updated_at` | workflow_definitions.updated_at | Direct column carried forward. |
| `use_type` | `id` | reference_values.id | Direct column carried forward. |
| `use_type` | `name` | reference_values.name | Direct column carried forward. |
| `use_type` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `use_type` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `use_type` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `user_types` | `id` | reference_values.id | Direct column carried forward. |
| `user_types` | `role_id` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `user_types` | `name` | reference_values.name | Direct column carried forward. |
| `user_types` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `user_types` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `user_types` | `is_admin` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `user_types` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `users` | `id` | entities.id, entity_credentials.id | Direct column carried forward. |
| `users` | `type_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `users` | `company_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `users` | `avatar_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `users` | `first_name` | entities.first_name | Direct column carried forward. |
| `users` | `middle_name` | entities.middle_name | Direct column carried forward. |
| `users` | `last_name` | entities.last_name | Direct column carried forward. |
| `users` | `email` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `users` | `phone` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `users` | `email_verified_at` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `users` | `change_password_datetime` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `users` | `remember_token` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `users` | `verification_token` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `users` | `created_at` | entities.created_at, entity_credentials.created_at | Direct column carried forward. |
| `users` | `updated_at` | entities.updated_at, entity_credentials.updated_at | Direct column carried forward. |
| `users` | `stripe_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `users` | `pm_type` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `users` | `pm_last_four` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `users` | `trial_ends_at` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `users` | `is_active` | entities | Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments. |
| `users` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `users` | `payment_provider_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `users` | `file_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `valuation_statuses` | `id` | reference_values.id | Direct column carried forward. |
| `valuation_statuses` | `name` | reference_values.name | Direct column carried forward. |
| `valuation_statuses` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `valuation_statuses` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `valuation_statuses` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `valuations` | `id` | valuations.id | Direct column carried forward. |
| `valuations` | `asset_id` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `service_provider_id` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `document_id` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `currency_id` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `fee_option_id` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `valuation_status_id` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `report_received_date` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `date_expected` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `invoice_due_date` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `fee_amount` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `file_id` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `deleted_at` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `created_at` | valuations.created_at | Direct column carried forward. |
| `valuations` | `updated_at` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `valuations` | `report_requested_date` | valuations | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rate_settings` | `id` | reference_values.id | Direct column carried forward. |
| `variable_rate_settings` | `name` | reference_values.name | Direct column carried forward. |
| `variable_rate_settings` | `value` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `variable_rate_settings` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `variable_rate_settings` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `variable_rate_settings` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `variable_rate_sources` | `id` | reference_values.id | Direct column carried forward. |
| `variable_rate_sources` | `name` | reference_values.name | Direct column carried forward. |
| `variable_rate_sources` | `created_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `variable_rate_sources` | `updated_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `variable_rate_sources` | `deleted_at` | reference_values | Domain-driven lookup entry stored via shared reference framework. |
| `variable_rates` | `id` | pricing_schedules.id | Direct column carried forward. |
| `variable_rates` | `variable_rate_source_id` | pricing_schedules | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates` | `parent_id` | pricing_schedules | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates` | `rate` | pricing_schedules | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates` | `created_at` | pricing_schedules | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates` | `updated_at` | pricing_schedules | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates` | `deleted_at` | pricing_schedules | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates_history` | `id` | pricing_history.id | Direct column carried forward. |
| `variable_rates_history` | `date` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates_history` | `variable_rate_source_id` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates_history` | `rate` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates_history` | `created_at` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates_history` | `updated_at` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates_history` | `deleted_at` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates_history_copy1` | `id` | pricing_history.id | Direct column carried forward. |
| `variable_rates_history_copy1` | `date` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates_history_copy1` | `variable_rate_source_id` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates_history_copy1` | `rate` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates_history_copy1` | `created_at` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
| `variable_rates_history_copy1` | `updated_at` | pricing_history | Use attribute_assignments or related detail tables introduced in the refactored schema. |
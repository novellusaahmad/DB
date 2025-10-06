# Comprehensive Legacy-to-Refactored Column Mapping

This table enumerates every column defined in the legacy `ddl.sql` schema and captures its default landing zone inside the refactored design. Mappings are derived by cross-referencing `refactored_ddl.sh` with shared column names in `refactored_ddl.sql`. Columns without a direct twin are annotated with the canonical pattern to use during migration.

| Legacy table | Legacy column | Target structure | Mapping guidance |
| --- | --- | --- | --- |
| `activity_log` | `id` | audit_events.id | Direct column carried forward. |
| `activity_log` | `log_name` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `activity_log` | `description` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `activity_log` | `subject_type` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `activity_log` | `event` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `activity_log` | `subject_id` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `activity_log` | `causer_type` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `activity_log` | `causer_id` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `activity_log` | `properties` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `activity_log` | `batch_uuid` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `activity_log` | `created_at` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `activity_log` | `updated_at` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `activity_log` | `deleted_at` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `addresses` | `id` | postal_addresses.id | Direct column carried forward. |
| `addresses` | `ownership_type_id` | postal_addresses.metadata | Preserve `ownership_type_id` inside metadata JSON payload. |
| `addresses` | `postcode` | postal_addresses.postcode | Direct column carried forward. |
| `addresses` | `country` | postal_addresses.metadata | Preserve `country` inside metadata JSON payload. |
| `addresses` | `county` | postal_addresses.county | Direct column carried forward. |
| `addresses` | `city` | postal_addresses.city | Direct column carried forward. |
| `addresses` | `district` | postal_addresses.district | Direct column carried forward. |
| `addresses` | `street` | postal_addresses.street | Direct column carried forward. |
| `addresses` | `house_number` | postal_addresses.house_number | Direct column carried forward. |
| `addresses` | `lived_for_months` | postal_addresses.metadata | Preserve `lived_for_months` inside metadata JSON payload. |
| `addresses` | `lived_for_years` | postal_addresses.metadata | Preserve `lived_for_years` inside metadata JSON payload. |
| `addresses` | `created_at` | postal_addresses.created_at | Direct column carried forward. |
| `addresses` | `updated_at` | postal_addresses.updated_at | Direct column carried forward. |
| `addresses` | `deleted_at` | postal_addresses.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `admins` | `id` | entities.id, entity_credentials.id | Direct column carried forward. |
| `admins` | `title` | entities.title | Direct column carried forward. |
| `admins` | `first_name` | entities.first_name | Direct column carried forward. |
| `admins` | `middle_name` | entities.middle_name | Direct column carried forward. |
| `admins` | `last_name` | entities.last_name | Direct column carried forward. |
| `admins` | `email` | entities.metadata | Preserve `email` inside metadata JSON payload. |
| `admins` | `phone` | entities.metadata | Preserve `phone` inside metadata JSON payload. |
| `admins` | `created_at` | entities.created_at, entity_credentials.created_at | Direct column carried forward. |
| `admins` | `updated_at` | entities.updated_at, entity_credentials.updated_at | Direct column carried forward. |
| `admins` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `asset_addresses` | `id` | address_links.id | Direct column carried forward. |
| `asset_addresses` | `postcode` | address_links.metadata | Preserve `postcode` inside metadata JSON payload. |
| `asset_addresses` | `country` | address_links.metadata | Preserve `country` inside metadata JSON payload. |
| `asset_addresses` | `county` | address_links.metadata | Preserve `county` inside metadata JSON payload. |
| `asset_addresses` | `city` | address_links.metadata | Preserve `city` inside metadata JSON payload. |
| `asset_addresses` | `district` | address_links.metadata | Preserve `district` inside metadata JSON payload. |
| `asset_addresses` | `street` | address_links.metadata | Preserve `street` inside metadata JSON payload. |
| `asset_addresses` | `house_number` | address_links.metadata | Preserve `house_number` inside metadata JSON payload. |
| `asset_addresses` | `created_at` | address_links.created_at | Direct column carried forward. |
| `asset_addresses` | `updated_at` | address_links.updated_at | Direct column carried forward. |
| `asset_addresses` | `deleted_at` | address_links.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `asset_client_companies` | `id` | address_links.id | Direct column carried forward. |
| `asset_client_companies` | `asset_id` | address_links.address_id | Linked to shared address row via address_id. |
| `asset_client_companies` | `client_company_id` | address_links.address_id | Linked to shared address row via address_id. |
| `asset_client_companies` | `created_at` | address_links.created_at | Direct column carried forward. |
| `asset_client_companies` | `updated_at` | address_links.updated_at | Direct column carried forward. |
| `asset_client_companies` | `deleted_at` | address_links.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `asset_client_individuals` | `id` | address_links.id | Direct column carried forward. |
| `asset_client_individuals` | `asset_id` | address_links.address_id | Linked to shared address row via address_id. |
| `asset_client_individuals` | `client_individual_id` | address_links.address_id | Linked to shared address row via address_id. |
| `asset_client_individuals` | `created_at` | address_links.created_at | Direct column carried forward. |
| `asset_client_individuals` | `updated_at` | address_links.updated_at | Direct column carried forward. |
| `asset_client_individuals` | `deleted_at` | address_links.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `asset_insurance_notes` | `id` | attribute_assignments.id | Direct column carried forward. |
| `asset_insurance_notes` | `asset_insurance_id` | attribute_assignments.owner_id | Mapped into owner identifier. |
| `asset_insurance_notes` | `note_id` | attribute_assignments.owner_id | Mapped into owner identifier. |
| `asset_insurance_notes` | `created_at` | attribute_assignments.created_at | Direct column carried forward. |
| `asset_insurance_notes` | `updated_at` | attribute_assignments.updated_at | Direct column carried forward. |
| `asset_insurance_notes` | `deleted_at` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `asset_insurance_type` | `id` | reference_values.id | Direct column carried forward. |
| `asset_insurance_type` | `name` | reference_values.name | Direct column carried forward. |
| `asset_insurance_type` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `asset_insurance_type` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `asset_insurances` | `id` | asset_coverages.id | Direct column carried forward. |
| `asset_insurances` | `asset_id` | asset_coverages.asset_id | Direct column carried forward. |
| `asset_insurances` | `policy_number` | asset_coverages.policy_number | Direct column carried forward. |
| `asset_insurances` | `is_novellus_nominated_payee` | asset_coverages.metadata | Preserve `is_novellus_nominated_payee` inside metadata JSON payload. |
| `asset_insurances` | `type_loss_payee` | asset_coverages.metadata | Preserve `type_loss_payee` inside metadata JSON payload. |
| `asset_insurances` | `expiry_date` | asset_coverages.metadata | Preserve `expiry_date` inside metadata JSON payload. |
| `asset_insurances` | `sum_insured` | asset_coverages.metadata | Preserve `sum_insured` inside metadata JSON payload. |
| `asset_insurances` | `created_at` | asset_coverages.metadata | Preserve `created_at` inside metadata JSON payload. |
| `asset_insurances` | `updated_at` | asset_coverages.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `asset_insurances` | `deleted_at` | asset_coverages.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `asset_insurances` | `asset_insurance_type_id` | asset_coverages.metadata | Preserve `asset_insurance_type_id` inside metadata JSON payload. |
| `asset_types` | `id` | reference_values.id | Direct column carried forward. |
| `asset_types` | `name` | reference_values.name | Direct column carried forward. |
| `asset_types` | `max_ltv` | reference_values.metadata | Preserve `max_ltv` inside metadata JSON payload. |
| `asset_types` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `asset_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `asset_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `assets` | `id` | assets.id | Direct column carried forward. |
| `assets` | `asset_type_id` | assets.metadata | Preserve `asset_type_id` inside metadata JSON payload. |
| `assets` | `client_group_id` | assets.metadata | Preserve `client_group_id` inside metadata JSON payload. |
| `assets` | `name` | assets.metadata | Preserve `name` inside metadata JSON payload. |
| `assets` | `security` | assets.metadata | Preserve `security` inside metadata JSON payload. |
| `assets` | `jointly_owned` | assets.metadata | Preserve `jointly_owned` inside metadata JSON payload. |
| `assets` | `independent_valuation` | assets.metadata | Preserve `independent_valuation` inside metadata JSON payload. |
| `assets` | `internal_valuation` | assets.metadata | Preserve `internal_valuation` inside metadata JSON payload. |
| `assets` | `asset_description` | assets.metadata | Preserve `asset_description` inside metadata JSON payload. |
| `assets` | `deleted_at` | assets.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `assets` | `created_at` | assets.created_at | Direct column carried forward. |
| `assets` | `updated_at` | assets.updated_at | Direct column carried forward. |
| `assets` | `asset_address_id` | assets.metadata | Preserve `asset_address_id` inside metadata JSON payload. |
| `assets` | `deal_id` | assets.metadata | Preserve `deal_id` inside metadata JSON payload. |
| `assets` | `use_type_id` | assets.metadata | Preserve `use_type_id` inside metadata JSON payload. |
| `assets` | `insurance_expiry_date` | assets.metadata | Preserve `insurance_expiry_date` inside metadata JSON payload. |
| `attribute_entities` | `id` | attribute_assignments.id | Direct column carried forward. |
| `attribute_entities` | `name` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `attribute_entities` | `class` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `attribute_entities` | `created_at` | attribute_assignments.created_at | Direct column carried forward. |
| `attribute_entities` | `updated_at` | attribute_assignments.updated_at | Direct column carried forward. |
| `attribute_entities` | `deleted_at` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `attribute_groups` | `id` | attribute_definitions.id | Direct column carried forward. |
| `attribute_groups` | `attribute_entity_id` | attribute_definitions.metadata | Preserve `attribute_entity_id` inside metadata JSON payload. |
| `attribute_groups` | `name` | attribute_definitions.name | Direct column carried forward. |
| `attribute_groups` | `created_at` | attribute_definitions.metadata | Preserve `created_at` inside metadata JSON payload. |
| `attribute_groups` | `updated_at` | attribute_definitions.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `attribute_groups` | `deleted_at` | attribute_definitions.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `attribute_types` | `id` | attribute_definitions.id | Direct column carried forward. |
| `attribute_types` | `name` | attribute_definitions.name | Direct column carried forward. |
| `attribute_types` | `created_at` | attribute_definitions.metadata | Preserve `created_at` inside metadata JSON payload. |
| `attribute_types` | `updated_at` | attribute_definitions.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `attribute_types` | `is_system_type` | attribute_definitions.metadata | Preserve `is_system_type` inside metadata JSON payload. |
| `attribute_types` | `deleted_at` | attribute_definitions.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `attribute_values` | `id` | attribute_assignments.id | Direct column carried forward. |
| `attribute_values` | `client_form_id` | attribute_assignments.owner_id | Mapped into owner identifier. |
| `attribute_values` | `attribute_id` | attribute_assignments.owner_id | Mapped into owner identifier. |
| `attribute_values` | `value` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `attribute_values` | `created_at` | attribute_assignments.created_at | Direct column carried forward. |
| `attribute_values` | `updated_at` | attribute_assignments.updated_at | Direct column carried forward. |
| `attribute_values` | `deleted_at` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `attributes` | `id` | attribute_definitions.id | Direct column carried forward. |
| `attributes` | `parent_id` | attribute_definitions.metadata | Preserve `parent_id` inside metadata JSON payload. |
| `attributes` | `attribute_batch` | attribute_definitions.metadata | Preserve `attribute_batch` inside metadata JSON payload. |
| `attributes` | `attribute_group_id` | attribute_definitions.metadata | Preserve `attribute_group_id` inside metadata JSON payload. |
| `attributes` | `attribute_type_id` | attribute_definitions.metadata | Preserve `attribute_type_id` inside metadata JSON payload. |
| `attributes` | `reference` | attribute_definitions.metadata | Preserve `reference` inside metadata JSON payload. |
| `attributes` | `is_system_attribute` | attribute_definitions.metadata | Preserve `is_system_attribute` inside metadata JSON payload. |
| `attributes` | `created_at` | attribute_definitions.metadata | Preserve `created_at` inside metadata JSON payload. |
| `attributes` | `updated_at` | attribute_definitions.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `attributes` | `field_name` | attribute_definitions.metadata | Preserve `field_name` inside metadata JSON payload. |
| `attributes` | `deleted_at` | attribute_definitions.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `audit` | `id` | audit_events.id | Direct column carried forward. |
| `audit` | `user_id` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `model` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `model_id` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `deal_id` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `event_group_id` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `event_type` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `record_created` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `field` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `field_name` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `from_data` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `from_data_text` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `to_data` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `to_data_text` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `created_at` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `updated_at` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `audit` | `deleted_at` | audit_events | Audit timeline. Map actor/scope identifiers and persist payload-specific fields inside changes_json. |
| `bank_details` | `id` | financial_accounts.id | Direct column carried forward. |
| `bank_details` | `sort_code` | financial_accounts.sort_code | Direct column carried forward. |
| `bank_details` | `account_number` | financial_accounts.metadata | Preserve `account_number` inside metadata JSON payload. |
| `bank_details` | `bic` | financial_accounts.bic | Direct column carried forward. |
| `bank_details` | `iban` | financial_accounts.iban | Direct column carried forward. |
| `bank_details` | `created_at` | financial_accounts.created_at | Direct column carried forward. |
| `bank_details` | `updated_at` | financial_accounts.updated_at | Direct column carried forward. |
| `bank_details` | `deleted_at` | financial_accounts.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `borrowers` | `id` | relationship_links.id | Direct column carried forward. |
| `borrowers` | `deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `client_individual_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `client_company_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `client_group_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `admin_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `guarantor_individual_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `guarantor_corporate_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `borrowers` | `main_contact` | relationship_links.metadata | Preserve `main_contact` inside metadata JSON payload. |
| `borrowers` | `administrator` | relationship_links.metadata | Preserve `administrator` inside metadata JSON payload. |
| `borrowers` | `guarantor` | relationship_links.metadata | Preserve `guarantor` inside metadata JSON payload. |
| `borrowers` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `borrowers` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `borrowers` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `bridge_drawdown_types` | `id` | reference_values.id | Direct column carried forward. |
| `bridge_drawdown_types` | `name` | reference_values.name | Direct column carried forward. |
| `bridge_drawdown_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `bridge_drawdown_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `broker_agent_deals` | `id` | relationship_links.id | Direct column carried forward. |
| `broker_agent_deals` | `broker_agent_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `broker_agent_deals` | `broker_agent_main_contact` | relationship_links.metadata | Preserve `broker_agent_main_contact` inside metadata JSON payload. |
| `broker_agent_deals` | `deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `broker_agent_deals` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `broker_agent_deals` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `broker_agent_deals` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `broker_agent_notes` | `id` | note_links.id | Direct column carried forward. |
| `broker_agent_notes` | `broker_agent_id` | note_links | Polymorphic note attachment. Use notable_type/notable_id with supporting metadata. |
| `broker_agent_notes` | `note_id` | note_links.note_id | Direct column carried forward. |
| `broker_agent_notes` | `created_at` | note_links | Polymorphic note attachment. Use notable_type/notable_id with supporting metadata. |
| `broker_agent_notes` | `updated_at` | note_links | Polymorphic note attachment. Use notable_type/notable_id with supporting metadata. |
| `broker_agent_notes` | `deleted_at` | note_links | Polymorphic note attachment. Use notable_type/notable_id with supporting metadata. |
| `broker_agent_notes` | `negative_relationship` | note_links | Polymorphic note attachment. Use notable_type/notable_id with supporting metadata. |
| `broker_agents` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `broker_agents` | `broker_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `broker_agents` | `user_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `broker_agents` | `name` | entities.metadata | Preserve `name` inside metadata JSON payload. |
| `broker_agents` | `email` | entities.metadata | Preserve `email` inside metadata JSON payload. |
| `broker_agents` | `phone` | entities.metadata | Preserve `phone` inside metadata JSON payload. |
| `broker_agents` | `bank_details_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `broker_agents` | `questionable` | entities.metadata | Preserve `questionable` inside metadata JSON payload. |
| `broker_agents` | `created_at` | entities.created_at | Direct column carried forward. |
| `broker_agents` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `broker_agents` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `broker_agents` | `address_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `broker_agents` | `landline` | entities.metadata | Preserve `landline` inside metadata JSON payload. |
| `broker_agents` | `mobile` | entities.metadata | Preserve `mobile` inside metadata JSON payload. |
| `broker_notes` | `id` | notes.id, note_links.id | Direct column carried forward. |
| `broker_notes` | `broker_id` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `broker_notes` | `note_id` | note_links.note_id | Direct column carried forward. |
| `broker_notes` | `created_at` | notes.created_at | Direct column carried forward. |
| `broker_notes` | `updated_at` | notes.updated_at | Direct column carried forward. |
| `broker_notes` | `deleted_at` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `brokers` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `brokers` | `name` | entities.metadata | Preserve `name` inside metadata JSON payload. |
| `brokers` | `email` | entities.metadata | Preserve `email` inside metadata JSON payload. |
| `brokers` | `phone` | entities.metadata | Preserve `phone` inside metadata JSON payload. |
| `brokers` | `commission_rate` | entities.metadata | Preserve `commission_rate` inside metadata JSON payload. |
| `brokers` | `created_at` | entities.created_at | Direct column carried forward. |
| `brokers` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `brokers` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `brokers` | `engagement_letter` | entities.metadata | Preserve `engagement_letter` inside metadata JSON payload. |
| `brokers` | `address_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `brokers` | `landline` | entities.metadata | Preserve `landline` inside metadata JSON payload. |
| `brokers` | `mobile` | entities.metadata | Preserve `mobile` inside metadata JSON payload. |
| `brokers` | `location` | entities.metadata | Preserve `location` inside metadata JSON payload. |
| `brokers` | `secondary_phone` | entities.metadata | Preserve `secondary_phone` inside metadata JSON payload. |
| `brokers` | `bank_details_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `brokers` | `point_of_contact_name` | entities.metadata | Preserve `point_of_contact_name` inside metadata JSON payload. |
| `ccr_reports` | `id` | documents.id | Direct column carried forward. |
| `ccr_reports` | `title` | documents.title | Direct column carried forward. |
| `ccr_reports` | `created_at` | documents.metadata | Preserve `created_at` inside metadata JSON payload. |
| `ccr_reports` | `updated_at` | documents.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `ccr_reports` | `file_id` | documents.file_id | Direct column carried forward. |
| `ccr_reports` | `deleted_at` | documents.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `charge_types` | `id` | reference_values.id | Direct column carried forward. |
| `charge_types` | `name` | reference_values.name | Direct column carried forward. |
| `charge_types` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `charge_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `charge_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `charges` | `id` | financial_transactions.id | Direct column carried forward. |
| `charges` | `parent_id` | financial_transactions.metadata | Preserve `parent_id` inside metadata JSON payload. |
| `charges` | `charge` | financial_transactions.metadata | Preserve `charge` inside metadata JSON payload. |
| `charges` | `date` | financial_transactions.metadata | Preserve `date` inside metadata JSON payload. |
| `charges` | `note` | financial_transactions.metadata | Preserve `note` inside metadata JSON payload. |
| `charges` | `removed` | financial_transactions.metadata | Preserve `removed` inside metadata JSON payload. |
| `charges` | `asset_id` | financial_transactions.metadata | Preserve `asset_id` inside metadata JSON payload. |
| `charges` | `lender_id` | financial_transactions.metadata | Preserve `lender_id` inside metadata JSON payload. |
| `charges` | `charge_type_id` | financial_transactions.metadata | Preserve `charge_type_id` inside metadata JSON payload. |
| `charges` | `deleted_at` | financial_transactions.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `charges` | `created_at` | financial_transactions.created_at | Direct column carried forward. |
| `charges` | `updated_at` | financial_transactions.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `client_companies` | `id` | entities.id | Direct column carried forward. |
| `client_companies` | `company_id` | entities.metadata | Preserve `company_id` inside metadata JSON payload. |
| `client_companies` | `name` | entities.metadata | Preserve `name` inside metadata JSON payload. |
| `client_companies` | `email` | entities.metadata | Preserve `email` inside metadata JSON payload. |
| `client_companies` | `phone` | entities.metadata | Preserve `phone` inside metadata JSON payload. |
| `client_companies` | `created_at` | entities.created_at | Direct column carried forward. |
| `client_companies` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `client_companies` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `client_companies` | `address_id` | entities.metadata | Preserve `address_id` inside metadata JSON payload. |
| `client_companies` | `landline` | entities.metadata | Preserve `landline` inside metadata JSON payload. |
| `client_companies` | `mobile` | entities.metadata | Preserve `mobile` inside metadata JSON payload. |
| `client_companies` | `bank_details` | entities.metadata | Preserve `bank_details` inside metadata JSON payload. |
| `client_companies` | `bank_details_id` | entities.metadata | Preserve `bank_details_id` inside metadata JSON payload. |
| `client_company_clients` | `id` | relationship_links.id | Direct column carried forward. |
| `client_company_clients` | `client_company_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_company_clients` | `client_individual_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_company_clients` | `shareholding_percentage` | relationship_links.metadata | Preserve `shareholding_percentage` inside metadata JSON payload. |
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
| `client_form_attachments` | `client_form_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `client_form_attachments` | `file_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `client_form_attachments` | `form_attribute_reference` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `client_form_attachments` | `deleted_at` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `client_form_attachments` | `created_at` | document_links.created_at | Direct column carried forward. |
| `client_form_attachments` | `updated_at` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `client_form_status` | `id` | reference_values.id | Direct column carried forward. |
| `client_form_status` | `name` | reference_values.name | Direct column carried forward. |
| `client_form_status` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `client_form_status` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `client_form_status` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `client_forms` | `id` | forms.id | Direct column carried forward. |
| `client_forms` | `client_form_hash` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `form_id` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `client_form_batch_id` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `paid` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `deal_id` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `broker_agent_id` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `main_recipient` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `client_id` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `client_company_id` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `client_group_id` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `form_data_json` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `sent_by_user_id` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `form_sent_at` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `form_populated_at` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `form_completed_at` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `docusign_document_sent` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `created_at` | forms.created_at | Direct column carried forward. |
| `client_forms` | `updated_at` | forms.updated_at | Direct column carried forward. |
| `client_forms` | `client_form_status_id` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `docusign_envelope_id` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `docusign_completed_datetime` | forms | Requires case-by-case migration scripting. |
| `client_forms` | `deleted_at` | forms | Requires case-by-case migration scripting. |
| `client_group_clients` | `id` | relationship_links.id | Direct column carried forward. |
| `client_group_clients` | `client_group_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_group_clients` | `client_company_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_group_clients` | `client_individual_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_group_clients` | `group_leader` | relationship_links.metadata | Preserve `group_leader` inside metadata JSON payload. |
| `client_group_clients` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `client_group_clients` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `client_group_clients` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `client_groups` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `client_groups` | `company_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_groups` | `name` | entities.metadata | Preserve `name` inside metadata JSON payload. |
| `client_groups` | `email` | entities.metadata | Preserve `email` inside metadata JSON payload. |
| `client_groups` | `phone` | entities.metadata | Preserve `phone` inside metadata JSON payload. |
| `client_groups` | `created_at` | entities.created_at | Direct column carried forward. |
| `client_groups` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `client_groups` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `client_groups` | `landline` | entities.metadata | Preserve `landline` inside metadata JSON payload. |
| `client_groups` | `mobile` | entities.metadata | Preserve `mobile` inside metadata JSON payload. |
| `client_groups` | `bank_details` | entities.metadata | Preserve `bank_details` inside metadata JSON payload. |
| `client_groups` | `address_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_groups` | `bank_details_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `client_individual_credit_data` | `id` | attribute_assignments.id | Direct column carried forward. |
| `client_individual_credit_data` | `client_individual_id` | attribute_assignments.owner_id | Mapped into owner identifier. |
| `client_individual_credit_data` | `input_dob` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `input_name` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `input_surname` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `input_county` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `risk_factor` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `num_defaulter` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `num_drn` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `num_shareholding` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `num_pia` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `num_directorship_prev` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `num_disqualification` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `num_pc` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `num_directorship` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `num_bankruptcy` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `num_dsa` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `num_judgment` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `num_business_name` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_credit_data` | `created_at` | attribute_assignments.created_at | Direct column carried forward. |
| `client_individual_credit_data` | `updated_at` | attribute_assignments.updated_at | Direct column carried forward. |
| `client_individual_credit_data` | `deleted_at` | attribute_assignments | Key-value attribute framework storing dynamic fields. |
| `client_individual_notes` | `id` | notes.id, note_links.id | Direct column carried forward. |
| `client_individual_notes` | `client_individual_id` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `client_individual_notes` | `note_id` | note_links.note_id | Direct column carried forward. |
| `client_individual_notes` | `created_at` | notes.created_at | Direct column carried forward. |
| `client_individual_notes` | `updated_at` | notes.updated_at | Direct column carried forward. |
| `client_individual_notes` | `deleted_at` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `client_individuals` | `id` | entities.id | Direct column carried forward. |
| `client_individuals` | `address_id` | entities.metadata | Preserve `address_id` inside metadata JSON payload. |
| `client_individuals` | `previous_address_id` | entities.metadata | Preserve `previous_address_id` inside metadata JSON payload. |
| `client_individuals` | `user_id` | entities.metadata | Preserve `user_id` inside metadata JSON payload. |
| `client_individuals` | `permanent_uk_resident` | entities.metadata | Preserve `permanent_uk_resident` inside metadata JSON payload. |
| `client_individuals` | `name_title_id` | entities.metadata | Preserve `name_title_id` inside metadata JSON payload. |
| `client_individuals` | `marital_status_id` | entities.metadata | Preserve `marital_status_id` inside metadata JSON payload. |
| `client_individuals` | `total_gross_income` | entities.metadata | Preserve `total_gross_income` inside metadata JSON payload. |
| `client_individuals` | `employment_status` | entities.metadata | Preserve `employment_status` inside metadata JSON payload. |
| `client_individuals` | `residency_status` | entities.metadata | Preserve `residency_status` inside metadata JSON payload. |
| `client_individuals` | `job_title` | entities.metadata | Preserve `job_title` inside metadata JSON payload. |
| `client_individuals` | `nature_of_business` | entities.metadata | Preserve `nature_of_business` inside metadata JSON payload. |
| `client_individuals` | `employer_name` | entities.metadata | Preserve `employer_name` inside metadata JSON payload. |
| `client_individuals` | `passport_number` | entities.metadata | Preserve `passport_number` inside metadata JSON payload. |
| `client_individuals` | `is_administrator_only` | entities.metadata | Preserve `is_administrator_only` inside metadata JSON payload. |
| `client_individuals` | `dob_day` | entities.metadata | Preserve `dob_day` inside metadata JSON payload. |
| `client_individuals` | `dob_month` | entities.metadata | Preserve `dob_month` inside metadata JSON payload. |
| `client_individuals` | `dob_year` | entities.metadata | Preserve `dob_year` inside metadata JSON payload. |
| `client_individuals` | `previous_names` | entities.metadata | Preserve `previous_names` inside metadata JSON payload. |
| `client_individuals` | `nationality` | entities.metadata | Preserve `nationality` inside metadata JSON payload. |
| `client_individuals` | `created_at` | entities.created_at | Direct column carried forward. |
| `client_individuals` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `client_individuals` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `companies` | `id` | entities.id | Direct column carried forward. |
| `companies` | `name` | entities.metadata | Preserve `name` inside metadata JSON payload. |
| `companies` | `created_at` | entities.created_at | Direct column carried forward. |
| `companies` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `companies` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `currencies` | `id` | reference_values.id | Direct column carried forward. |
| `currencies` | `label` | reference_values.metadata | Preserve `label` inside metadata JSON payload. |
| `currencies` | `currency_code` | reference_values.metadata | Preserve `currency_code` inside metadata JSON payload. |
| `currencies` | `prefix` | reference_values.metadata | Preserve `prefix` inside metadata JSON payload. |
| `currencies` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `currencies` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `currencies` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `deal_aborted_reasons` | `id` | reference_values.id | Direct column carried forward. |
| `deal_aborted_reasons` | `title` | reference_values.metadata | Preserve `title` inside metadata JSON payload. |
| `deal_aborted_reasons` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `deal_aborted_reasons` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `deal_aborted_reasons` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `deal_activities` | `id` | workflow_events.id | Direct column carried forward. |
| `deal_activities` | `deal_id` | workflow_events.metadata | Preserve `deal_id` inside metadata JSON payload. |
| `deal_activities` | `note` | workflow_events.metadata | Preserve `note` inside metadata JSON payload. |
| `deal_activities` | `user_id` | workflow_events.metadata | Preserve `user_id` inside metadata JSON payload. |
| `deal_activities` | `audit_id` | workflow_events.metadata | Preserve `audit_id` inside metadata JSON payload. |
| `deal_activities` | `file_id` | workflow_events.metadata | Preserve `file_id` inside metadata JSON payload. |
| `deal_activities` | `deleted_at` | workflow_events.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `deal_activities` | `created_at` | workflow_events.metadata | Preserve `created_at` inside metadata JSON payload. |
| `deal_activities` | `updated_at` | workflow_events.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `deal_activities` | `date` | workflow_events.metadata | Preserve `date` inside metadata JSON payload. |
| `deal_activities` | `time_taken` | workflow_events.metadata | Preserve `time_taken` inside metadata JSON payload. |
| `deal_document_categories` | `id` | reference_values.id | Direct column carried forward. |
| `deal_document_categories` | `sharepoint_unique_id` | reference_values.metadata | Preserve `sharepoint_unique_id` inside metadata JSON payload. |
| `deal_document_categories` | `folder_path` | reference_values.metadata | Preserve `folder_path` inside metadata JSON payload. |
| `deal_document_categories` | `parent_id` | reference_values.metadata | Preserve `parent_id` inside metadata JSON payload. |
| `deal_document_categories` | `name` | reference_values.name | Direct column carried forward. |
| `deal_document_categories` | `file_count` | reference_values.metadata | Preserve `file_count` inside metadata JSON payload. |
| `deal_document_categories` | `deal_id` | reference_values.metadata | Preserve `deal_id` inside metadata JSON payload. |
| `deal_document_categories` | `size` | reference_values.metadata | Preserve `size` inside metadata JSON payload. |
| `deal_document_categories` | `last_updated` | reference_values.metadata | Preserve `last_updated` inside metadata JSON payload. |
| `deal_document_categories` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `deal_document_categories` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `deal_document_categories` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `deal_document_categories_data` | `id` | document_links.id | Direct column carried forward. |
| `deal_document_categories_data` | `deal_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_document_categories_data` | `deal_document_category_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_document_categories_data` | `file_count` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_document_categories_data` | `size` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_document_categories_data` | `last_updated` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_document_categories_data` | `deleted_at` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_document_categories_data` | `created_at` | document_links.created_at | Direct column carried forward. |
| `deal_document_categories_data` | `updated_at` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_document_risk` | `id` | reference_values.id | Direct column carried forward. |
| `deal_document_risk` | `name` | reference_values.name | Direct column carried forward. |
| `deal_document_risk` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `deal_document_risk` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `deal_document_risk` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `deal_documents` | `id` | document_links.id | Direct column carried forward. |
| `deal_documents` | `deal_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_documents` | `file_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_documents` | `deal_document_category_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_documents` | `borrower_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_documents` | `client_company_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_documents` | `deal_document_risk_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_documents` | `client_individual_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_documents` | `asset_id` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_documents` | `description` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_documents` | `deleted_at` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
| `deal_documents` | `created_at` | document_links.created_at | Direct column carried forward. |
| `deal_documents` | `updated_at` | document_links | Document attachment join. Map owning model via documentable_type/documentable_id and preserve traits in metadata. |
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
| `deal_notification_rules` | `deal_id` | notification_templates.metadata | Preserve `deal_id` inside metadata JSON payload. |
| `deal_notification_rules` | `drawdown_event_type_id` | notification_templates.metadata | Preserve `drawdown_event_type_id` inside metadata JSON payload. |
| `deal_notification_rules` | `file_id` | notification_templates.metadata | Preserve `file_id` inside metadata JSON payload. |
| `deal_notification_rules` | `notification_rule_id` | notification_templates.metadata | Preserve `notification_rule_id` inside metadata JSON payload. |
| `deal_notification_rules` | `scheduled_for` | notification_templates.metadata | Preserve `scheduled_for` inside metadata JSON payload. |
| `deal_notification_rules` | `interval_type` | notification_templates.metadata | Preserve `interval_type` inside metadata JSON payload. |
| `deal_notification_rules` | `subject` | notification_templates.subject | Direct column carried forward. |
| `deal_notification_rules` | `body` | notification_templates.body | Direct column carried forward. |
| `deal_notification_rules` | `deleted_at` | notification_templates.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `deal_notification_rules` | `created_at` | notifications.created_at, notification_templates.created_at | Direct column carried forward. |
| `deal_notification_rules` | `updated_at` | notification_templates.updated_at | Direct column carried forward. |
| `deal_notification_rules` | `scheduled_date` | notification_templates.metadata | Preserve `scheduled_date` inside metadata JSON payload. |
| `deal_notification_rules` | `notification_template_id` | notification_templates.metadata | Preserve `notification_template_id` inside metadata JSON payload. |
| `deal_notification_rules_recipients` | `id` | notification_targets.id | Direct column carried forward. |
| `deal_notification_rules_recipients` | `deal_notification_rule_id` | notification_targets.target_id | Mapped into generic target identifier. |
| `deal_notification_rules_recipients` | `client_individual_id` | notification_targets.target_id | Mapped into generic target identifier. |
| `deal_notification_rules_recipients` | `deleted_at` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with channel flags in metadata. |
| `deal_notification_rules_recipients` | `created_at` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with channel flags in metadata. |
| `deal_notification_rules_recipients` | `updated_at` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with channel flags in metadata. |
| `deal_rate_floors` | `id` | deal_terms.id | Direct column carried forward. |
| `deal_rate_floors` | `variable_source_id` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns; extra levers live in metadata. |
| `deal_rate_floors` | `deal_id` | deal_terms.deal_id | Direct column carried forward. |
| `deal_rate_floors` | `floor_rate` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns; extra levers live in metadata. |
| `deal_rate_floors` | `deleted_at` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns; extra levers live in metadata. |
| `deal_setting_groups` | `id` | workflow_definitions.id | Direct column carried forward. |
| `deal_setting_groups` | `name` | workflow_definitions.name | Direct column carried forward. |
| `deal_setting_groups` | `order_id` | workflow_definitions | Workflow definition catalog. Persist legacy configuration inside definition_json or metadata structures. |
| `deal_setting_groups` | `deal_id` | workflow_definitions | Workflow definition catalog. Persist legacy configuration inside definition_json or metadata structures. |
| `deal_setting_groups` | `deleted_at` | workflow_definitions | Workflow definition catalog. Persist legacy configuration inside definition_json or metadata structures. |
| `deal_setting_groups` | `created_at` | workflow_definitions.created_at | Direct column carried forward. |
| `deal_setting_groups` | `updated_at` | workflow_definitions.updated_at | Direct column carried forward. |
| `deal_settings` | `id` | workflow_steps.id, deal_settings.id | Direct column carried forward. |
| `deal_settings` | `name` | workflow_steps.name | Direct column carried forward. |
| `deal_settings` | `status` | workflow_steps.metadata | Preserve `status` inside metadata JSON payload. |
| `deal_settings` | `order_id` | workflow_steps.metadata | Preserve `order_id` inside metadata JSON payload. |
| `deal_settings` | `deal_setting_group_id` | workflow_steps.metadata | Preserve `deal_setting_group_id` inside metadata JSON payload. |
| `deal_settings` | `deleted_at` | workflow_steps.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `deal_settings` | `created_at` | deal_settings.created_at | Direct column carried forward. |
| `deal_settings` | `updated_at` | deal_settings.updated_at | Direct column carried forward. |
| `deal_statuses` | `id` | reference_values.id | Direct column carried forward. |
| `deal_statuses` | `name` | reference_values.name | Direct column carried forward. |
| `deal_statuses` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `deal_statuses` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `deal_statuses` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `deal_task` | `id` | workflow_instances.id | Direct column carried forward. |
| `deal_task` | `name` | workflow_instances.metadata | Preserve `name` inside metadata JSON payload. |
| `deal_task` | `complete` | workflow_instances.metadata | Preserve `complete` inside metadata JSON payload. |
| `deal_task` | `order_id` | workflow_instances.metadata | Preserve `order_id` inside metadata JSON payload. |
| `deal_task` | `deal_task_group_id` | workflow_instances.metadata | Preserve `deal_task_group_id` inside metadata JSON payload. |
| `deal_task` | `actioned_by_user_id` | workflow_instances.metadata | Preserve `actioned_by_user_id` inside metadata JSON payload. |
| `deal_task` | `assigned_to_user_id` | workflow_instances.metadata | Preserve `assigned_to_user_id` inside metadata JSON payload. |
| `deal_task` | `date_due` | workflow_instances.metadata | Preserve `date_due` inside metadata JSON payload. |
| `deal_task` | `date` | workflow_instances.metadata | Preserve `date` inside metadata JSON payload. |
| `deal_task` | `auto_assign_to_case_owner` | workflow_instances.metadata | Preserve `auto_assign_to_case_owner` inside metadata JSON payload. |
| `deal_task` | `deleted_at` | workflow_instances.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `deal_task` | `created_at` | workflow_instances.started_at | Temporal column normalized during refactor. |
| `deal_task` | `updated_at` | workflow_instances.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `deal_task` | `na` | workflow_instances.metadata | Preserve `na` inside metadata JSON payload. |
| `deal_task_group` | `id` | workflow_definitions.id | Direct column carried forward. |
| `deal_task_group` | `name` | workflow_definitions.name | Direct column carried forward. |
| `deal_task_group` | `order_id` | workflow_definitions | Workflow definition catalog. Persist legacy configuration inside definition_json or metadata structures. |
| `deal_task_group` | `deal_id` | workflow_definitions | Workflow definition catalog. Persist legacy configuration inside definition_json or metadata structures. |
| `deal_task_group` | `deleted_at` | workflow_definitions | Workflow definition catalog. Persist legacy configuration inside definition_json or metadata structures. |
| `deal_task_group` | `created_at` | workflow_definitions.created_at | Direct column carried forward. |
| `deal_task_group` | `updated_at` | workflow_definitions.updated_at | Direct column carried forward. |
| `deal_types` | `id` | reference_values.id | Direct column carried forward. |
| `deal_types` | `name` | reference_values.name | Direct column carried forward. |
| `deal_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `deal_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `deal_types` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `deals` | `id` | deals.id | Direct column carried forward. |
| `deals` | `name` | deals.metadata | Preserve `name` inside metadata JSON payload. |
| `deals` | `parent_id` | deals.metadata | Preserve `parent_id` inside metadata JSON payload. |
| `deals` | `case_owner_id` | deals.metadata | Preserve `case_owner_id` inside metadata JSON payload. |
| `deals` | `reference` | deals.metadata | Preserve `reference` inside metadata JSON payload. |
| `deals` | `type_id` | deals.metadata | Preserve `type_id` inside metadata JSON payload. |
| `deals` | `guarantor_id` | deals.metadata | Preserve `guarantor_id` inside metadata JSON payload. |
| `deals` | `client_group_id` | deals.metadata | Preserve `client_group_id` inside metadata JSON payload. |
| `deals` | `currency_id` | deals.metadata | Preserve `currency_id` inside metadata JSON payload. |
| `deals` | `status_id` | deals.metadata | Preserve `status_id` inside metadata JSON payload. |
| `deals` | `approval_requested_by` | deals.metadata | Preserve `approval_requested_by` inside metadata JSON payload. |
| `deals` | `approved_by` | deals.metadata | Preserve `approved_by` inside metadata JSON payload. |
| `deals` | `date_of_approval_required` | deals.metadata | Preserve `date_of_approval_required` inside metadata JSON payload. |
| `deals` | `date_of_approval` | deals.metadata | Preserve `date_of_approval` inside metadata JSON payload. |
| `deals` | `purpose_credit_type_id` | deals.metadata | Preserve `purpose_credit_type_id` inside metadata JSON payload. |
| `deals` | `base_rate_floor` | deals.metadata | Preserve `base_rate_floor` inside metadata JSON payload. |
| `deals` | `loan_term` | deals.metadata | Preserve `loan_term` inside metadata JSON payload. |
| `deals` | `purchase_price` | deals.metadata | Preserve `purchase_price` inside metadata JSON payload. |
| `deals` | `amount_required` | deals.metadata | Preserve `amount_required` inside metadata JSON payload. |
| `deals` | `max_ltv` | deals.metadata | Preserve `max_ltv` inside metadata JSON payload. |
| `deals` | `marketing_source_id` | deals.metadata | Preserve `marketing_source_id` inside metadata JSON payload. |
| `deals` | `usage_details` | deals.metadata | Preserve `usage_details` inside metadata JSON payload. |
| `deals` | `undervalue_details` | deals.metadata | Preserve `undervalue_details` inside metadata JSON payload. |
| `deals` | `funds_going_to_be_used_for` | deals.metadata | Preserve `funds_going_to_be_used_for` inside metadata JSON payload. |
| `deals` | `shortfall_balance_details` | deals.metadata | Preserve `shortfall_balance_details` inside metadata JSON payload. |
| `deals` | `exit_strategy` | deals.metadata | Preserve `exit_strategy` inside metadata JSON payload. |
| `deals` | `created_at` | deals.created_at | Direct column carried forward. |
| `deals` | `updated_at` | deals.updated_at | Direct column carried forward. |
| `deals` | `deleted_at` | deals.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `deals` | `marketing_source_utm` | deals.metadata | Preserve `marketing_source_utm` inside metadata JSON payload. |
| `deals` | `marketing_campaign_utm` | deals.metadata | Preserve `marketing_campaign_utm` inside metadata JSON payload. |
| `deals` | `aborted_reason_id` | deals.metadata | Preserve `aborted_reason_id` inside metadata JSON payload. |
| `deals` | `previous_status_id` | deals.metadata | Preserve `previous_status_id` inside metadata JSON payload. |
| `deals` | `estimated_sale_time` | deals.metadata | Preserve `estimated_sale_time` inside metadata JSON payload. |
| `deals` | `estimated_construction_time` | deals.metadata | Preserve `estimated_construction_time` inside metadata JSON payload. |
| `deals` | `square_footage` | deals.metadata | Preserve `square_footage` inside metadata JSON payload. |
| `deals` | `price_per_square_foot` | deals.metadata | Preserve `price_per_square_foot` inside metadata JSON payload. |
| `deals` | `private_investor` | deals.metadata | Preserve `private_investor` inside metadata JSON payload. |
| `deals` | `novellus_reference` | deals.metadata | Preserve `novellus_reference` inside metadata JSON payload. |
| `deals` | `novellus_name` | deals.metadata | Preserve `novellus_name` inside metadata JSON payload. |
| `deals` | `lending_type_id` | deals.metadata | Preserve `lending_type_id` inside metadata JSON payload. |
| `deals` | `interest_calculation_type_id` | deals.metadata | Preserve `interest_calculation_type_id` inside metadata JSON payload. |
| `deals` | `interest_type_id` | deals.metadata | Preserve `interest_type_id` inside metadata JSON payload. |
| `deals` | `purpose_of_loan` | deals.metadata | Preserve `purpose_of_loan` inside metadata JSON payload. |
| `delegated_owners` | `id` | relationship_links.id | Direct column carried forward. |
| `delegated_owners` | `deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `delegated_owners` | `user_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `delegated_owners` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `delegated_owners` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `delegated_owners` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `document_types` | `id` | reference_values.id | Direct column carried forward. |
| `document_types` | `name` | reference_values.name | Direct column carried forward. |
| `document_types` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `document_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `document_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `documents` | `id` | documents.id | Direct column carried forward. |
| `documents` | `filename` | documents.metadata | Preserve `filename` inside metadata JSON payload. |
| `documents` | `document_type_id` | documents.document_type_id | Direct column carried forward. |
| `documents` | `deleted_at` | documents.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `documents` | `created_at` | documents.metadata | Preserve `created_at` inside metadata JSON payload. |
| `documents` | `updated_at` | documents.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `drawdown_event_amount_type` | `id` | reference_values.id | Direct column carried forward. |
| `drawdown_event_amount_type` | `name` | reference_values.name | Direct column carried forward. |
| `drawdown_event_amount_type` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `drawdown_event_amount_type` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `drawdown_event_amount_type` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `drawdown_event_status` | `id` | reference_values.id | Direct column carried forward. |
| `drawdown_event_status` | `name` | reference_values.name | Direct column carried forward. |
| `drawdown_event_status` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `drawdown_event_status` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `drawdown_event_status` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `drawdown_event_type` | `id` | reference_values.id | Direct column carried forward. |
| `drawdown_event_type` | `drawdown_event_amount_type_id` | reference_values.metadata | Preserve `drawdown_event_amount_type_id` inside metadata JSON payload. |
| `drawdown_event_type` | `name` | reference_values.name | Direct column carried forward. |
| `drawdown_event_type` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `drawdown_event_type` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `drawdown_event_type` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `drawdown_event_type` | `enabled_to_schedule_before` | reference_values.metadata | Preserve `enabled_to_schedule_before` inside metadata JSON payload. |
| `drawdown_events` | `id` | drawdown_events.id | Direct column carried forward. |
| `drawdown_events` | `event_date` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `financial_date` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `drawdown_id` | drawdown_events.drawdown_id | Direct column carried forward. |
| `drawdown_events` | `event_type_id` | drawdown_events.event_type_id | Direct column carried forward. |
| `drawdown_events` | `event_status_id` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `amount` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `variable_rate_source_id` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `accrued_amount` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `note` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `deleted_at` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `created_at` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `updated_at` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `end_date` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `amount_of_loan_in_default` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `default_interest_rate` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_events` | `rate_override` | drawdown_events | Requires case-by-case migration scripting. |
| `drawdown_fees` | `id` | financial_transactions.id | Direct column carried forward. |
| `drawdown_fees` | `drawdown_id` | financial_transactions.metadata | Preserve `drawdown_id` inside metadata JSON payload. |
| `drawdown_fees` | `fee_status_id` | financial_transactions.metadata | Preserve `fee_status_id` inside metadata JSON payload. |
| `drawdown_fees` | `fee_type_id` | financial_transactions.metadata | Preserve `fee_type_id` inside metadata JSON payload. |
| `drawdown_fees` | `service_provider_id` | financial_transactions.metadata | Preserve `service_provider_id` inside metadata JSON payload. |
| `drawdown_fees` | `currency_id` | financial_transactions.metadata | Preserve `currency_id` inside metadata JSON payload. |
| `drawdown_fees` | `broker_agent_id` | financial_transactions.metadata | Preserve `broker_agent_id` inside metadata JSON payload. |
| `drawdown_fees` | `invoice_paid_date` | financial_transactions.metadata | Preserve `invoice_paid_date` inside metadata JSON payload. |
| `drawdown_fees` | `date` | financial_transactions.metadata | Preserve `date` inside metadata JSON payload. |
| `drawdown_fees` | `fee_amount` | financial_transactions.metadata | Preserve `fee_amount` inside metadata JSON payload. |
| `drawdown_fees` | `fee_amount_perc` | financial_transactions.metadata | Preserve `fee_amount_perc` inside metadata JSON payload. |
| `drawdown_fees` | `added_to_loan` | financial_transactions.metadata | Preserve `added_to_loan` inside metadata JSON payload. |
| `drawdown_fees` | `generate_invoice` | financial_transactions.metadata | Preserve `generate_invoice` inside metadata JSON payload. |
| `drawdown_fees` | `invoice_due_date` | financial_transactions.metadata | Preserve `invoice_due_date` inside metadata JSON payload. |
| `drawdown_fees` | `notes` | financial_transactions.metadata | Preserve `notes` inside metadata JSON payload. |
| `drawdown_fees` | `fee_interest` | financial_transactions.metadata | Preserve `fee_interest` inside metadata JSON payload. |
| `drawdown_fees` | `start_date` | financial_transactions.metadata | Preserve `start_date` inside metadata JSON payload. |
| `drawdown_fees` | `end_date` | financial_transactions.metadata | Preserve `end_date` inside metadata JSON payload. |
| `drawdown_fees` | `retained_from_net_advance` | financial_transactions.metadata | Preserve `retained_from_net_advance` inside metadata JSON payload. |
| `drawdown_fees` | `commitment_fee_refund_amount` | financial_transactions.metadata | Preserve `commitment_fee_refund_amount` inside metadata JSON payload. |
| `drawdown_fees` | `commitment_fee_refund_date` | financial_transactions.metadata | Preserve `commitment_fee_refund_date` inside metadata JSON payload. |
| `drawdown_fees` | `commitment_fee_refund_period` | financial_transactions.metadata | Preserve `commitment_fee_refund_period` inside metadata JSON payload. |
| `drawdown_fees` | `active` | financial_transactions.metadata | Preserve `active` inside metadata JSON payload. |
| `drawdown_fees` | `quoted_date` | financial_transactions.metadata | Preserve `quoted_date` inside metadata JSON payload. |
| `drawdown_fees` | `quote_confirmed_date` | financial_transactions.metadata | Preserve `quote_confirmed_date` inside metadata JSON payload. |
| `drawdown_fees` | `undertaking_confirmed_date` | financial_transactions.metadata | Preserve `undertaking_confirmed_date` inside metadata JSON payload. |
| `drawdown_fees` | `created_at` | financial_transactions.created_at | Direct column carried forward. |
| `drawdown_fees` | `updated_at` | financial_transactions.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `drawdown_fees` | `deleted_at` | financial_transactions.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `drawdown_fields_approval` | `id` | workflow_events.id | Direct column carried forward. |
| `drawdown_fields_approval` | `field_name` | workflow_events.metadata | Preserve `field_name` inside metadata JSON payload. |
| `drawdown_fields_approval` | `is_approved` | workflow_events.metadata | Preserve `is_approved` inside metadata JSON payload. |
| `drawdown_fields_approval` | `approved_by` | workflow_events.metadata | Preserve `approved_by` inside metadata JSON payload. |
| `drawdown_fields_approval` | `drawdown_id` | workflow_events.metadata | Preserve `drawdown_id` inside metadata JSON payload. |
| `drawdown_fields_approval` | `created_at` | workflow_events.metadata | Preserve `created_at` inside metadata JSON payload. |
| `drawdown_fields_approval` | `updated_at` | workflow_events.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `drawdown_fields_approval` | `deleted_at` | workflow_events.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `drawdown_status` | `id` | reference_values.id | Direct column carried forward. |
| `drawdown_status` | `name` | reference_values.name | Direct column carried forward. |
| `drawdown_status` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `drawdown_status` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `drawdown_status` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `drawdowns` | `id` | drawdowns.id | Direct column carried forward. |
| `drawdowns` | `name` | drawdowns.metadata | Preserve `name` inside metadata JSON payload. |
| `drawdowns` | `deal_id` | drawdowns.deal_id | Direct column carried forward. |
| `drawdowns` | `drawdown_status_id` | drawdowns.metadata | Preserve `drawdown_status_id` inside metadata JSON payload. |
| `drawdowns` | `lender_id` | drawdowns.metadata | Preserve `lender_id` inside metadata JSON payload. |
| `drawdowns` | `interest_rate` | drawdowns.metadata | Preserve `interest_rate` inside metadata JSON payload. |
| `drawdowns` | `redemption_date` | drawdowns.metadata | Preserve `redemption_date` inside metadata JSON payload. |
| `drawdowns` | `deleted_at` | drawdowns.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `drawdowns` | `created_at` | drawdowns.metadata | Preserve `created_at` inside metadata JSON payload. |
| `drawdowns` | `updated_at` | drawdowns.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `drawdowns` | `interest_calculation_type_id` | drawdowns.metadata | Preserve `interest_calculation_type_id` inside metadata JSON payload. |
| `drawdowns` | `total_net_loan` | drawdowns.metadata | Preserve `total_net_loan` inside metadata JSON payload. |
| `drawdowns` | `gross_loan` | drawdowns.metadata | Preserve `gross_loan` inside metadata JSON payload. |
| `drawdowns` | `term_months` | drawdowns.metadata | Preserve `term_months` inside metadata JSON payload. |
| `drawdowns` | `term_days` | drawdowns.metadata | Preserve `term_days` inside metadata JSON payload. |
| `drawdowns` | `monthly_rate` | drawdowns.metadata | Preserve `monthly_rate` inside metadata JSON payload. |
| `drawdowns` | `daily_rate` | drawdowns.metadata | Preserve `daily_rate` inside metadata JSON payload. |
| `drawdowns` | `loan_start_date` | drawdowns.metadata | Preserve `loan_start_date` inside metadata JSON payload. |
| `drawdowns` | `refinanced_date` | drawdowns.metadata | Preserve `refinanced_date` inside metadata JSON payload. |
| `drawdowns` | `refinance_gross_amount` | drawdowns.metadata | Preserve `refinance_gross_amount` inside metadata JSON payload. |
| `drawdowns` | `refinanced_from_id` | drawdowns.metadata | Preserve `refinanced_from_id` inside metadata JSON payload. |
| `drawdowns` | `refinanced_to_id` | drawdowns.metadata | Preserve `refinanced_to_id` inside metadata JSON payload. |
| `drawdowns` | `loan_administration_start_date` | drawdowns.metadata | Preserve `loan_administration_start_date` inside metadata JSON payload. |
| `drawdowns` | `loan_end_date` | drawdowns.metadata | Preserve `loan_end_date` inside metadata JSON payload. |
| `drawdowns` | `deal_type_id` | drawdowns.metadata | Preserve `deal_type_id` inside metadata JSON payload. |
| `drawdowns` | `interest_type_id` | drawdowns.metadata | Preserve `interest_type_id` inside metadata JSON payload. |
| `drawdowns` | `bridging_drawdown_type_id` | drawdowns.metadata | Preserve `bridging_drawdown_type_id` inside metadata JSON payload. |
| `drawdowns` | `interest_subtype_id` | drawdowns.metadata | Preserve `interest_subtype_id` inside metadata JSON payload. |
| `drawdowns` | `max_loan_amount` | drawdowns.metadata | Preserve `max_loan_amount` inside metadata JSON payload. |
| `drawdowns` | `ltv` | drawdowns.metadata | Preserve `ltv` inside metadata JSON payload. |
| `drawdowns` | `interest_payment` | drawdowns.metadata | Preserve `interest_payment` inside metadata JSON payload. |
| `drawdowns` | `actual_accrued_interest_payment` | drawdowns.metadata | Preserve `actual_accrued_interest_payment` inside metadata JSON payload. |
| `drawdowns` | `monthly_interest` | drawdowns.metadata | Preserve `monthly_interest` inside metadata JSON payload. |
| `drawdowns` | `daily_interest` | drawdowns.metadata | Preserve `daily_interest` inside metadata JSON payload. |
| `drawdowns` | `total_net_advance` | drawdowns.metadata | Preserve `total_net_advance` inside metadata JSON payload. |
| `drawdowns` | `total_investment` | drawdowns.metadata | Preserve `total_investment` inside metadata JSON payload. |
| `drawdowns` | `estimated_return` | drawdowns.metadata | Preserve `estimated_return` inside metadata JSON payload. |
| `drawdowns` | `estimated_margin` | drawdowns.metadata | Preserve `estimated_margin` inside metadata JSON payload. |
| `drawdowns` | `redemption_value` | drawdowns.metadata | Preserve `redemption_value` inside metadata JSON payload. |
| `drawdowns` | `loan_calculation_method_id` | drawdowns.metadata | Preserve `loan_calculation_method_id` inside metadata JSON payload. |
| `drawdowns` | `asset_value` | drawdowns.metadata | Preserve `asset_value` inside metadata JSON payload. |
| `drawdowns` | `asset_type_id` | drawdowns.metadata | Preserve `asset_type_id` inside metadata JSON payload. |
| `drawdowns` | `max_ltv` | drawdowns.metadata | Preserve `max_ltv` inside metadata JSON payload. |
| `drawdowns` | `ltv_override_reason` | drawdowns.metadata | Preserve `ltv_override_reason` inside metadata JSON payload. |
| `drawdowns` | `variable_rate_source_id` | drawdowns.metadata | Preserve `variable_rate_source_id` inside metadata JSON payload. |
| `drawdowns` | `source_rate` | drawdowns.metadata | Preserve `source_rate` inside metadata JSON payload. |
| `drawdowns` | `margin` | drawdowns.metadata | Preserve `margin` inside metadata JSON payload. |
| `drawdowns` | `variable_rate_id` | drawdowns.metadata | Preserve `variable_rate_id` inside metadata JSON payload. |
| `drawdowns` | `total_fees` | drawdowns.metadata | Preserve `total_fees` inside metadata JSON payload. |
| `drawdowns` | `total_interest_on_fees` | drawdowns.metadata | Preserve `total_interest_on_fees` inside metadata JSON payload. |
| `drawdowns` | `retained_interest` | drawdowns.metadata | Preserve `retained_interest` inside metadata JSON payload. |
| `drawdowns` | `redeem_date` | drawdowns.metadata | Preserve `redeem_date` inside metadata JSON payload. |
| `drawdowns` | `exit_fee_calculated` | drawdowns.metadata | Preserve `exit_fee_calculated` inside metadata JSON payload. |
| `drawdowns` | `funder_interest_rate` | drawdowns.metadata | Preserve `funder_interest_rate` inside metadata JSON payload. |
| `drawdowns` | `hybrid_parent_id` | drawdowns.metadata | Preserve `hybrid_parent_id` inside metadata JSON payload. |
| `drawdowns` | `is_hybrid_parent` | drawdowns.metadata | Preserve `is_hybrid_parent` inside metadata JSON payload. |
| `drawdowns` | `exit_strategies` | drawdowns.metadata | Preserve `exit_strategies` inside metadata JSON payload. |
| `drawdowns` | `marketing_channel_id` | drawdowns.metadata | Preserve `marketing_channel_id` inside metadata JSON payload. |
| `drawdowns` | `default_rate` | drawdowns.metadata | Preserve `default_rate` inside metadata JSON payload. |
| `drawdowns` | `year_type` | drawdowns.metadata | Preserve `year_type` inside metadata JSON payload. |
| `drawdowns` | `compound_day` | drawdowns.metadata | Preserve `compound_day` inside metadata JSON payload. |
| `drawdowns` | `funder_arrangement_fee` | drawdowns.metadata | Preserve `funder_arrangement_fee` inside metadata JSON payload. |
| `drawdowns` | `funder_arrangement_fee_is_percent` | drawdowns.metadata | Preserve `funder_arrangement_fee_is_percent` inside metadata JSON payload. |
| `drawdowns` | `notice_period_days` | drawdowns.metadata | Preserve `notice_period_days` inside metadata JSON payload. |
| `drawdowns` | `additional_interest_rate` | drawdowns.metadata | Preserve `additional_interest_rate` inside metadata JSON payload. |
| `drawdowns` | `extended_from` | drawdowns.metadata | Preserve `extended_from` inside metadata JSON payload. |
| `drawdowns` | `extension_date` | drawdowns.metadata | Preserve `extension_date` inside metadata JSON payload. |
| `drawdowns` | `extended_gross_amount` | drawdowns.metadata | Preserve `extended_gross_amount` inside metadata JSON payload. |
| `drawdowns` | `gross_development_value` | drawdowns.metadata | Preserve `gross_development_value` inside metadata JSON payload. |
| `drawdowns` | `gross_development_value_gross_loan_greater_note` | drawdowns.metadata | Preserve `gross_development_value_gross_loan_greater_note` inside metadata JSON payload. |
| `drawdowns` | `asset_value_day_net_advance_greater_note` | drawdowns.metadata | Preserve `asset_value_day_net_advance_greater_note` inside metadata JSON payload. |
| `drawdowns` | `total_drawn_amount` | drawdowns.metadata | Preserve `total_drawn_amount` inside metadata JSON payload. |
| `drawdowns` | `drawdowns_start_date` | drawdowns.metadata | Preserve `drawdowns_start_date` inside metadata JSON payload. |
| `drawdowns` | `drawdowns_end_date` | drawdowns.metadata | Preserve `drawdowns_end_date` inside metadata JSON payload. |
| `drawdowns` | `number_of_drawdowns` | drawdowns.metadata | Preserve `number_of_drawdowns` inside metadata JSON payload. |
| `drawdowns` | `tranch_strategy` | drawdowns.metadata | Preserve `tranch_strategy` inside metadata JSON payload. |
| `drawdowns` | `used_floor_rate` | drawdowns.metadata | Preserve `used_floor_rate` inside metadata JSON payload. |
| `drawdowns` | `used_floor_rate_note` | drawdowns.metadata | Preserve `used_floor_rate_note` inside metadata JSON payload. |
| `drawdowns` | `profile_approval_status_id` | drawdowns.metadata | Preserve `profile_approval_status_id` inside metadata JSON payload. |
| `drawdowns` | `first_approval_user_id` | drawdowns.metadata | Preserve `first_approval_user_id` inside metadata JSON payload. |
| `drawdowns` | `first_approval_datetime` | drawdowns.metadata | Preserve `first_approval_datetime` inside metadata JSON payload. |
| `drawdowns` | `second_approval_user_id` | drawdowns.metadata | Preserve `second_approval_user_id` inside metadata JSON payload. |
| `drawdowns` | `submitted_by_user_id` | drawdowns.metadata | Preserve `submitted_by_user_id` inside metadata JSON payload. |
| `drawdowns` | `approval_datetime` | drawdowns.metadata | Preserve `approval_datetime` inside metadata JSON payload. |
| `drawdowns` | `rejected_note` | drawdowns.metadata | Preserve `rejected_note` inside metadata JSON payload. |
| `email_code_authentication` | `id` | entity_credentials.id | Direct column carried forward. |
| `email_code_authentication` | `user_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `email_code_authentication` | `code` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; use metadata for provider details. |
| `email_code_authentication` | `created_at` | entity_credentials.created_at | Direct column carried forward. |
| `email_code_authentication` | `expires_at` | entity_credentials.expires_at | Direct column carried forward. |
| `email_code_authentication` | `deleted_at` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; use metadata for provider details. |
| `exit_fee_tiers` | `id` | deal_terms.id | Direct column carried forward. |
| `exit_fee_tiers` | `deal_id` | deal_terms.deal_id | Direct column carried forward. |
| `exit_fee_tiers` | `term_month` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns; extra levers live in metadata. |
| `exit_fee_tiers` | `fee_percent` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns; extra levers live in metadata. |
| `exit_fee_tiers` | `deleted_at` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns; extra levers live in metadata. |
| `exit_fee_tiers` | `created_at` | deal_terms.created_at | Direct column carried forward. |
| `exit_fee_tiers` | `updated_at` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns; extra levers live in metadata. |
| `failed_jobs` | `id` | system_jobs.id | Direct column carried forward. |
| `failed_jobs` | `uuid` | system_jobs | Asynchronous job queue. Serialize legacy payloads into job_json and scheduling columns. |
| `failed_jobs` | `connection` | system_jobs | Asynchronous job queue. Serialize legacy payloads into job_json and scheduling columns. |
| `failed_jobs` | `queue` | system_jobs | Asynchronous job queue. Serialize legacy payloads into job_json and scheduling columns. |
| `failed_jobs` | `payload` | system_jobs | Asynchronous job queue. Serialize legacy payloads into job_json and scheduling columns. |
| `failed_jobs` | `exception` | system_jobs | Asynchronous job queue. Serialize legacy payloads into job_json and scheduling columns. |
| `failed_jobs` | `failed_at` | system_jobs | Asynchronous job queue. Serialize legacy payloads into job_json and scheduling columns. |
| `fee_options` | `id` | reference_values.id | Direct column carried forward. |
| `fee_options` | `name` | reference_values.name | Direct column carried forward. |
| `fee_options` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `fee_options` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `fee_options` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `fee_status` | `id` | reference_values.id | Direct column carried forward. |
| `fee_status` | `name` | reference_values.name | Direct column carried forward. |
| `fee_status` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `fee_status` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `fee_status` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `fee_type` | `id` | reference_values.id | Direct column carried forward. |
| `fee_type` | `name` | reference_values.name | Direct column carried forward. |
| `fee_type` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `fee_type` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `fee_type` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `fee_type` | `default_value_flat` | reference_values.metadata | Preserve `default_value_flat` inside metadata JSON payload. |
| `fee_type` | `default_value_perc` | reference_values.metadata | Preserve `default_value_perc` inside metadata JSON payload. |
| `fee_type` | `not_deletable` | reference_values.metadata | Preserve `not_deletable` inside metadata JSON payload. |
| `fee_type` | `active` | reference_values.metadata | Preserve `active` inside metadata JSON payload. |
| `fee_type_lending_type` | `id` | reference_values.id, deal_terms.id | Direct column carried forward. |
| `fee_type_lending_type` | `fee_type_id` | reference_values.metadata | Preserve `fee_type_id` inside metadata JSON payload. |
| `fee_type_lending_type` | `lending_type_id` | reference_values.metadata | Preserve `lending_type_id` inside metadata JSON payload. |
| `fee_type_lending_type` | `created_at` | deal_terms.created_at | Direct column carried forward. |
| `fee_type_lending_type` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `fees` | `id` | financial_transactions.id | Direct column carried forward. |
| `fees` | `fee_status_id` | financial_transactions.metadata | Preserve `fee_status_id` inside metadata JSON payload. |
| `fees` | `invoice_paid_date` | financial_transactions.metadata | Preserve `invoice_paid_date` inside metadata JSON payload. |
| `fees` | `date` | financial_transactions.metadata | Preserve `date` inside metadata JSON payload. |
| `fees` | `fee_type_id` | financial_transactions.metadata | Preserve `fee_type_id` inside metadata JSON payload. |
| `fees` | `service_provider_id` | financial_transactions.metadata | Preserve `service_provider_id` inside metadata JSON payload. |
| `fees` | `fee_amount` | financial_transactions.metadata | Preserve `fee_amount` inside metadata JSON payload. |
| `fees` | `fee_amount_perc` | financial_transactions.metadata | Preserve `fee_amount_perc` inside metadata JSON payload. |
| `fees` | `currency_id` | financial_transactions.metadata | Preserve `currency_id` inside metadata JSON payload. |
| `fees` | `deal_id` | financial_transactions.deal_id | Direct column carried forward. |
| `fees` | `fee_interest` | financial_transactions.metadata | Preserve `fee_interest` inside metadata JSON payload. |
| `fees` | `generate_invoice` | financial_transactions.metadata | Preserve `generate_invoice` inside metadata JSON payload. |
| `fees` | `invoice_due_date` | financial_transactions.metadata | Preserve `invoice_due_date` inside metadata JSON payload. |
| `fees` | `notes` | financial_transactions.metadata | Preserve `notes` inside metadata JSON payload. |
| `fees` | `created_at` | financial_transactions.created_at | Direct column carried forward. |
| `fees` | `updated_at` | financial_transactions.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `fees` | `deleted_at` | financial_transactions.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `fees` | `added_to_loan` | financial_transactions.metadata | Preserve `added_to_loan` inside metadata JSON payload. |
| `fees` | `start_date` | financial_transactions.metadata | Preserve `start_date` inside metadata JSON payload. |
| `fees` | `end_date` | financial_transactions.metadata | Preserve `end_date` inside metadata JSON payload. |
| `fees` | `broker_agent_id` | financial_transactions.metadata | Preserve `broker_agent_id` inside metadata JSON payload. |
| `fees` | `retained_from_net_advance` | financial_transactions.metadata | Preserve `retained_from_net_advance` inside metadata JSON payload. |
| `fees` | `commitment_fee_refund_amount` | financial_transactions.metadata | Preserve `commitment_fee_refund_amount` inside metadata JSON payload. |
| `fees` | `commitment_fee_refund_date` | financial_transactions.metadata | Preserve `commitment_fee_refund_date` inside metadata JSON payload. |
| `fees` | `commitment_fee_refund_period` | financial_transactions.metadata | Preserve `commitment_fee_refund_period` inside metadata JSON payload. |
| `fees` | `quoted_date` | financial_transactions.metadata | Preserve `quoted_date` inside metadata JSON payload. |
| `fees` | `quote_confirmed_date` | financial_transactions.metadata | Preserve `quote_confirmed_date` inside metadata JSON payload. |
| `fees` | `undertaking_confirmed_date` | financial_transactions.metadata | Preserve `undertaking_confirmed_date` inside metadata JSON payload. |
| `fees` | `active` | financial_transactions.metadata | Preserve `active` inside metadata JSON payload. |
| `files` | `id` | files.id | Direct column carried forward. |
| `files` | `deal_document_category_id` | files | Requires case-by-case migration scripting. |
| `files` | `directory` | files | Requires case-by-case migration scripting. |
| `files` | `filename` | files | Requires case-by-case migration scripting. |
| `files` | `original_filename` | files | Requires case-by-case migration scripting. |
| `files` | `mime` | files | Requires case-by-case migration scripting. |
| `files` | `size` | files | Requires case-by-case migration scripting. |
| `files` | `user_id` | files | Requires case-by-case migration scripting. |
| `files` | `document_folder` | files | Requires case-by-case migration scripting. |
| `files` | `sharepoint_path` | files | Requires case-by-case migration scripting. |
| `files` | `created_at` | files.created_at | Direct column carried forward. |
| `files` | `updated_at` | files | Requires case-by-case migration scripting. |
| `files` | `deleted_at` | files | Requires case-by-case migration scripting. |
| `files` | `sharepoint_unique_id` | files | Requires case-by-case migration scripting. |
| `form_types` | `id` | reference_values.id | Direct column carried forward. |
| `form_types` | `name` | reference_values.name | Direct column carried forward. |
| `form_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `form_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `form_types` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `guarantor_corporates` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `guarantor_corporates` | `company_name` | entities.metadata | Preserve `company_name` inside metadata JSON payload. |
| `guarantor_corporates` | `company_number` | entities.metadata | Preserve `company_number` inside metadata JSON payload. |
| `guarantor_corporates` | `email` | entities.metadata | Preserve `email` inside metadata JSON payload. |
| `guarantor_corporates` | `phone` | entities.metadata | Preserve `phone` inside metadata JSON payload. |
| `guarantor_corporates` | `created_at` | entities.created_at | Direct column carried forward. |
| `guarantor_corporates` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `guarantor_corporates` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `guarantor_individuals` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `guarantor_individuals` | `title` | entities.title | Direct column carried forward. |
| `guarantor_individuals` | `first_name` | entities.first_name | Direct column carried forward. |
| `guarantor_individuals` | `middle_name` | entities.middle_name | Direct column carried forward. |
| `guarantor_individuals` | `last_name` | entities.last_name | Direct column carried forward. |
| `guarantor_individuals` | `email` | entities.metadata | Preserve `email` inside metadata JSON payload. |
| `guarantor_individuals` | `phone` | entities.metadata | Preserve `phone` inside metadata JSON payload. |
| `guarantor_individuals` | `previous_name` | entities.metadata | Preserve `previous_name` inside metadata JSON payload. |
| `guarantor_individuals` | `marital_status` | entities.metadata | Preserve `marital_status` inside metadata JSON payload. |
| `guarantor_individuals` | `date_of_birth` | entities.date_of_birth | Direct column carried forward. |
| `guarantor_individuals` | `nationality` | entities.metadata | Preserve `nationality` inside metadata JSON payload. |
| `guarantor_individuals` | `passport_number` | entities.metadata | Preserve `passport_number` inside metadata JSON payload. |
| `guarantor_individuals` | `permanent_right_to_reside` | entities.metadata | Preserve `permanent_right_to_reside` inside metadata JSON payload. |
| `guarantor_individuals` | `address_history` | entities.metadata | Preserve `address_history` inside metadata JSON payload. |
| `guarantor_individuals` | `ppsn` | entities.metadata | Preserve `ppsn` inside metadata JSON payload. |
| `guarantor_individuals` | `created_at` | entities.created_at | Direct column carried forward. |
| `guarantor_individuals` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `guarantor_individuals` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `guarantor_type` | `id` | reference_values.id | Direct column carried forward. |
| `guarantor_type` | `name` | reference_values.name | Direct column carried forward. |
| `guarantor_type` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `guarantor_type` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `guarantor_type` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
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
| `interest_calculation_types` | `formula` | reference_values.metadata | Preserve `formula` inside metadata JSON payload. |
| `interest_calculation_types` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `interest_calculation_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `interest_calculation_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `interest_subtypes` | `id` | reference_values.id | Direct column carried forward. |
| `interest_subtypes` | `name` | reference_values.name | Direct column carried forward. |
| `interest_subtypes` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `interest_subtypes` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `interest_types` | `id` | reference_values.id | Direct column carried forward. |
| `interest_types` | `name` | reference_values.name | Direct column carried forward. |
| `interest_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `interest_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `interest_types` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `introducer_type` | `id` | reference_values.id | Direct column carried forward. |
| `introducer_type` | `name` | reference_values.name | Direct column carried forward. |
| `introducer_type` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `introducer_type` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `introducer_type` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `introducers` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `introducers` | `company` | entities.metadata | Preserve `company` inside metadata JSON payload. |
| `introducers` | `contact` | entities.metadata | Preserve `contact` inside metadata JSON payload. |
| `introducers` | `email` | entities.metadata | Preserve `email` inside metadata JSON payload. |
| `introducers` | `phone` | entities.metadata | Preserve `phone` inside metadata JSON payload. |
| `introducers` | `created_at` | entities.created_at | Direct column carried forward. |
| `introducers` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `introducers` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `introducers` | `introducer_type_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `jobs` | `id` | system_jobs.id | Direct column carried forward. |
| `jobs` | `queue` | system_jobs | Asynchronous job queue. Serialize legacy payloads into job_json and scheduling columns. |
| `jobs` | `payload` | system_jobs | Asynchronous job queue. Serialize legacy payloads into job_json and scheduling columns. |
| `jobs` | `attempts` | system_jobs.attempts | Direct column carried forward. |
| `jobs` | `reserved_at` | system_jobs | Asynchronous job queue. Serialize legacy payloads into job_json and scheduling columns. |
| `jobs` | `available_at` | system_jobs.available_at | Direct column carried forward. |
| `jobs` | `created_at` | system_jobs.created_at | Direct column carried forward. |
| `lender_funder_interest_rate` | `id` | pricing_history.id | Direct column carried forward. |
| `lender_funder_interest_rate` | `lender_id` | pricing_history | Requires case-by-case migration scripting. |
| `lender_funder_interest_rate` | `interest_rate` | pricing_history | Requires case-by-case migration scripting. |
| `lender_funder_interest_rate` | `created_at` | pricing_history | Requires case-by-case migration scripting. |
| `lender_funder_interest_rate` | `updated_at` | pricing_history | Requires case-by-case migration scripting. |
| `lender_funder_interest_rate` | `deleted_at` | pricing_history | Requires case-by-case migration scripting. |
| `lender_operational_team_admin` | `id` | relationship_links.id | Direct column carried forward. |
| `lender_operational_team_admin` | `user_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `lender_operational_team_admin` | `lender_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `lender_operational_team_admin` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `lender_operational_team_admin` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `lender_operational_team_admin` | `deleted_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `lenders` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `lenders` | `name` | entities.metadata | Preserve `name` inside metadata JSON payload. |
| `lenders` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `lenders` | `created_at` | entities.created_at | Direct column carried forward. |
| `lenders` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `lenders` | `historical` | entities.metadata | Preserve `historical` inside metadata JSON payload. |
| `lenders` | `stripe_settings_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `lending_types` | `id` | reference_values.id | Direct column carried forward. |
| `lending_types` | `name` | reference_values.name | Direct column carried forward. |
| `lending_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `lending_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `linked_deals` | `id` | relationship_links.id | Direct column carried forward. |
| `linked_deals` | `deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `linked_deals` | `linked_deal_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `linked_deals` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `linked_deals` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `linked_deals` | `cross_collateralized` | relationship_links.metadata | Preserve `cross_collateralized` inside metadata JSON payload. |
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
| `loan_calculation_method` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `loan_calculation_method` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `loan_calculation_method` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `loan_custom_forms` | `id` | forms.id | Direct column carried forward. |
| `loan_custom_forms` | `name` | forms.name | Direct column carried forward. |
| `loan_custom_forms` | `form_data` | forms | Requires case-by-case migration scripting. |
| `loan_custom_forms` | `created_by` | forms | Requires case-by-case migration scripting. |
| `loan_custom_forms` | `created_at` | forms.created_at | Direct column carried forward. |
| `loan_custom_forms` | `updated_at` | forms.updated_at | Direct column carried forward. |
| `loan_custom_forms` | `deleted_at` | forms | Requires case-by-case migration scripting. |
| `loan_custom_forms` | `reference` | forms | Requires case-by-case migration scripting. |
| `loan_custom_forms` | `form_type_id` | forms | Requires case-by-case migration scripting. |
| `loan_custom_forms` | `payment_required` | forms | Requires case-by-case migration scripting. |
| `loan_custom_forms` | `application_form` | forms | Requires case-by-case migration scripting. |
| `loan_custom_forms` | `payment_fee` | forms | Requires case-by-case migration scripting. |
| `loan_custom_forms` | `e_sign_required` | forms | Requires case-by-case migration scripting. |
| `margin_override` | `id` | deal_terms.id | Direct column carried forward. |
| `margin_override` | `drawdown_id` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns; extra levers live in metadata. |
| `margin_override` | `from` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns; extra levers live in metadata. |
| `margin_override` | `to` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns; extra levers live in metadata. |
| `margin_override` | `rate` | deal_terms.rate | Direct column carried forward. |
| `margin_override` | `created_at` | deal_terms.created_at | Direct column carried forward. |
| `margin_override` | `updated_at` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns; extra levers live in metadata. |
| `margin_override` | `deleted_at` | deal_terms | Deal economics. Normalize numeric thresholds and timing values into standardized columns; extra levers live in metadata. |
| `marital_statuses` | `id` | reference_values.id | Direct column carried forward. |
| `marital_statuses` | `name` | reference_values.name | Direct column carried forward. |
| `marital_statuses` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `marital_statuses` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `marital_statuses` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `marketing_sources` | `id` | reference_values.id | Direct column carried forward. |
| `marketing_sources` | `name` | reference_values.name | Direct column carried forward. |
| `marketing_sources` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `marketing_sources` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `marketing_sources` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `migrations` | `id` | system_settings.id | Direct column carried forward. |
| `migrations` | `migration` | system_settings | Configuration registry. Move key/value data into setting_key and value_json, scoping via scope_type/scope_id. |
| `migrations` | `batch` | system_settings | Configuration registry. Move key/value data into setting_key and value_json, scoping via scope_type/scope_id. |
| `model_has_permissions` | `permission_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `model_has_permissions` | `model_type` | relationship_links.metadata | Preserve `model_type` inside metadata JSON payload. |
| `model_has_permissions` | `model_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `model_has_roles` | `role_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `model_has_roles` | `model_type` | relationship_links.metadata | Preserve `model_type` inside metadata JSON payload. |
| `model_has_roles` | `model_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `name_titles` | `id` | reference_values.id | Direct column carried forward. |
| `name_titles` | `name` | reference_values.name | Direct column carried forward. |
| `name_titles` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `name_titles` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `name_titles` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `notes` | `id` | notes.id | Direct column carried forward. |
| `notes` | `note` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `notes` | `created_by` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `notes` | `created_at` | notes.created_at | Direct column carried forward. |
| `notes` | `updated_at` | notes.updated_at | Direct column carried forward. |
| `notes` | `deleted_at` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `notification` | `id` | notifications.id | Direct column carried forward. |
| `notification` | `deal_notification_rule_id` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `notification` | `deal_id` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `notification` | `drawdown_id` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `notification` | `drawdown_event_type_id` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `notification` | `file_id` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `notification` | `deleted_at` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `notification` | `created_at` | notifications.created_at | Direct column carried forward. |
| `notification` | `updated_at` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `notification_recipients` | `id` | notification_targets.id | Direct column carried forward. |
| `notification_recipients` | `notification_id` | notification_targets.notification_id | Direct column carried forward. |
| `notification_recipients` | `client_individual_id` | notification_targets.target_id | Mapped into generic target identifier. |
| `notification_recipients` | `used_email_address` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with channel flags in metadata. |
| `notification_recipients` | `subject` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with channel flags in metadata. |
| `notification_recipients` | `body` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with channel flags in metadata. |
| `notification_recipients` | `sent` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with channel flags in metadata. |
| `notification_recipients` | `deleted_at` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with channel flags in metadata. |
| `notification_recipients` | `created_at` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with channel flags in metadata. |
| `notification_recipients` | `updated_at` | notification_targets | Recipient configuration. Map target polymorphism through target_type/target_id with channel flags in metadata. |
| `notification_rules` | `id` | notification_templates.id | Direct column carried forward. |
| `notification_rules` | `notification_template_id` | notification_templates.metadata | Preserve `notification_template_id` inside metadata JSON payload. |
| `notification_rules` | `drawdown_event_type_id` | notification_templates.metadata | Preserve `drawdown_event_type_id` inside metadata JSON payload. |
| `notification_rules` | `scheduled_for` | notification_templates.metadata | Preserve `scheduled_for` inside metadata JSON payload. |
| `notification_rules` | `interval_type` | notification_templates.metadata | Preserve `interval_type` inside metadata JSON payload. |
| `notification_rules` | `subject_override` | notification_templates.metadata | Preserve `subject_override` inside metadata JSON payload. |
| `notification_rules` | `body_override` | notification_templates.metadata | Preserve `body_override` inside metadata JSON payload. |
| `notification_rules` | `file_id` | notification_templates.metadata | Preserve `file_id` inside metadata JSON payload. |
| `notification_rules` | `deleted_at` | notification_templates.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `notification_rules` | `created_at` | notification_templates.created_at | Direct column carried forward. |
| `notification_rules` | `updated_at` | notification_templates.updated_at | Direct column carried forward. |
| `notification_rules` | `recipient_setting` | notification_templates.metadata | Preserve `recipient_setting` inside metadata JSON payload. |
| `notification_rules` | `lending_type_id` | notification_templates.metadata | Preserve `lending_type_id` inside metadata JSON payload. |
| `notification_templates` | `id` | notification_templates.id | Direct column carried forward. |
| `notification_templates` | `doc_reference` | notification_templates.metadata | Preserve `doc_reference` inside metadata JSON payload. |
| `notification_templates` | `subject` | notification_templates.subject | Direct column carried forward. |
| `notification_templates` | `body` | notification_templates.body | Direct column carried forward. |
| `notification_templates` | `file_id` | notification_templates.metadata | Preserve `file_id` inside metadata JSON payload. |
| `notification_templates` | `deleted_at` | notification_templates.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `notification_templates` | `created_at` | notification_templates.created_at | Direct column carried forward. |
| `notification_templates` | `updated_at` | notification_templates.updated_at | Direct column carried forward. |
| `order_statuses` | `id` | reference_values.id | Direct column carried forward. |
| `order_statuses` | `name` | reference_values.name | Direct column carried forward. |
| `order_statuses` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `order_statuses` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `order_statuses` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `orders` | `id` | sales_orders.id | Direct column carried forward. |
| `orders` | `reference` | sales_orders.metadata | Preserve `reference` inside metadata JSON payload. |
| `orders` | `client_form_id` | sales_orders.metadata | Preserve `client_form_id` inside metadata JSON payload. |
| `orders` | `user_id` | sales_orders.metadata | Preserve `user_id` inside metadata JSON payload. |
| `orders` | `order_status_id` | sales_orders.order_status_id | Direct column carried forward. |
| `orders` | `payment_id` | sales_orders.metadata | Preserve `payment_id` inside metadata JSON payload. |
| `orders` | `net_total` | sales_orders.metadata | Preserve `net_total` inside metadata JSON payload. |
| `orders` | `gross_total` | sales_orders.metadata | Preserve `gross_total` inside metadata JSON payload. |
| `orders` | `vat_rate` | sales_orders.metadata | Preserve `vat_rate` inside metadata JSON payload. |
| `orders` | `created_at` | sales_orders.metadata | Preserve `created_at` inside metadata JSON payload. |
| `orders` | `updated_at` | sales_orders.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `orders` | `deleted_at` | sales_orders.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `ownership_types` | `id` | reference_values.id | Direct column carried forward. |
| `ownership_types` | `name` | reference_values.name | Direct column carried forward. |
| `ownership_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `ownership_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `ownership_types` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `password_resets` | `my_row_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `password_resets` | `email` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; use metadata for provider details. |
| `password_resets` | `token` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; use metadata for provider details. |
| `password_resets` | `created_at` | entity_credentials.created_at | Direct column carried forward. |
| `payment_attempts` | `id` | transaction_attempts.id | Direct column carried forward. |
| `payment_attempts` | `payment_id` | transaction_attempts | Requires case-by-case migration scripting. |
| `payment_attempts` | `amount` | transaction_attempts | Requires case-by-case migration scripting. |
| `payment_attempts` | `status` | transaction_attempts | Requires case-by-case migration scripting. |
| `payment_attempts` | `error_message` | transaction_attempts.error_message | Direct column carried forward. |
| `payment_attempts` | `payment_method_id` | transaction_attempts | Requires case-by-case migration scripting. |
| `payment_attempts` | `payment_intent_id` | transaction_attempts | Requires case-by-case migration scripting. |
| `payment_attempts` | `payment_reference` | transaction_attempts | Requires case-by-case migration scripting. |
| `payment_attempts` | `created_at` | transaction_attempts | Requires case-by-case migration scripting. |
| `payment_attempts` | `updated_at` | transaction_attempts | Requires case-by-case migration scripting. |
| `payment_attempts` | `deleted_at` | transaction_attempts | Requires case-by-case migration scripting. |
| `payment_providers` | `id` | reference_values.id | Direct column carried forward. |
| `payment_providers` | `name` | reference_values.name | Direct column carried forward. |
| `payment_providers` | `is_default` | reference_values.metadata | Preserve `is_default` inside metadata JSON payload. |
| `payment_providers` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `payment_providers` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `payment_providers` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `payments` | `id` | financial_transactions.id | Direct column carried forward. |
| `payments` | `base_cost` | financial_transactions.metadata | Preserve `base_cost` inside metadata JSON payload. |
| `payments` | `vat_rate` | financial_transactions.metadata | Preserve `vat_rate` inside metadata JSON payload. |
| `payments` | `gross_total` | financial_transactions.metadata | Preserve `gross_total` inside metadata JSON payload. |
| `payments` | `charge_outcome` | financial_transactions.metadata | Preserve `charge_outcome` inside metadata JSON payload. |
| `payments` | `created_at` | financial_transactions.created_at | Direct column carried forward. |
| `payments` | `updated_at` | financial_transactions.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `payments` | `deleted_at` | financial_transactions.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `permission_category` | `id` | reference_values.id | Direct column carried forward. |
| `permission_category` | `name` | reference_values.name | Direct column carried forward. |
| `permission_category` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `permission_category` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `permission_group_permission` | `id` | relationship_links.id | Direct column carried forward. |
| `permission_group_permission` | `permission_group_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `permission_group_permission` | `permission_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `permission_group_permission` | `created_at` | relationship_links.started_at | Temporal column normalized during refactor. |
| `permission_group_permission` | `updated_at` | relationship_links.ended_at | Temporal column normalized during refactor. |
| `permission_groups` | `id` | reference_values.id | Direct column carried forward. |
| `permission_groups` | `name` | reference_values.name | Direct column carried forward. |
| `permission_groups` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `permission_groups` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `permissions` | `id` | reference_values.id | Direct column carried forward. |
| `permissions` | `name` | reference_values.name | Direct column carried forward. |
| `permissions` | `guard_name` | reference_values.metadata | Preserve `guard_name` inside metadata JSON payload. |
| `permissions` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `permissions` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `permissions` | `permission_category_id` | reference_values.metadata | Preserve `permission_category_id` inside metadata JSON payload. |
| `permissions` | `parent_id` | reference_values.metadata | Preserve `parent_id` inside metadata JSON payload. |
| `personal_access_tokens` | `id` | entity_credentials.id | Direct column carried forward. |
| `personal_access_tokens` | `tokenable_type` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; use metadata for provider details. |
| `personal_access_tokens` | `tokenable_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `personal_access_tokens` | `name` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; use metadata for provider details. |
| `personal_access_tokens` | `token` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; use metadata for provider details. |
| `personal_access_tokens` | `abilities` | entity_credentials | Authentication credentials. Align identifiers with entity_id and credential fields; use metadata for provider details. |
| `personal_access_tokens` | `last_used_at` | entity_credentials.last_used_at | Direct column carried forward. |
| `personal_access_tokens` | `created_at` | entity_credentials.created_at | Direct column carried forward. |
| `personal_access_tokens` | `updated_at` | entity_credentials.updated_at | Direct column carried forward. |
| `profile_approval_status` | `id` | reference_values.id | Direct column carried forward. |
| `profile_approval_status` | `name` | reference_values.name | Direct column carried forward. |
| `profile_approval_status` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `profile_approval_status` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `provider_types` | `id` | reference_values.id | Direct column carried forward. |
| `provider_types` | `name` | reference_values.name | Direct column carried forward. |
| `provider_types` | `details` | reference_values.metadata | Preserve `details` inside metadata JSON payload. |
| `provider_types` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `provider_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `provider_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `purpose_credit_types` | `id` | reference_values.id | Direct column carried forward. |
| `purpose_credit_types` | `name` | reference_values.name | Direct column carried forward. |
| `purpose_credit_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `purpose_credit_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `purpose_credit_types` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `quote_note` | `id` | notes.id, note_links.id | Direct column carried forward. |
| `quote_note` | `quote_id` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `quote_note` | `notes` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `quote_note` | `deleted_at` | notes | Centralized note body storage. Preserve note authorship and timestamps. |
| `quote_note` | `created_at` | notes.created_at | Direct column carried forward. |
| `quote_note` | `updated_at` | notes.updated_at | Direct column carried forward. |
| `quotes` | `id` | quotes.id | Direct column carried forward. |
| `quotes` | `drawdown_profile_id` | quotes.metadata | Preserve `drawdown_profile_id` inside metadata JSON payload. |
| `quotes` | `quotes_status_id` | quotes.metadata | Preserve `quotes_status_id` inside metadata JSON payload. |
| `quotes` | `deal_id` | quotes.deal_id | Direct column carried forward. |
| `quotes` | `file_id` | quotes.metadata | Preserve `file_id` inside metadata JSON payload. |
| `quotes` | `notes` | quotes.metadata | Preserve `notes` inside metadata JSON payload. |
| `quotes` | `deleted_at` | quotes.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `quotes` | `created_at` | quotes.created_at | Direct column carried forward. |
| `quotes` | `updated_at` | quotes.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `quotes_recipients` | `id` | quote_recipients.id | Direct column carried forward. |
| `quotes_recipients` | `quote_id` | quote_recipients.quote_id | Direct column carried forward. |
| `quotes_recipients` | `client_individual_id` | quote_recipients | Requires case-by-case migration scripting. |
| `quotes_recipients` | `used_email_address` | quote_recipients | Requires case-by-case migration scripting. |
| `quotes_recipients` | `deleted_at` | quote_recipients | Requires case-by-case migration scripting. |
| `quotes_recipients` | `created_at` | quote_recipients | Requires case-by-case migration scripting. |
| `quotes_recipients` | `updated_at` | quote_recipients | Requires case-by-case migration scripting. |
| `quotes_recipients` | `client_company_id` | quote_recipients | Requires case-by-case migration scripting. |
| `quotes_recipients` | `client_group_id` | quote_recipients | Requires case-by-case migration scripting. |
| `quotes_recipients` | `broker_agent_id` | quote_recipients | Requires case-by-case migration scripting. |
| `quotes_status` | `id` | reference_values.id | Direct column carried forward. |
| `quotes_status` | `name` | reference_values.name | Direct column carried forward. |
| `quotes_status` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `quotes_status` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `quotes_status` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `role_has_permissions` | `permission_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `role_has_permissions` | `role_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `roles` | `id` | reference_values.id, entity_credentials.id | Direct column carried forward. |
| `roles` | `name` | reference_values.name | Direct column carried forward. |
| `roles` | `guard_name` | reference_values.metadata | Preserve `guard_name` inside metadata JSON payload. |
| `roles` | `created_at` | entity_credentials.created_at | Direct column carried forward. |
| `roles` | `updated_at` | entity_credentials.updated_at | Direct column carried forward. |
| `roles` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `scheduled_notifications` | `id` | notifications.id | Direct column carried forward. |
| `scheduled_notifications` | `deal_notification_rule_id` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `scheduled_notifications` | `scheduled_date` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `scheduled_notifications` | `enabled` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `scheduled_notifications` | `enabled_by_user_id` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `scheduled_notifications` | `sent` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `scheduled_notifications` | `datetime_sent` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `scheduled_notifications` | `subject_sent` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `scheduled_notifications` | `body_sent` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `scheduled_notifications` | `created_at` | notifications.created_at | Direct column carried forward. |
| `scheduled_notifications` | `updated_at` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `scheduled_notifications` | `deleted_at` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `scheduled_notifications` | `drawdown_event_id` | notifications | Notification blueprint. Store channel/template references in structured columns and metadata JSON. |
| `service_providers` | `id` | entities.id, relationship_links.id | Direct column carried forward. |
| `service_providers` | `provider_type_id` | relationship_links | Map into polymorphic id slots (left/right) per relationship role. |
| `service_providers` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `service_providers` | `created_at` | entities.created_at | Direct column carried forward. |
| `service_providers` | `updated_at` | entities.updated_at | Direct column carried forward. |
| `service_providers` | `forename` | entities.metadata | Preserve `forename` inside metadata JSON payload. |
| `service_providers` | `surname` | entities.metadata | Preserve `surname` inside metadata JSON payload. |
| `service_providers` | `company` | entities.metadata | Preserve `company` inside metadata JSON payload. |
| `service_providers` | `email` | entities.metadata | Preserve `email` inside metadata JSON payload. |
| `service_providers` | `phone` | entities.metadata | Preserve `phone` inside metadata JSON payload. |
| `service_providers` | `engagement_letter` | entities.metadata | Preserve `engagement_letter` inside metadata JSON payload. |
| `sharepoint_updates_timestamps` | `id` | integration_settings.id | Direct column carried forward. |
| `sharepoint_updates_timestamps` | `last_update` | integration_settings | Integration configuration. Normalize provider-specific data into configuration_json with activation flags. |
| `sharepoint_updates_timestamps` | `change_token` | integration_settings | Integration configuration. Normalize provider-specific data into configuration_json with activation flags. |
| `stripe_settings` | `id` | integration_settings.id | Direct column carried forward. |
| `stripe_settings` | `name` | integration_settings | Integration configuration. Normalize provider-specific data into configuration_json with activation flags. |
| `stripe_settings` | `stripe_key` | integration_settings | Integration configuration. Normalize provider-specific data into configuration_json with activation flags. |
| `stripe_settings` | `stripe_secret` | integration_settings | Integration configuration. Normalize provider-specific data into configuration_json with activation flags. |
| `stripe_settings` | `stripe_webhook_secret` | integration_settings | Integration configuration. Normalize provider-specific data into configuration_json with activation flags. |
| `stripe_settings` | `created_at` | integration_settings.created_at | Direct column carried forward. |
| `stripe_settings` | `updated_at` | integration_settings.updated_at | Direct column carried forward. |
| `stripe_settings` | `deleted_at` | integration_settings | Integration configuration. Normalize provider-specific data into configuration_json with activation flags. |
| `systems_deal_setting` | `id` | workflow_steps.id | Direct column carried forward. |
| `systems_deal_setting` | `name` | workflow_steps.name | Direct column carried forward. |
| `systems_deal_setting` | `order_id` | workflow_steps.metadata | Preserve `order_id` inside metadata JSON payload. |
| `systems_deal_setting` | `systems_deal_setting_group_id` | workflow_steps.metadata | Preserve `systems_deal_setting_group_id` inside metadata JSON payload. |
| `systems_deal_setting` | `status` | workflow_steps.metadata | Preserve `status` inside metadata JSON payload. |
| `systems_deal_setting` | `deleted_at` | workflow_steps.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `systems_deal_setting` | `created_at` | workflow_steps.metadata | Preserve `created_at` inside metadata JSON payload. |
| `systems_deal_setting` | `updated_at` | workflow_steps.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `systems_deal_setting_groups` | `id` | reference_values.id | Direct column carried forward. |
| `systems_deal_setting_groups` | `name` | reference_values.name | Direct column carried forward. |
| `systems_deal_setting_groups` | `order_id` | reference_values.metadata | Preserve `order_id` inside metadata JSON payload. |
| `systems_deal_setting_groups` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `systems_deal_setting_groups` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `systems_deal_setting_groups` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `task` | `id` | workflow_steps.id | Direct column carried forward. |
| `task` | `name` | workflow_steps.name | Direct column carried forward. |
| `task` | `order_id` | workflow_steps.metadata | Preserve `order_id` inside metadata JSON payload. |
| `task` | `task_group_id` | workflow_steps.metadata | Preserve `task_group_id` inside metadata JSON payload. |
| `task` | `auto_assign_to_case_owner` | workflow_steps.metadata | Preserve `auto_assign_to_case_owner` inside metadata JSON payload. |
| `task` | `deleted_at` | workflow_steps.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `task` | `created_at` | workflow_steps.metadata | Preserve `created_at` inside metadata JSON payload. |
| `task` | `updated_at` | workflow_steps.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `task_group` | `id` | workflow_definitions.id | Direct column carried forward. |
| `task_group` | `lending_type_id` | workflow_definitions | Workflow definition catalog. Persist legacy configuration inside definition_json or metadata structures. |
| `task_group` | `name` | workflow_definitions.name | Direct column carried forward. |
| `task_group` | `order_id` | workflow_definitions | Workflow definition catalog. Persist legacy configuration inside definition_json or metadata structures. |
| `task_group` | `deleted_at` | workflow_definitions | Workflow definition catalog. Persist legacy configuration inside definition_json or metadata structures. |
| `task_group` | `created_at` | workflow_definitions.created_at | Direct column carried forward. |
| `task_group` | `updated_at` | workflow_definitions.updated_at | Direct column carried forward. |
| `use_type` | `id` | reference_values.id | Direct column carried forward. |
| `use_type` | `name` | reference_values.name | Direct column carried forward. |
| `use_type` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `use_type` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `use_type` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `user_types` | `id` | reference_values.id | Direct column carried forward. |
| `user_types` | `role_id` | reference_values.metadata | Preserve `role_id` inside metadata JSON payload. |
| `user_types` | `name` | reference_values.name | Direct column carried forward. |
| `user_types` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `user_types` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `user_types` | `is_admin` | reference_values.metadata | Preserve `is_admin` inside metadata JSON payload. |
| `user_types` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `users` | `id` | entities.id, entity_credentials.id | Direct column carried forward. |
| `users` | `type_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `users` | `company_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `users` | `avatar_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `users` | `first_name` | entities.first_name | Direct column carried forward. |
| `users` | `middle_name` | entities.middle_name | Direct column carried forward. |
| `users` | `last_name` | entities.last_name | Direct column carried forward. |
| `users` | `email` | entities.metadata | Preserve `email` inside metadata JSON payload. |
| `users` | `phone` | entities.metadata | Preserve `phone` inside metadata JSON payload. |
| `users` | `email_verified_at` | entities.metadata | Preserve `email_verified_at` inside metadata JSON payload. |
| `users` | `change_password_datetime` | entities.metadata | Preserve `change_password_datetime` inside metadata JSON payload. |
| `users` | `remember_token` | entities.metadata | Preserve `remember_token` inside metadata JSON payload. |
| `users` | `verification_token` | entities.metadata | Preserve `verification_token` inside metadata JSON payload. |
| `users` | `created_at` | entities.created_at, entity_credentials.created_at | Direct column carried forward. |
| `users` | `updated_at` | entities.updated_at, entity_credentials.updated_at | Direct column carried forward. |
| `users` | `stripe_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `users` | `pm_type` | entities.metadata | Preserve `pm_type` inside metadata JSON payload. |
| `users` | `pm_last_four` | entities.metadata | Preserve `pm_last_four` inside metadata JSON payload. |
| `users` | `trial_ends_at` | entities.metadata | Preserve `trial_ends_at` inside metadata JSON payload. |
| `users` | `is_active` | entities.metadata | Preserve `is_active` inside metadata JSON payload. |
| `users` | `deleted_at` | entities.deleted_at | Direct column carried forward. |
| `users` | `payment_provider_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `users` | `file_id` | entity_credentials.entity_id | Mapped into canonical entity reference. |
| `valuation_statuses` | `id` | reference_values.id | Direct column carried forward. |
| `valuation_statuses` | `name` | reference_values.name | Direct column carried forward. |
| `valuation_statuses` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `valuation_statuses` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `valuation_statuses` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `valuations` | `id` | valuations.id | Direct column carried forward. |
| `valuations` | `asset_id` | valuations.metadata | Preserve `asset_id` inside metadata JSON payload. |
| `valuations` | `service_provider_id` | valuations.metadata | Preserve `service_provider_id` inside metadata JSON payload. |
| `valuations` | `document_id` | valuations.metadata | Preserve `document_id` inside metadata JSON payload. |
| `valuations` | `currency_id` | valuations.metadata | Preserve `currency_id` inside metadata JSON payload. |
| `valuations` | `fee_option_id` | valuations.metadata | Preserve `fee_option_id` inside metadata JSON payload. |
| `valuations` | `valuation_status_id` | valuations.metadata | Preserve `valuation_status_id` inside metadata JSON payload. |
| `valuations` | `report_received_date` | valuations.metadata | Preserve `report_received_date` inside metadata JSON payload. |
| `valuations` | `date_expected` | valuations.metadata | Preserve `date_expected` inside metadata JSON payload. |
| `valuations` | `invoice_due_date` | valuations.metadata | Preserve `invoice_due_date` inside metadata JSON payload. |
| `valuations` | `fee_amount` | valuations.metadata | Preserve `fee_amount` inside metadata JSON payload. |
| `valuations` | `file_id` | valuations.metadata | Preserve `file_id` inside metadata JSON payload. |
| `valuations` | `deleted_at` | valuations.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `valuations` | `created_at` | valuations.created_at | Direct column carried forward. |
| `valuations` | `updated_at` | valuations.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `valuations` | `report_requested_date` | valuations.metadata | Preserve `report_requested_date` inside metadata JSON payload. |
| `variable_rate_settings` | `id` | reference_values.id | Direct column carried forward. |
| `variable_rate_settings` | `name` | reference_values.name | Direct column carried forward. |
| `variable_rate_settings` | `value` | reference_values.metadata | Preserve `value` inside metadata JSON payload. |
| `variable_rate_settings` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `variable_rate_settings` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `variable_rate_settings` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `variable_rate_sources` | `id` | reference_values.id | Direct column carried forward. |
| `variable_rate_sources` | `name` | reference_values.name | Direct column carried forward. |
| `variable_rate_sources` | `created_at` | reference_values.metadata | Preserve `created_at` inside metadata JSON payload. |
| `variable_rate_sources` | `updated_at` | reference_values.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `variable_rate_sources` | `deleted_at` | reference_values.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `variable_rates` | `id` | pricing_schedules.id | Direct column carried forward. |
| `variable_rates` | `variable_rate_source_id` | pricing_schedules.metadata | Preserve `variable_rate_source_id` inside metadata JSON payload. |
| `variable_rates` | `parent_id` | pricing_schedules.metadata | Preserve `parent_id` inside metadata JSON payload. |
| `variable_rates` | `rate` | pricing_schedules.metadata | Preserve `rate` inside metadata JSON payload. |
| `variable_rates` | `created_at` | pricing_schedules.metadata | Preserve `created_at` inside metadata JSON payload. |
| `variable_rates` | `updated_at` | pricing_schedules.metadata | Preserve `updated_at` inside metadata JSON payload. |
| `variable_rates` | `deleted_at` | pricing_schedules.metadata | Preserve `deleted_at` inside metadata JSON payload. |
| `variable_rates_history` | `id` | pricing_history.id | Direct column carried forward. |
| `variable_rates_history` | `date` | pricing_history | Requires case-by-case migration scripting. |
| `variable_rates_history` | `variable_rate_source_id` | pricing_history | Requires case-by-case migration scripting. |
| `variable_rates_history` | `rate` | pricing_history | Requires case-by-case migration scripting. |
| `variable_rates_history` | `created_at` | pricing_history | Requires case-by-case migration scripting. |
| `variable_rates_history` | `updated_at` | pricing_history | Requires case-by-case migration scripting. |
| `variable_rates_history` | `deleted_at` | pricing_history | Requires case-by-case migration scripting. |
| `variable_rates_history_copy1` | `id` | pricing_history.id | Direct column carried forward. |
| `variable_rates_history_copy1` | `date` | pricing_history | Requires case-by-case migration scripting. |
| `variable_rates_history_copy1` | `variable_rate_source_id` | pricing_history | Requires case-by-case migration scripting. |
| `variable_rates_history_copy1` | `rate` | pricing_history | Requires case-by-case migration scripting. |
| `variable_rates_history_copy1` | `created_at` | pricing_history | Requires case-by-case migration scripting. |
| `variable_rates_history_copy1` | `updated_at` | pricing_history | Requires case-by-case migration scripting. |
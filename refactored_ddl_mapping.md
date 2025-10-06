# Refactored DDL Mapping Flow

The `refactored_ddl.sh` script renders a domain-by-domain narrative explaining how every legacy table defined in `ddl.sql` maps into the polymorphic schema captured in `refactored_ddl.sql`. This document outlines what the script produces, how to run it, and how to interpret the results when planning migrations or documentation updates.

## Running the script

Execute the script from the repository root so it can resolve the adjacent SQL files:

```bash
./refactored_ddl.sh
```

You can redirect the output into Markdown or CSV processors for further formatting, or pipe it through tools like `less` for interactive browsing. Each section prints after a blank line so the flow reads naturally in terminals or generated docs.【F:refactored_ddl.sh†L1-L69】

## Output structure

The script prints a titled section for each functional domain found in the legacy schema. Under each heading, the script enumerates all source tables followed by the consolidated tables that now own their data. Example snippet:

```
Party & Relationship Management
-------------------------------
  companies -> entities
  brokers -> entities, relationship_links (entity role)
  broker_agents -> entities, relationship_links (association)
  ...
```

This format surfaces:

- **Destination tables.** The right-hand side lists one or more polymorphic tables that replace each legacy structure.
- **Contextual notes.** Parenthetical comments explain the role the polymorphic tables play (e.g., deal participation vs. attribute assignment).【F:refactored_ddl.sh†L71-L132】
- **Domain coverage.** Every legacy table appears exactly once, so you can trace the full 149-table `ddl.sql` into the 50-table refactored design without missing dependencies.【F:refactored_ddl.sh†L17-L132】

## Detailed source-to-target examples

The table below illustrates how to read the mapping by walking through frequently asked migrations. Each row pulls a representative line from the script and shows how the refactored tables capture the legacy attributes when you port the data.

| Legacy source table | Refactored destination(s) | How the destination stores the data |
| --- | --- | --- |
| `broker_agent_deals` | `relationship_links` | Each legacy association between a broker agent and a deal becomes a `relationship_links` record with `left_type='entities'`, `left_id=<broker_agent entity id>`, `right_type='deals'`, `right_id=<deal id>`, plus `relationship_type_id`/`role_value_id` to preserve assignment semantics. Optional columns like `amount_value` or bespoke flags now live in governed `attribute_assignments` rows tied to the relationship record.【F:refactored_ddl.sh†L95-L120】【F:refactored_ddl.sql†L201-L220】 |
| `entity_contacts` | `contact_points` | Every phone, email, or other contact row translates into a morph record where `contactable_type='entities'` and `contactable_id` references the party. Original labels and verification flags map directly to `label`, `is_primary`, and `is_verified`, while extra columns can move into scoped `attribute_assignments` if the contact requires additional descriptors.【F:refactored_ddl.sh†L123-L129】【F:refactored_ddl.sql†L82-L100】 |
| `asset_addresses` | `address_links` | Existing asset-to-address relationships populate `address_links` with `addressable_type='assets'`, the legacy address foreign key stored as `address_id`, and any usage/category codes mapped to `usage_type_id`. Effective date columns from the source map to `valid_from`/`valid_to`, retaining historical accuracy.【F:refactored_ddl.sh†L123-L129】【F:refactored_ddl.sql†L120-L138】 |
| `deal_notes` | `notes`, `note_links` | Note bodies migrate into `notes.note_body` while author references map to `author_entity_id`. A companion `note_links` row records the `notable_type='deals'` and `notable_id` so the same note can still attach to multiple records, mirroring the legacy polymorphism via morph columns.【F:refactored_ddl.sh†L95-L120】【F:refactored_ddl.sql†L387-L407】 |
| `bank_details` | `financial_accounts` | Banking rows move into `financial_accounts` with `accountable_type='entities'` (or another owning model), `account_reference` storing the legacy account number, and optional routing numbers captured in dedicated fields. Date ranges remain in `valid_from`/`valid_to` while nuanced banking traits shift into `attribute_assignments` scoped to the account when no dedicated column exists.【F:refactored_ddl.sh†L95-L120】【F:refactored_ddl.sql†L138-L157】 |

## Column-level mapping reference

The matrix below extends the narrative with concrete column pairings so data engineers can script migrations without reverse engineering the schema. Each row surfaces a commonly migrated attribute, its landing zone, and the conventions used when shape or semantics shift during the refactor.

To satisfy requests for full coverage, the repository now ships with a generated companion file—[`refactored_column_mapping.md`](./refactored_column_mapping.md)—that enumerates **every** column declared in `ddl.sql`, the refactored structure that receives it, and guidance for handling polymorphic or attribute-driven moves. Regenerate the report after schema edits with:

```bash
python generate_column_mapping.py
```

The high-level examples below illustrate how to interpret the comprehensive matrix.

| Legacy table | Legacy column | Refactored table | Refactored column(s) | Notes |
| --- | --- | --- | --- | --- |
| `asset_addresses` | `postcode`, `county`, `city`, `district`, `street`, `house_number` | `postal_addresses` | `postcode`, `county`, `city`, `district`, `street`, `house_number` | Core location fields lift-and-shift into the consolidated address catalog; `country` is normalized into `postal_addresses.country_code` using ISO values during migration.【F:ddl.sql†L44-L55】【F:refactored_ddl.sql†L100-L118】 |
| `asset_addresses` | `id` | `address_links` | `address_id` | When assets reference their address record, the foreign key transitions into the polymorphic join so the same `postal_addresses` row can attach to multiple owners via `addressable_type`/`addressable_id`.【F:ddl.sql†L44-L55】【F:refactored_ddl.sql†L120-L133】 |
| `bank_details` | `account_number`, `sort_code`, `bic`, `iban` | `financial_accounts` | `account_reference`, `sort_code`, `bic`, `iban` | Account context keeps its own columns; `account_reference` stores the historic account number while stateful flags use `attribute_assignments` or status lookup values instead of ad-hoc payloads.【F:ddl.sql†L115-L124】【F:refactored_ddl.sql†L137-L153】 |
| `broker_agent_deals` | `broker_agent_id` | `relationship_links` | `left_id` (`left_type='entities'`) | Broker agents now materialize as `entities`, so the join’s agent foreign key lands in the polymorphic `left_id` slot to support reuse with other entity roles.【F:ddl.sql†L1444-L1455】【F:refactored_ddl.sql†L201-L209】 |
| `broker_agent_deals` | `deal_id`, `created_at`, `updated_at` | `relationship_links` | `right_id`, `started_at`, `ended_at` | Deal associations remain on the right-hand side while lifecycle timestamps align with the temporal columns that drive relationship histories in the refactored model.【F:ddl.sql†L1444-L1455】【F:refactored_ddl.sql†L205-L217】 |
| `broker_agent_notes` | `note_id`, `broker_agent_id` | `note_links` | `note_id`, `notable_id` (`notable_type='entities'`) | Notes still point to their text record; the association now uses morph columns so the same note can fan out to multiple entities without bespoke bridge tables.【F:ddl.sql†L1462-L1475】【F:refactored_ddl.sql†L396-L404】 |
| `deal_notes` | `note`, `created_by_user_id`, `deal_id` | `notes`, `note_links` | `note_body`, `author_entity_id`, `notable_id` (`notable_type='deals'`) | Deal commentary is preserved by moving the text and author to `notes` while the deal relationship continues through `note_links`, enabling cross-record reuse.【F:ddl.sql†L1902-L1915】【F:refactored_ddl.sql†L387-L404】 |


## Column-level mapping reference

The matrix below extends the narrative with concrete column pairings so data engineers can script migrations without reverse engineering the schema. Each row surfaces a commonly migrated attribute, its landing zone, and the conventions used when shape or semantics shift during the refactor.

To satisfy requests for full coverage, the repository now ships with a generated companion file—[`refactored_column_mapping.md`](./refactored_column_mapping.md)—that enumerates **every** column declared in `ddl.sql`, the refactored structure that receives it, and guidance for handling polymorphic or metadata-driven moves. Regenerate the report after schema edits with:

```bash
python generate_column_mapping.py
```

The high-level examples below illustrate how to interpret the comprehensive matrix.

| Legacy table | Legacy column | Refactored table | Refactored column(s) | Notes |
| --- | --- | --- | --- | --- |
| `asset_addresses` | `postcode`, `county`, `city`, `district`, `street`, `house_number` | `postal_addresses` | `postcode`, `county`, `city`, `district`, `street`, `house_number` | Core location fields lift-and-shift into the consolidated address catalog; `country` is normalized into `postal_addresses.country_code` using ISO values during migration.【F:ddl.sql†L44-L55】【F:refactored_ddl.sql†L100-L118】 |
| `asset_addresses` | `id` | `address_links` | `address_id` | When assets reference their address record, the foreign key transitions into the polymorphic join so the same `postal_addresses` row can attach to multiple owners via `addressable_type`/`addressable_id`.【F:ddl.sql†L44-L55】【F:refactored_ddl.sql†L120-L133】 |
| `bank_details` | `account_number`, `sort_code`, `bic`, `iban` | `financial_accounts` | `account_reference`, `sort_code`, `bic`, `iban` | Account metadata keeps its own columns; `account_reference` stores the historic account number while `metadata` captures any soft-deleted flags that previously relied on `deleted_at`.【F:ddl.sql†L115-L124】【F:refactored_ddl.sql†L137-L153】 |
| `broker_agent_deals` | `broker_agent_id` | `relationship_links` | `left_id` (`left_type='entities'`) | Broker agents now materialize as `entities`, so the join’s agent foreign key lands in the polymorphic `left_id` slot to support reuse with other entity roles.【F:ddl.sql†L1444-L1455】【F:refactored_ddl.sql†L201-L209】 |
| `broker_agent_deals` | `deal_id`, `created_at`, `updated_at` | `relationship_links` | `right_id`, `started_at`, `ended_at` | Deal associations remain on the right-hand side while lifecycle timestamps align with the temporal columns that drive relationship histories in the refactored model.【F:ddl.sql†L1444-L1455】【F:refactored_ddl.sql†L205-L217】 |
| `broker_agent_notes` | `note_id`, `broker_agent_id` | `note_links` | `note_id`, `notable_id` (`notable_type='entities'`) | Notes still point to their text record; the association now uses morph columns so the same note can fan out to multiple entities without bespoke bridge tables.【F:ddl.sql†L1462-L1475】【F:refactored_ddl.sql†L396-L404】 |
| `deal_notes` | `note`, `created_by_user_id`, `deal_id` | `notes`, `note_links` | `note_body`, `author_entity_id`, `notable_id` (`notable_type='deals'`) | Deal commentary is preserved by moving the text and author to `notes` while the deal relationship continues through `note_links`, enabling cross-record reuse.【F:ddl.sql†L1902-L1915】【F:refactored_ddl.sql†L387-L404】 |


## Table reduction rationale

The mapping demonstrates how consolidating redundant join and lookup tables into polymorphic structures reduced the schema footprint from 149 to 50 base tables. Common examples include:

- **Relationship pivots** now handled by `relationship_links`, eliminating numerous bespoke association tables.
- **Contact and address joins** replaced with `contact_points` and `address_links`, letting any model attach communication and location data without new junction tables.
- **Reference enumerations** centralized in `reference_domains` and `reference_values`, removing dozens of duplicated lookup tables.

These consolidations preserve every legacy attribute by relying on typed columns and the shared attribute framework rather than amorphous payloads, maintaining functional parity while shrinking table count.【F:refactored_ddl.sql†L5-L223】

## Using the mapping during migrations

- **Migration planning.** Use each section as a checklist when migrating a domain—ensure every source table has a target and that polymorphic links are populated with the appropriate `{type, id}` pairs.
- **Documentation.** Redirect the script output into project wikis to keep human-readable mappings in sync with schema changes; rerunning the script automatically reflects future updates.
- **Automation.** Because the output is deterministic, you can feed it into parsing scripts or tests that verify no legacy tables are left unmapped.

By pairing this document with the script itself, teams gain both automated and narrative views of how the refactored schema encapsulates the legacy data model.

## Working with polymorphic relationships

Laravel's morph relationships map cleanly onto the consolidated tables through shared `{name}_type` and `{name}_id` columns. The catalogue below summarises where polymorphism shows up and why each table exists.

- **`activity_logs`** – Implements a polymorphic audit trail using `subject_type/subject_id` and `causer_type/causer_id` pairs. This aligns with Laravel's Spatie Activitylog package, allowing the application to record lifecycle events against any morphable record while retaining the original audit attributes from the legacy system.【F:refactored_ddl.sql†L1-L20】
- **`contact_points`** – Centralises phone numbers, emails, and other communication handles for any model through `contactable_type/contactable_id` while preserving type information in `contact_type_id`.【F:refactored_ddl.sql†L84-L98】
- **`address_links`** – Allows any model to reuse a `postal_addresses` record by storing the owner in `addressable_type/addressable_id`. Usage semantics are captured with `usage_type_id`.【F:refactored_ddl.sql†L122-L135】
- **`financial_accounts`** – Consolidates bank, escrow, and suspense accounts into a single table keyed by `accountable_type/accountable_id`. Legacy account tables now land here with `account_type_id` describing the specific purpose.【F:refactored_ddl.sql†L139-L156】
- **`attribute_assignments`** – Stores dynamic, strongly typed attributes for any owner through `owner_type/owner_id`, enabling governed extensions without table proliferation.【F:refactored_ddl.sql†L168-L183】
- **`relationship_links`** – Replaces numerous join tables by tracking both sides of an association with `left_type/left_id` and `right_type/right_id`. Optional role, status, amount, and context columns hold the bespoke payload that used to be scattered across domain-specific pivots.【F:refactored_ddl.sql†L200-L223】
- **`workflow_definitions`** – Scopes automations to either the global platform, a tenant, or a specific product using `scope_type/scope_identifier`.【F:refactored_ddl.sql†L302-L327】
- **`workflow_instances`** – Associates a workflow run with any subject via `subject_type/subject_id`, mirroring how legacy processes referenced heterogeneous tables.【F:refactored_ddl.sql†L327-L335】
- **`document_links`** – Attaches documents to any record, capturing purpose through `link_role_id` while leveraging `linkable_type/linkable_id` for the polymorphic join.【F:refactored_ddl.sql†L364-L385】
- **`note_links`** – Lets a single note fan out to multiple subjects with `notable_type/notable_id`, removing the need for per-entity note tables.【F:refactored_ddl.sql†L387-L405】
- **`notification_targets`** – Records who should receive each notification by targeting either a concrete model (`target_type/target_id`) or a raw address (`target_address`).【F:refactored_ddl.sql†L409-L444】
- **`financial_transactions`** – Tracks payments against either internal entities or external references through `counterparty_type/counterparty_id`.【F:refactored_ddl.sql†L449-L462】
- **`financial_allocations`** – Splits a single transaction across different recipients or artefacts by pointing `reference_type/reference_id` at invoices, assets, or workflow steps.【F:refactored_ddl.sql†L467-L479】
- **`quote_recipients`** – Mirrors notification targeting for outbound quotes, enabling delivery to entities or ad-hoc contacts with `recipient_type/recipient_id` and `recipient_contact`.【F:refactored_ddl.sql†L503-L566】
- **`form_responses`** – Captures submissions tied to any business object with `subject_type/subject_id`, replacing scattered `*_form_responses` tables.【F:refactored_ddl.sql†L595-L603】
- **`valuations`** – Stores appraisal data for any asset-like record via `valuable_type/valuable_id`.【F:refactored_ddl.sql†L614-L624】
- **`audit_events`** – Provides system-level auditing scoped to any resource through `scope_type/scope_id`.【F:refactored_ddl.sql†L641-L652】
- **`system_settings`** – Reuses the same scope pattern to override configuration per tenant, region, or deal via `scope_type/scope_id`.【F:refactored_ddl.sql†L663-L668】

### Sample polymorphic payloads

The examples below pair representative rows with the rationale for each polymorphic structure so migrations can seed realistic data and developers understand the intended usage.

#### `activity_logs`

| id | subject_type | subject_id | causer_type | causer_id | description |
| --- | --- | --- | --- | --- | --- |
| 101 | `deals` | 42 | `entities` | 9001 | `Deal status moved to Credit Review` |
| 102 | `documents` | 550 | `system_jobs` | 12 | `Automated ingestion completed` |

**How/why it is used:** Records lifecycle events against any resource alongside the actor that triggered it, enabling unified audit feeds instead of per-module history tables.【F:refactored_ddl.sql†L1-L20】

#### `contact_points`

| id | contactable_type | contactable_id | contact_type_id | contact_value | is_primary |
| --- | --- | --- | --- | --- | --- |
| 201 | `entities` | 105 | 71001 | `ceo@example.com` | `true` |
| 202 | `deals` | 42 | 71002 | `+44 20 7946 1234` | `false` |

**How/why it is used:** Consolidates phone and email records so any party or transaction can store communication endpoints without bespoke `*_emails` or `*_phones` tables.【F:refactored_ddl.sql†L84-L98】

#### `address_links`

| id | addressable_type | addressable_id | address_id | usage_type_id | is_primary |
| --- | --- | --- | --- | --- | --- |
| 301 | `entities` | 105 | 7 | 31101 | `true` |
| 302 | `deals` | 42 | 7 | 31102 | `false` |

**How/why it is used:** Allows a validated postal address to be shared across counterparties and deals while tagging the purpose (registered office vs. collateral site).【F:refactored_ddl.sql†L100-L135】

#### `financial_accounts`

| id | accountable_type | accountable_id | account_type_id | account_reference | currency_code |
| --- | --- | --- | --- | --- | --- |
| 401 | `entities` | 105 | 41001 | `GB12BARC20040123456789` | `GBP` |
| 402 | `deals` | 42 | 41003 | `TRUST-ESCROW-42` | `GBP` |

**How/why it is used:** Normalises bank, escrow, and suspense accounts so treasury logic can look in one table regardless of who owns the account.【F:refactored_ddl.sql†L137-L156】

#### `attribute_assignments`

| id | owner_type | owner_id | definition_id | value_text | valid_from |
| --- | --- | --- | --- | --- | --- |
| 501 | `deals` | 42 | 88001 | `High Net Worth` | `2024-01-15` |
| 502 | `entities` | 105 | 88005 | `Politically exposed person` | `2023-06-01` |

**How/why it is used:** Carries flexible, domain-specific attributes without schema changes; time-boxed records capture historical context for compliance and reporting.【F:refactored_ddl.sql†L168-L183】

#### `relationship_links`

| id | left_type | left_id | right_type | right_id | relationship_type_id | role_value_id | context_type | context_id |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 601 | `entities` | 105 | `deals` | 42 | 52101 | 52111 | `deals` | 42 |
| 602 | `entities` | 223 | `entities` | 105 | 52102 | 52121 | `deals` | 42 |

**How/why it is used:** Collapses borrowers, guarantors, introducers, and team assignments into one join table while preserving role, status, and monetary payload that used to live in bespoke pivots.【F:refactored_ddl.sql†L200-L223】

#### `workflow_definitions`

| id | scope_type | scope_identifier | name | trigger_event_type_id |
| --- | --- | --- | --- | --- |
| 701 | `global` | NULL | `Deal onboarding` | 63001 |
| 702 | `entities` | `105` | `Borrower remediation` | 63005 |

**How/why it is used:** Allows workflow templates to be reused globally or narrowed to a specific client or product line without duplicating definition tables.【F:refactored_ddl.sql†L302-L327】

#### `workflow_instances`

| id | definition_id | subject_type | subject_id | status_value_id |
| --- | --- | --- | --- | --- |
| 801 | 701 | `deals` | 42 | 64010 |
| 802 | 702 | `entities` | 105 | 64020 |

**How/why it is used:** Tracks each execution of a workflow against its target record, supporting heterogeneous process automation across the platform.【F:refactored_ddl.sql†L327-L335】

#### `document_links`

| id | document_id | linkable_type | linkable_id | link_role_id |
| --- | --- | --- | --- | --- |
| 901 | 550 | `deals` | 42 | 75001 |
| 902 | 550 | `entities` | 105 | 75002 |

**How/why it is used:** Replaces per-module document join tables so one uploaded file can satisfy both deal-level and party-level requirements.【F:refactored_ddl.sql†L364-L385】

#### `note_links`

| id | note_id | notable_type | notable_id |
| --- | --- | --- | --- |
| 1001 | 9001 | `deals` | 42 |
| 1002 | 9001 | `entities` | 105 |

**How/why it is used:** Allows a single conversation thread to appear wherever it is relevant, keeping commentary consistent across related records.【F:refactored_ddl.sql†L387-L405】

#### `notification_targets`

| id | notification_id | target_type | target_id | target_address | channel_type_id |
| --- | --- | --- | --- | --- | --- |
| 1101 | 1200 | `entities` | 105 | NULL | 80101 |
| 1102 | 1200 | NULL | NULL | `ops@example.com` | 80102 |

**How/why it is used:** Supports blended delivery so the system can notify platform users through in-app channels and escalate to external email or SMS recipients without separate tables.【F:refactored_ddl.sql†L409-L444】

#### `financial_transactions`

| id | deal_id | counterparty_type | counterparty_id | transaction_type_id | gross_amount |
| --- | --- | --- | --- | --- | --- |
| 1201 | 42 | `entities` | 105 | 90101 | `250000.00` |
| 1202 | 42 | `external_accounts` | 77 | 90102 | `-5000.00` |

**How/why it is used:** Harmonises incoming and outgoing cash movements regardless of who sits on the other side, streamlining reconciliation and reporting pipelines.【F:refactored_ddl.sql†L449-L462】

#### `financial_allocations`

| id | transaction_id | allocation_type_id | reference_type | reference_id | amount |
| --- | --- | --- | --- | --- | --- |
| 1301 | 1201 | 90501 | `invoices` | 3301 | `200000.00` |
| 1302 | 1201 | 90502 | `fees` | 7701 | `50000.00` |

**How/why it is used:** Splits a transaction across invoices, fees, or reserves without separate pivot tables, keeping allocation logic extensible.【F:refactored_ddl.sql†L467-L479】

#### `quote_recipients`

| id | quote_id | recipient_type | recipient_id | recipient_contact | channel_type_id |
| --- | --- | --- | --- | --- | --- |
| 1401 | 2100 | `entities` | 105 | `ceo@example.com` | 80102 |
| 1402 | 2100 | `external_contacts` | 12 | `broker@example.com` | 80102 |

**How/why it is used:** Provides flexibility for outbound quotes to reach internal stakeholders or external introducers without duplicating delivery logic.【F:refactored_ddl.sql†L503-L566】

#### `form_responses`

| id | form_id | subject_type | subject_id | respondent_entity_id | status_value_id |
| --- | --- | --- | --- | --- | --- |
| 1501 | 310 | `deals` | 42 | 105 | 96010 |
| 1502 | 311 | `entities` | 223 | 223 | 96020 |

**How/why it is used:** Centralises structured data capture (KYC, onboarding questionnaires) irrespective of which business object the form supports.【F:refactored_ddl.sql†L595-L603】

#### `valuations`

| id | valuable_type | valuable_id | valuation_type_id | valuation_amount | valuation_date |
| --- | --- | --- | --- | --- | --- |
| 1601 | `assets` | 88 | 97001 | `1250000.00` | `2024-03-01` |
| 1602 | `deals` | 42 | 97005 | `2450000.00` | `2024-03-15` |

**How/why it is used:** Supports appraisals for both collateral and whole deals, unlocking portfolio-level analytics without additional bridge tables.【F:refactored_ddl.sql†L614-L624】

#### `audit_events`

| id | scope_type | scope_id | actor_entity_id | event_type_id | event_at |
| --- | --- | --- | --- | --- | --- |
| 1701 | `system_settings` | 55 | 9001 | 99001 | `2024-04-02T10:12:00Z` |
| 1702 | `deals` | 42 | 9002 | 99002 | `2024-04-02T11:45:00Z` |

**How/why it is used:** Audits administrative changes and domain events with a consistent scope pattern so compliance teams can filter by any resource type.【F:refactored_ddl.sql†L641-L652】

#### `system_settings`

| id | setting_key | scope_type | scope_id | value_json |
| --- | --- | --- | --- | --- |
| 1801 | `document.retention.years` | `global` | NULL | `{ "years": 7 }` |
| 1802 | `deal.workflow.default` | `deals` | `42` | `{ "definition_id": 701 }` |

**How/why it is used:** Stores configuration overrides at multiple levels (platform-wide, per deal, per tenant) using the same polymorphic scoping model, avoiding separate settings tables for each domain.【F:refactored_ddl.sql†L663-L668】

Use these examples as templates when seeding data or validating migrations—the `{type, id}` pairs should always reference the canonical tables defined in `refactored_ddl.sql` and align with the morph maps configured in the application layer.

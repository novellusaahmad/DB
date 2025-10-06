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
- **Contextual notes.** Parenthetical comments explain the role the polymorphic tables play (e.g., deal participation vs. metadata assignment).【F:refactored_ddl.sh†L71-L132】
- **Domain coverage.** Every legacy table appears exactly once, so you can trace the full 149-table `ddl.sql` into the 50-table refactored design without missing dependencies.【F:refactored_ddl.sh†L17-L132】

## Detailed source-to-target examples

The table below illustrates how to read the mapping by walking through frequently asked migrations. Each row pulls a representative line from the script and shows how the refactored tables capture the legacy attributes when you port the data.

| Legacy source table | Refactored destination(s) | How the destination stores the data |
| --- | --- | --- |
| `broker_agent_deals` | `relationship_links` | Each legacy association between a broker agent and a deal becomes a `relationship_links` record with `left_type='entities'`, `left_id=<broker_agent entity id>`, `right_type='deals'`, `right_id=<deal id>`, plus `relationship_type_id`/`role_value_id` to preserve assignment semantics. Optional columns like `amount_value` or `metadata` absorb any bespoke flags that lived on the join table.【F:refactored_ddl.sh†L95-L120】【F:refactored_ddl.sql†L201-L220】 |
| `entity_contacts` | `contact_points` | Every phone, email, or other contact row translates into a morph record where `contactable_type='entities'` and `contactable_id` references the party. Original labels and verification flags map directly to `label`, `is_primary`, and `is_verified`, while extra columns can move into the `metadata` JSON column.【F:refactored_ddl.sh†L123-L129】【F:refactored_ddl.sql†L82-L100】 |
| `asset_addresses` | `address_links` | Existing asset-to-address relationships populate `address_links` with `addressable_type='assets'`, the legacy address foreign key stored as `address_id`, and any usage/category codes mapped to `usage_type_id`. Effective date columns from the source map to `valid_from`/`valid_to`, retaining historical accuracy.【F:refactored_ddl.sh†L123-L129】【F:refactored_ddl.sql†L120-L138】 |
| `deal_notes` | `notes`, `note_links` | Note bodies migrate into `notes.note_body` while author references map to `author_entity_id`. A companion `note_links` row records the `notable_type='deals'` and `notable_id` so the same note can still attach to multiple records, mirroring the legacy polymorphism via morph columns.【F:refactored_ddl.sh†L95-L120】【F:refactored_ddl.sql†L387-L407】 |
| `bank_details` | `financial_accounts` | Banking rows move into `financial_accounts` with `accountable_type='entities'` (or another owning model), `account_reference` storing the legacy account number, and optional routing numbers captured in dedicated fields. Date ranges and bespoke attributes transfer into `valid_from`, `valid_to`, and `metadata` to avoid data loss.【F:refactored_ddl.sh†L95-L120】【F:refactored_ddl.sql†L138-L157】 |

## Table reduction rationale

The mapping demonstrates how consolidating redundant join and lookup tables into polymorphic structures reduced the schema footprint from 149 to 50 base tables. Common examples include:

- **Relationship pivots** now handled by `relationship_links`, eliminating numerous bespoke association tables.
- **Contact and address joins** replaced with `contact_points` and `address_links`, letting any model attach communication and location data without new junction tables.
- **Reference enumerations** centralized in `reference_domains` and `reference_values`, removing dozens of duplicated lookup tables.

These consolidations preserve every legacy attribute by moving optional fields into JSON `metadata` columns or the shared attribute framework, maintaining functional parity while shrinking table count.【F:refactored_ddl.sql†L5-L223】

## Using the mapping during migrations

- **Migration planning.** Use each section as a checklist when migrating a domain—ensure every source table has a target and that polymorphic links are populated with the appropriate `{type, id}` pairs.
- **Documentation.** Redirect the script output into project wikis to keep human-readable mappings in sync with schema changes; rerunning the script automatically reflects future updates.
- **Automation.** Because the output is deterministic, you can feed it into parsing scripts or tests that verify no legacy tables are left unmapped.

By pairing this document with the script itself, teams gain both automated and narrative views of how the refactored schema encapsulates the legacy data model.

# Refactored Data Model Briefing (Business)

## Why the refactor matters
- **Lean foundation.** The platform now runs on 50 core tables instead of 149, reducing operational overhead and making it faster to deliver new products without waiting on database redesigns.【F:refactored_ddl.sh†L228-L231】
- **Consistent experiences.** Shared services for parties, contacts, documents, and workflows mean every team sees the same customer, deal, and communication data, eliminating reconciliation across siloed tables.【F:refactored_ddl.sql†L57-L520】
- **Future-ready flexibility.** Polymorphic link tables and configurable attributes let us add new relationship types, product features, or compliance fields by configuration rather than structural changes, keeping delivery timelines predictable.【F:refactored_ddl.sql†L180-L257】

## How everyday processes improve
- **Customer onboarding.** Companies, individuals, brokers, and guarantors all live in a single `entities` table, so once a party is onboarded it can participate in any deal, receive notifications, or hold financial accounts without duplicate records.【F:refactored_ddl.sql†L57-L178】【F:refactored_ddl.sh†L34-L120】
- **Single source of communication truth.** Phone numbers, emails, and physical addresses attach to any business object through reusable link tables, allowing sales, operations, and servicing to rely on the same verified contact set.【F:refactored_ddl.sql†L97-L155】【F:refactored_ddl.sh†L122-L129】
- **Document and note sharing.** Deal packs, valuation reports, and internal notes are stored once and linked wherever needed, giving compliance and underwriting teams immediate visibility while preserving permissions through role lookups.【F:refactored_ddl.sql†L401-L472】【F:refactored_ddl.sh†L148-L205】
- **Financial clarity.** Charges, fees, drawdowns, and payments flow into unified transaction and allocation tables, streamlining reconciliation, reporting, and audit readiness.【F:refactored_ddl.sql†L521-L659】【F:refactored_ddl.sh†L167-L185】
- **Automated workflows.** The workflow suite orchestrates tasks, approvals, and notifications without custom tables per process, so introducing a new product journey is largely configuration and content rather than engineering work.【F:refactored_ddl.sql†L347-L520】【F:refactored_ddl.sh†L148-L205】

## What to expect during rollout
1. **Reference catalog uplift.** Business SMEs define the enumerations (statuses, roles, product codes) that populate the shared reference tables so applications present the right choices from day one.【F:refactored_ddl.sql†L33-L53】【F:refactored_ddl.sh†L48-L92】
2. **Party and relationship migration.** Existing customer, broker, lender, and guarantor records are merged into `entities` with relationship links that preserve their roles on historic deals, protecting audit trails while removing duplicates.【F:refactored_ddl.sql†L57-L257】【F:refactored_ddl.sh†L94-L120】
3. **Operational continuity.** Workflow definitions, system jobs, and audit logs are migrated so automation and compliance monitoring continue without interruption after cutover.【F:refactored_ddl.sql†L347-L830】【F:refactored_ddl.sh†L22-L33】【F:refactored_ddl.sh†L148-L172】

## Business outcomes
- **Faster product launches:** New offerings reuse existing tables and lookups, accelerating go-to-market and reducing regression risk.【F:refactored_ddl.sql†L33-L598】
- **Improved reporting:** Consolidated transaction, workflow, and document data ensures management reporting draws from a single, reliable set of tables, reducing manual reconciliations.【F:refactored_ddl.sql†L347-L659】
- **Lower maintenance costs:** Fewer tables mean fewer bespoke migrations, simpler change control, and a clearer audit story for regulators and partners.【F:refactored_ddl.sh†L228-L231】【F:refactored_ddl.sql†L788-L863】

## Where every legacy table lands
Business and data teams asked for a simple way to confirm that nothing has been left behind. The appendix now links every one of the 149 legacy tables to the refactored structure that serves it, grouped by functional area (identity, reference data, deals, transactions, documents, workflows, and more). Use it to brief stakeholders on where familiar datasets will surface in the new operating model and which refactored capability (entity hub, workflow suite, shared documents, unified ledger, etc.) they should query for future reporting.【F:docs/refactored_table_convergence.md†L1-L230】【F:docs/refactored_table_convergence.md†L230-L366】【F:docs/refactored_table_convergence.md†L366-L407】

### How to read the appendix
1. **Scan by domain.** Each section (e.g., “Identity & Access Management”, “Deal Lifecycle & Workflow”) lists the legacy source tables you know today and points to the refactored table(s) that deliver the same information going forward.【F:docs/refactored_table_convergence.md†L12-L171】【F:docs/refactored_table_convergence.md†L172-L318】
2. **Understand the capability.** The “Convergence detail” column explains which shared platform service now owns that data—helpful when planning cutover comms or training for teams such as sales ops, credit, or compliance.【F:docs/refactored_table_convergence.md†L12-L171】【F:docs/refactored_table_convergence.md†L230-L318】
3. **Share tailored extracts.** Filter the table to produce audience-specific cheat sheets (e.g., all finance and payment tables for Treasury) without rewriting the mapping.

> 📎 **Appendix A – Legacy-to-Refactored Table Matrix**: See `docs/refactored_table_convergence.md` for the full, always up-to-date matrix covering all 149 source tables and their new homes.【F:docs/refactored_table_convergence.md†L1-L407】

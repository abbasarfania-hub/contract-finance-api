# Contract Finance API (PL/SQL)

## Overview
This project is a **portfolio-grade PL/SQL package** that demonstrates how to design and implement a **contract finance calculation engine** in Oracle Database.

The package exposes a clean API for calculating various financial metrics related to contracts, such as total amounts, principal, interest, penalties, insurance, and execution-related figures.

This repository is intended to showcase **Senior-level Oracle / Data Engineering skills**, including package design, refactoring, abstraction, and testability.

---

## Why This Project Exists
In many enterprise systems (especially banking, insurance, and financial platforms), complex financial logic accumulates over time and becomes:

- Hard to maintain
- Difficult to test
- Tightly coupled to database tables
- Risky to refactor

This project demonstrates how such logic can be:
- Consolidated
- Simplified
- Exposed through a clear API
- Made testable with sample data

---

## What This Package Does
The package provides functions and procedures to:

- Build a **contract context** from multiple data sources
- Calculate:
  - Total contract amount
  - Principal
  - Interest
  - Penalties
  - Insurance-related values
  - Execution and settlement adjustments
- Log processing steps for traceability
- Support batch-style execution patterns

All calculations are performed using **pure PL/SQL logic** with a focus on readability and maintainability.

---

## Technical Highlights (Senior-Level)
- Clean **Package Spec / Body separation**
- API-oriented design (callable from SQL, jobs, or ETL tools)
- Reduced function sprawl by consolidating logic
- Defensive coding (NULL handling, controlled exceptions)
- Sample data for reproducible testing
- Enterprise-friendly naming and structure

---

## Project Structure

.
├── contract_finance_api_spec.sql -- Package specification
├── contract_finance_api_body.sql -- Package body (implementation)
├── sample_data.sql -- Sample tables and demo data
├── test_queries.sql -- Example queries to test the package
├── run_all.sql -- Optional script to run everything
└── README.md -- Project documentation


---

## How to Run (Local Test)

### 1. Load sample data
Run in SQL*Plus, SQLcl, or SQL Developer:
```sql
@sample_data.sql
```
2. Compile the package
```sql
@contract_finance_api_spec.sql
@contract_finance_api_body.sql
```
3. Test the package
```sql
@test_queries.sql
```
Or run individual examples:
```sql
SELECT contract_finance_api.get_contract_context('001','A1','ACC123',1) FROM dual;
SELECT contract_finance_api.calculate_total('002','A2','ACC456',2) FROM dual;
```
## Disclaimer

⚠️ Important Notice

    This project is for demonstration and portfolio purposes only

    All table names, column names, and business rules have been anonymized and modified

    Sample data is fully synthetic

    This repository does NOT represent any real banking or financial system

    No confidential, proprietary, or production logic is disclosed

## Author

Abbas Arfania
Senior Data Engineer / Oracle Developer

GitHub: https://github.com/abbasarfania-hub

LinkedIn: https://www.linkedin.com/in/abbas-arfania-84ba97b6


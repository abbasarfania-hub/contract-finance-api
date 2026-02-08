# Contract Finance API

This repository contains a **PL/SQL package** for calculating and managing various contract finance metrics such as:

* Total payments (`total_amount`)
* Penalties (`penalty`)
* Income (`income`)
* Execution status (`execution`)
* Adjustments for historical data

This project can be used as a **demo for Oracle PL/SQL development** or as a **portfolio example**.

## Features

* Modular functions to calculate contract-related amounts
* Handles historical data adjustments and corrections
* Supports sample data for testing
* Easy to integrate into existing Oracle databases

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/abbasarfania-hub/contract-finance-api.git
cd contract-finance-api
```

### 2. Load sample data into your Oracle database

```sql
@sample_data.sql
```

### 3. Compile the package

```sql
@contract_finance_api_spec.sql
@contract_finance_api_body.sql
```

### 4. Test the package functions

```sql
-- Example usage:
SELECT contract_finance_api.get_contract_context('001', 'A1', 'ACC123', 1) FROM dual;
SELECT contract_finance_api.calculate_total('002', 'A2', 'ACC456', 2) FROM dual;
```

### 5. Optional: Run all commands at once

```sql
@run_all.sql
```

## Folder Structure

```
.
├── contract_finance_api_spec.sql   -- Package specification
├── contract_finance_api_body.sql   -- Package body
├── sample_data.sql                 -- Sample data for testing
├── test_queries.sql                -- Queries to test package functionality
├── run_all.sql                     -- Optional script to run all commands
└── README.md                       -- Project documentation
```

## Notes

* This package is intended for **educational/demo purposes**.
* Do **not use in production** without proper security and compliance review.
* All sample data and queries are provided to illustrate usage.

## Author

Abbas Arfania
GitHub: [abbasarfania-hub](https://github.com/abbasarfania-hub)


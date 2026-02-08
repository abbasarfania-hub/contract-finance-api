-- ===========================================================================
-- run_all.sql
-- ===========================================================================
-- This script loads sample data, compiles the contract finance package,
-- and runs initial test queries.
-- ===========================================================================
-- 1. Load sample data
@sample_data.sql

-- 2. Compile package specification
@contract_finance_api_spec.sql

-- 3. Compile package body
@contract_finance_api_body.sql

-- 4. Run test queries
@test_queries.sql

-- ===========================================================================
-- End of run_all.sql
-- ===========================================================================

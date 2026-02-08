-- Test get_contract_context
SELECT contract_finance_api.get_contract_context('001', 'A1', 'ACC123', 1) AS contract_context
FROM dual;

-- Test calculate_total
SELECT contract_finance_api.calculate_total('002', 'A2', 'ACC456', 2) AS total_amount
FROM dual;

-- Test calculate_income_and_penalty
SELECT contract_finance_api.calculate_income_and_penalty('001', 'A1', 'ACC123', 1) AS income_penalty
FROM dual;

-- Test calculate_insurance_fee
SELECT contract_finance_api.calculate_insurance_fee('002', 'A2', 'ACC456', 2) AS insurance_fee
FROM dual;

-- Test calculate_commission
SELECT contract_finance_api.calculate_commission('001', 'A1', 'ACC123', 1) AS commission_amount
FROM dual;

-- Test discount_adjustment
SELECT contract_finance_api.discount_adjustment('002', 'A2', 'ACC456', 2) AS discount_adj
FROM dual;

-- Test final_balance
SELECT contract_finance_api.final_balance('001', 'A1', 'ACC123', 1) AS final_balance
FROM dual;

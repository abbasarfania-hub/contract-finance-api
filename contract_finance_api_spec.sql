CREATE OR REPLACE PACKAGE contract_finance_api IS

  --------------------------------------------------------------------------
  --  Type Definitions
  --------------------------------------------------------------------------
  TYPE t_contract_ctx IS RECORD (
    branch_code      VARCHAR2(10),
    product_code     VARCHAR2(10),
    contract_no      VARCHAR2(20),

    principal_amt    NUMBER,
    interest_amt     NUMBER,
    penalty_amt      NUMBER,
    insurance_amt    NUMBER,

    paid_principal   NUMBER,
    paid_interest    NUMBER,
    paid_penalty     NUMBER,

    start_date       NUMBER,
    process_date     NUMBER,
    delay_days       NUMBER
  );

  --------------------------------------------------------------------------
  --  Public API
  --------------------------------------------------------------------------
  -- 1️⃣ Context
  FUNCTION get_contract_context(
    p_branch_code  IN VARCHAR2,
    p_product_code IN VARCHAR2,
    p_contract_no  IN VARCHAR2
  ) RETURN t_contract_ctx;

  -- 2️⃣ Core Calculations
  FUNCTION calc_principal(ctx IN t_contract_ctx) RETURN NUMBER;
  FUNCTION calc_interest(ctx  IN t_contract_ctx) RETURN NUMBER;
  FUNCTION calc_penalty(ctx   IN t_contract_ctx) RETURN NUMBER;
  FUNCTION calc_insurance(ctx IN t_contract_ctx) RETURN NUMBER;

  -- 3️⃣ Settlement
  FUNCTION calc_settlement(ctx IN t_contract_ctx) RETURN NUMBER;

END contract_finance_api;

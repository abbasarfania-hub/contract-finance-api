CREATE OR REPLACE PACKAGE BODY contract_finance_api IS

  --------------------------------------------------------------------------
  -- Internal helper: safe NVL for numbers
  --------------------------------------------------------------------------
  FUNCTION nvl0(p_val NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN NVL(p_val, 0);
  END;

  --------------------------------------------------------------------------
  -- 1) Build Contract Context
  --------------------------------------------------------------------------
  FUNCTION get_contract_context(
    p_branch_code  IN VARCHAR2,
    p_product_code IN VARCHAR2,
    p_contract_no  IN VARCHAR2
  ) RETURN t_contract_ctx IS

    l_ctx t_contract_ctx;

  BEGIN
/*
NOTE:
This SELECT is intentionally generic.
You can create the mock_contracts table on GitHub
*/

    SELECT
      branch_code,
      product_code,
      contract_no,

      principal_amt,
      interest_amt,
      penalty_amt,
      insurance_amt,

      paid_principal,
      paid_interest,
      paid_penalty,

      start_date,
      process_date,
      delay_days
    INTO
      l_ctx.branch_code,
      l_ctx.product_code,
      l_ctx.contract_no,

      l_ctx.principal_amt,
      l_ctx.interest_amt,
      l_ctx.penalty_amt,
      l_ctx.insurance_amt,

      l_ctx.paid_principal,
      l_ctx.paid_interest,
      l_ctx.paid_penalty,

      l_ctx.start_date,
      l_ctx.process_date,
      l_ctx.delay_days
    FROM mock_contracts
    WHERE branch_code  = p_branch_code
      AND product_code = p_product_code
      AND contract_no  = p_contract_no;

    RETURN l_ctx;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(
        -20001,
        'Contract not found: ' || p_contract_no
      );
  END;

  --------------------------------------------------------------------------
  -- 2) Principal Calculation
  --------------------------------------------------------------------------
  FUNCTION calc_principal(ctx IN t_contract_ctx) RETURN NUMBER IS
  BEGIN
    RETURN
      GREATEST(
        nvl0(ctx.principal_amt) - nvl0(ctx.paid_principal),
        0
      );
  END;

  --------------------------------------------------------------------------
  -- 3) Interest Calculation
  --------------------------------------------------------------------------
  FUNCTION calc_interest(ctx IN t_contract_ctx) RETURN NUMBER IS
    l_daily_rate NUMBER := 0.0005; -- 0.05% daily (sample)
  BEGIN
    RETURN
      GREATEST(
        nvl0(ctx.interest_amt)
        - nvl0(ctx.paid_interest)
        + (calc_principal(ctx) * l_daily_rate * nvl0(ctx.delay_days)),
        0
      );
  END;

  --------------------------------------------------------------------------
  -- 4) Penalty Calculation
  --------------------------------------------------------------------------
  FUNCTION calc_penalty(ctx IN t_contract_ctx) RETURN NUMBER IS
    l_penalty_rate NUMBER := 0.001; -- 0.1% daily
  BEGIN
    IF ctx.delay_days <= 0 THEN
      RETURN 0;
    END IF;

    RETURN
      GREATEST(
        nvl0(ctx.penalty_amt)
        - nvl0(ctx.paid_penalty)
        + (calc_principal(ctx) * l_penalty_rate * ctx.delay_days),
        0
      );
  END;

  --------------------------------------------------------------------------
  -- 5) Insurance Calculation
  --------------------------------------------------------------------------
  FUNCTION calc_insurance(ctx IN t_contract_ctx) RETURN NUMBER IS
    l_yearly_rate NUMBER := 0.012; -- 1.2% yearly
  BEGIN
    RETURN
      ROUND(
        nvl0(ctx.principal_amt) * l_yearly_rate / 12,
        2
      );
  END;

  --------------------------------------------------------------------------
  -- 6) Final Settlement
  --------------------------------------------------------------------------
  FUNCTION calc_settlement(ctx IN t_contract_ctx) RETURN NUMBER IS
  BEGIN
    RETURN
        calc_principal(ctx)
      + calc_interest(ctx)
      + calc_penalty(ctx)
      + calc_insurance(ctx);
  END;

END contract_finance_api;


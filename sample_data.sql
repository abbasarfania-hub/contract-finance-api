-- Sample data for testing Contract Finance API package
-- Creates a few branches, accounts, and contracts

-- Drop tables if they exist
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE contract_data';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE contract_data (
    brn_no VARCHAR2(10),
    accnt_kd VARCHAR2(10),
    accnt_no VARCHAR2(20),
    cntrct_seq NUMBER,
    total_amount NUMBER,
    penalty NUMBER,
    income NUMBER,
    execution NUMBER
);

-- Insert sample records
INSERT INTO contract_data (brn_no, accnt_kd, accnt_no, cntrct_seq, total_amount, penalty, income, execution)
VALUES ('001', 'A1', 'ACC123', 1, 10000, 50, 500, 1000);

INSERT INTO contract_data (brn_no, accnt_kd, accnt_no, cntrct_seq, total_amount, penalty, income, execution)
VALUES ('002', 'A2', 'ACC456', 2, 20000, 100, 1000, 2000);

INSERT INTO contract_data (brn_no, accnt_kd, accnt_no, cntrct_seq, total_amount, penalty, income, execution)
VALUES ('003', 'B1', 'ACC789', 1, 15000, 75, 750, 1500);

COMMIT;
/

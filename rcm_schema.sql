
-- Create patients table
CREATE TABLE patients (
    patient_id VARCHAR PRIMARY KEY,
    name TEXT,
    dob DATE,
    gender CHAR(1)
);

-- Create providers table
CREATE TABLE providers (
    provider_id VARCHAR PRIMARY KEY,
    name TEXT,
    region TEXT
);

-- Create procedures table
CREATE TABLE procedures (
    procedure_code VARCHAR PRIMARY KEY,
    description TEXT,
    cost INTEGER
);

-- Create claims table
CREATE TABLE claims (
    claim_id VARCHAR PRIMARY KEY,
    patient_id VARCHAR,
    procedure_code VARCHAR,
    provider_id VARCHAR,
    claim_date DATE,
    amount INTEGER,
    status TEXT,
    reimbursement_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (procedure_code) REFERENCES procedures(procedure_code),
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);

-- Create denials table
CREATE TABLE denials (
    denial_id VARCHAR PRIMARY KEY,
    claim_id VARCHAR,
    reason_code TEXT,
    denial_date DATE,
    appeal_status TEXT,
    FOREIGN KEY (claim_id) REFERENCES claims(claim_id)
);

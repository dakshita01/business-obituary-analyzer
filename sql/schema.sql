-- Table 1: companies ... it holds all the details of the companies
-- one row per company, basic information

CREATE TABLE companies(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    industry VARCHAR(50),
    founded_year INT,
    failure_year INT,
    failure_type VARCHAR(50),
    peak_employees INT,
    peak_valuation_usd BIGINT,
    country VARCHAR(50) DEFAULT 'USA'
);


-- Table 2: financials ... holds the financial records of the company
-- one row per company, per quarter

CREATE TABLE financials(
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES companies(id),
    year INT NOT NULL,
    quarter INT NOT NULL,
    revenue_usd BIGINT,
    net_loss_usd BIGINT,
    total_debt_usd BIGINT,
    cash_reserves_usd BIGINT,
    operating_expenses_usd BIGINT
);


-- Table 3: leadership_chages ... used for extracting the cause of failure
-- one row per executive event

CREATE TABLE leadership_chages(
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES companies(id),
    event_date DATE,
    role VARCHAR(50), -- 'CEO', 'CFO', 'COO', 'CTO'
    event_type VARCHAR(30), -- departure or appointment
    reason VARCHAR(100) -- resigned, fired, retired
);


-- Table 4: risk_scores
-- stores computed scores. the output you will get.

CREATE TABLE risk_scores(
    id SERIAL PRIMARY KEY,
    company_id INT REFERENCES companies(id),
    computed_at TIMESTAMP DEFAULT NOW(),
    overall_score FLOAT,
    revenue_score FLOAT,
    burn_score FLOAT,
    debt_score FLOAT,
    leadership_score FLOAT,
    revdebt_score FLOAT
);


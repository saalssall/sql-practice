DROP TABLE IF EXISTS BankTransaction, Account, Branch, Employee, Customer CASCADE;

CREATE TABLE Customer (
    customer_id   VARCHAR(50) NOT NULL,
    first_name    CHAR(15)    NOT NULL,
    last_name     CHAR(15)    NOT NULL,
    date_of_birth DATE        NOT NULL,
    gender        VARCHAR(1),
    phone_number  VARCHAR(50) UNIQUE,
    email         VARCHAR(50) UNIQUE,
CONSTRAINT Customer_PK PRIMARY KEY (customer_id),
CONSTRAINT Customer_gender_CK CHECK (gender IN ('M', 'F', 'O'))
);

CREATE TABLE Employee (
    employee_id         VARCHAR(50) NOT NULL,
    first_name          CHAR(15)    NOT NULL,
    last_name           CHAR(15)    NOT NULL,
    job_title           VARCHAR(20) NOT NULL,
    email               VARCHAR(50) UNIQUE,
    years_of_experience INT,
CONSTRAINT Employee_PK PRIMARY KEY (employee_id),
CONSTRAINT Employee_experience_CK CHECK (years_of_experience > 0)
);

CREATE TABLE Branch (
    branch_id   INT           NOT NULL,
    branch_type VARCHAR(10),
    is_open     CHAR(1),
    daily_limit DECIMAL(10,2) NOT NULL DEFAULT 1000.00,
CONSTRAINT Branch_PK PRIMARY KEY (branch_id),
CONSTRAINT Branch_type_CK CHECK (branch_type IN ('Main', 'Suburb', 'Online')),
CONSTRAINT Branch_open_CK CHECK (is_open IN ('Y', 'N')),
CONSTRAINT Branch_limit_CK CHECK (daily_limit > 0)
);

CREATE TABLE Account (
    account_id   INT           NOT NULL,
    customer_id  VARCHAR(50),
    employee_id  VARCHAR(50),
    branch_id    INT,
    open_date    DATE          NOT NULL,
    account_type VARCHAR(10)   NOT NULL,
    balance      DECIMAL(12,2) NOT NULL,
CONSTRAINT Account_PK PRIMARY KEY (account_id),
CONSTRAINT Customer_FK FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
CONSTRAINT Employee_FK FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
CONSTRAINT Branch_FK   FOREIGN KEY (branch_id)   REFERENCES Branch(branch_id),
CONSTRAINT Account_type_CK    CHECK (account_type IN ('Savings', 'Cheque', 'Term')),
CONSTRAINT Account_balance_CK CHECK (balance >= 0)
);

CREATE TABLE BankTransaction (
    txn_id     INT           NOT NULL,
    account_id INT           NOT NULL,
    txn_type   VARCHAR(10)   NOT NULL,
    amount     DECIMAL(12,2) NOT NULL,
    txn_date   DATE          NOT NULL,
CONSTRAINT BankTransaction_PK PRIMARY KEY (txn_id),
CONSTRAINT Account_FK  FOREIGN KEY (account_id) REFERENCES Account(account_id),
CONSTRAINT Txn_type_CK   CHECK (txn_type IN ('Deposit', 'Withdrawal')),
CONSTRAINT Txn_amount_CK CHECK (amount > 0)
);

INSERT INTO Customer VALUES
    ('C1', 'Ava',   'Smith', '1990-04-12', 'F', '0400000001', 'ava@mail.com'),
    ('C2', 'Ben',   'Jones', '1985-09-30', 'M', '0400000002', 'ben@mail.com'),
    ('C3', 'Chloe', 'Brown', '2001-01-22', 'F', '0400000003', 'chloe@mail.com');

INSERT INTO Employee VALUES
    ('E1', 'Sam', 'Lee',   'Manager', 'sam@bank.com', 10),
    ('E2', 'Mia', 'Patel', 'Teller',  'mia@bank.com',  5);

INSERT INTO Branch VALUES
    (101, 'Main',   'Y', 5000.00),
    (102, 'Suburb', 'Y', 2000.00),
    (103, 'Online', 'N', 1000.00);

INSERT INTO Account VALUES
    (1, 'C1', 'E1', 101, '2026-01-10', 'Savings',  2500.00),
    (2, 'C2', 'E2', 102, '2026-03-05', 'Cheque',    800.00),
    (3, 'C1', 'E2', 103, '2026-06-20', 'Term',    10000.00);

INSERT INTO BankTransaction VALUES
    (1, 1, 'Deposit',    1000.00, '2026-10-01'),
    (2, 2, 'Withdrawal',  200.00, '2026-10-03'),
    (3, 2, 'Deposit',     500.00, '2026-10-10');
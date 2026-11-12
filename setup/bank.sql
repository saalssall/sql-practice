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
    ('C1',  'Ava',   'Smith',    '1990-04-12', 'F',  '0400000001', 'ava@mail.com'),
    ('C2',  'Ben',   'Jones',    '1985-09-30', 'M',  '0400000002', 'ben@mail.com'),
    ('C3',  'Chloe', 'Brown',    '2001-01-22', 'F',  '0400000003', 'chloe@mail.com'),
    ('C4',  'Dan',   'Wilson',   '1978-11-05', 'M',  '0400000004', 'dan@mail.com'),
    ('C5',  'Eva',   'Martinez', '1995-07-19', 'F',  '0400000005', 'eva@mail.com'),
    ('C6',  'Finn',  'Taylor',   '1988-02-14', 'M',  '0400000006', 'finn@mail.com'),
    ('C7',  'Grace', 'Nguyen',   '1999-12-01', 'F',  '0400000007', 'grace@mail.com'),
    ('C8',  'Henry', 'Clark',    '1972-06-25', 'M',  '0400000008', 'henry@mail.com'),
    ('C9',  'Isla',  'Walker',   '2004-03-08', NULL, NULL,         'isla@mail.com'),
    ('C10', 'Jack',  'Evans',    '1993-10-17', 'O',  '0400000010', 'jack@mail.com');

INSERT INTO Employee VALUES
    ('E1', 'Sam',    'Lee',   'Manager', 'sam@bank.com',    10),
    ('E2', 'Mia',    'Patel', 'Teller',  'mia@bank.com',     5),
    ('E3', 'Noah',   'King',  'Teller',  'noah@bank.com',    2),
    ('E4', 'Olivia', 'Reed',  'Advisor', 'olivia@bank.com',  8),
    ('E5', 'Liam',   'Ford',  'Manager', 'liam@bank.com',   15);

INSERT INTO Branch VALUES
    (101, 'Main',   'Y', 5000.00),
    (102, 'Suburb', 'Y', 2000.00),
    (103, 'Online', 'N', 1000.00),
    (104, 'Suburb', 'Y', 2500.00),
    (105, 'Main',   'Y', 8000.00);

INSERT INTO Account VALUES
    (1,  'C1', 'E1', 101, '2026-01-10', 'Savings',  2500.00),
    (2,  'C2', 'E2', 102, '2026-03-05', 'Cheque',    800.00),
    (3,  'C1', 'E2', 103, '2026-06-20', 'Term',    10000.00),
    (4,  'C2', 'E1', 101, '2026-07-15', 'Savings',  1500.00),
    (5,  'C3', 'E3', 102, '2026-02-18', 'Savings',   320.50),
    (6,  'C4', 'E4', 104, '2025-11-30', 'Cheque',   4200.75),
    (7,  'C4', 'E5', 105, '2025-08-12', 'Term',    25000.00),
    (8,  'C5', 'E3', 104, '2026-04-09', 'Savings',  1875.00),
    (9,  'C6', 'E2', 101, '2026-05-27', 'Cheque',    150.00),
    (10, 'C7', 'E4', 103, '2026-08-03', 'Savings',     0.00),
    (11, 'C8', 'E5', 105, '2024-12-01', 'Term',    50000.00),
    (12, 'C8', 'E1', 101, '2025-03-14', 'Savings',  7300.25),
    (13, 'C9', 'E3', 102, '2026-09-21', 'Savings',    95.00),
    (14, 'C5', 'E4', 104, '2026-10-02', 'Cheque',   2200.00),
    (15, 'C7', 'E2', 103, '2026-10-15', 'Term',    12000.00),
    (16, 'C1', 'E1', 101, '2026-01-10', 'Savings',  2500.00),  
    (17, 'C1', 'E1', 101, '2026-01-10', 'Savings',  2500.00),  
    (18, 'C4', 'E4', 104, '2025-11-30', 'Cheque',   4200.75),  
    (19, 'C8', 'E5', 105, '2024-12-01', 'Term',    50000.00),  
    (20, 'C3', 'E3', 102, '2026-02-18', 'Savings',   320.50),  
    (21, 'C2', 'E2', 102, '2026-03-05', 'Cheque',    800.00),  
    (22, 'C1', 'E1', 101, '2026-05-01', 'Savings',   900.00);  

INSERT INTO BankTransaction VALUES
    (1,  1,  'Deposit',    1000.00, '2026-10-01'),
    (2,  2,  'Withdrawal',  200.00, '2026-10-03'),
    (3,  2,  'Deposit',     500.00, '2026-10-10'),
    (4,  1,  'Withdrawal',  250.00, '2026-10-12'),
    (5,  3,  'Deposit',    2000.00, '2026-07-01'),
    (6,  4,  'Deposit',     300.00, '2026-08-02'),
    (7,  4,  'Withdrawal',   75.50, '2026-08-20'),
    (8,  5,  'Deposit',     120.00, '2026-03-01'),
    (9,  5,  'Withdrawal',   40.00, '2026-03-15'),
    (10, 6,  'Deposit',    1500.00, '2026-01-05'),
    (11, 6,  'Withdrawal',  600.00, '2026-01-20'),
    (12, 6,  'Withdrawal',  220.25, '2026-02-11'),
    (13, 7,  'Deposit',    5000.00, '2025-09-01'),
    (14, 8,  'Deposit',     875.00, '2026-05-01'),
    (15, 8,  'Withdrawal',  100.00, '2026-06-12'),
    (16, 9,  'Deposit',     150.00, '2026-06-01'),
    (17, 9,  'Withdrawal',   90.00, '2026-06-18'),
    (18, 12, 'Deposit',    2300.00, '2025-04-01'),
    (19, 12, 'Withdrawal', 1200.00, '2025-12-24'),
    (20, 12, 'Deposit',     450.75, '2026-02-28'),
    (21, 13, 'Deposit',      95.00, '2026-09-22'),
    (22, 14, 'Deposit',    2500.00, '2026-10-03'),
    (23, 14, 'Withdrawal',  300.00, '2026-10-20'),
    (24, 1,  'Deposit',     640.00, '2026-11-02'),
    (25, 2,  'Withdrawal',  150.00, '2026-11-05'),
    (26, 6,  'Deposit',     980.00, '2026-11-08'),
    (27, 8,  'Withdrawal',  225.00, '2026-11-09'),
    (28, 12, 'Withdrawal',  800.00, '2026-11-10'),
    (29, 4,  'Deposit',    1100.00, '2026-11-11'),
    (30, 5,  'Deposit',      60.00, '2026-11-12');
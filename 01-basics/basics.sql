-- Retrieve all records from the Customer table
SELECT * FROM Customer;

-- Retrieve unique values from the gender column in the Customer table
SELECT DISTINCT gender FROM Customer;

-- Using AS as an alias for the column name
SELECT email AS CustomerEmail FROM Customer;

-- Using LIMIT to restrict the number of records returned
SELECT * FROM Customer LIMIT 2;

-- Using ORDER BY to sort the records by last_name in ascending order
SELECT * FROM Customer ORDER BY last_name ASC;

-- Using WHERE clause to filter records based on a condition
SELECT * FROM Customer WHERE gender = 'M';

-- Using SUM to calculate the total balance of all accounts
SELECT SUM(balance) AS TotalBalance FROM Account;

-- Using AVG to calculate the average balance of all accounts
SELECT AVG(balance) AS AverageBalance FROM Account;

-- Using MIN to find the minimum balance in the orders table
SELECT MIN(balance) AS MinimumBalance FROM Account;

-- Using MAX to find the maximum balance in the orders table
SELECT MAX(balance) AS MaximumBalance FROM Account;

-- Using COUNT to count the number of records in the Account table
SELECT COUNT(account_id) AS TotalAccounts FROM Account;

-- Using COUNT with DISTINCT to count unique branch_id values in the Account table
SELECT COUNT(DISTINCT branch_id) AS branch_count
FROM Account;

-- Using multiple aggregate functions in a single query
SELECT COUNT(customer_id)         AS customer_count,
       COUNT(DISTINCT branch_id) AS branch_count,
       SUM(balance)             AS total_balance,
       AVG(balance)             AS avg_balance,
       MIN(balance)             AS min_balance,
       MAX(balance)             AS max_balance
FROM Account;

-- Using aggregation to get insights about customers, accounts, and branches
SELECT COUNT(customer_id) AS Total_Customers,
        COUNT(DISTINCT account_id) AS Unique_Accounts,
        COUNT(DISTINCT branch_id) AS Unique_Branches,
        SUM(balance) AS Total_Balance,
        AVG(balance) AS Average_Balance
FROM Account;

-- Using DISTINCT to retrieve unique job titles from the Employee table
SELECT DISTINCT job_title FROM Employee;

-- Using GROUP BY to group records by account_type and calculate aggregate values
SELECT account_type,
       SUM(balance)      AS revenue,
       AVG(balance)      AS avg_balance,
       COUNT(customer_id) AS customer_count
FROM Account
GROUP BY account_type -- Group by account type
ORDER BY customer_count DESC, revenue DESC; -- Order by customer count and revenue in descending order

SELECT DISTINCT account_type, branch_id FROM Account;

-- Using GROUP BY with multiple columns to group records by branch_id and account_type
SELECT account_type,
       branch_id,
       SUM(balance) AS total_balance,
       COUNT(account_id) AS account_count
FROM Account
GROUP BY account_type, branch_id -- Group by branch_id and account_type
ORDER BY branch_id;


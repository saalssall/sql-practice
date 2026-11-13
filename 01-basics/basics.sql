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




-- 1. Data Aggregation 

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

-- 2. Data Transformation

-- Using arithmetic operations to calculate shipping duration and cost in the orders table
SELECT *,
        ship_date - order_date AS shipping_duration,
        sales - profit AS cost
FROM orders;

-- Using NULLIF to avoid division by zero when calculating gross sales in the orders table
SELECT *,
    sales / NULLIF(discount, 0) AS gross_sales
FROM orders;
        







-- 3. Data Filtering
-- 4. Conditional Operations


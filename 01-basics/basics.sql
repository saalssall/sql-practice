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
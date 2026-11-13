# SQL (Structured Query Language)
A widely used language for querying, analyzing, and manipulating data in relational databases.

## SQL Flavors
MySQL, PostgreSQL, SQLite, SQL Server, BigQuery

## Conventions
1. Use capital letters for commands
2. Use lower case for column and table names
3. Alias each aggregate expression with AS for clarity

## Rules
1. Clauses must be written in this order:
   SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> LIMIT
2. Every column in SELECT must be in GROUP BY or inside an aggregate function
3. Every selected column that isn’t inside an aggregate function must be included in GROUP BY
4. Small groups call for cautious conclusions, not immediate decisions
5. The first sort column sets the overall order. The second only sorts rows that tie on the first column. If there are no ties, the second sort has no visible effect
6. Multi-column aggregation enables cross-dimensional analysis, answering questions like "How does X vary across combinations of A and B?"
7. Use NULLIF to handle division by zero gracefully
8. Use SAFE_DIVIDE in BigQuery to handle division by zero gracefully

## Design Framework
Answer three questions for effective grouped aggregation:
1. By which column do we group?
2. Which columns do we summarize?
3. Which summary operations do we apply?

### Split-Apply-Combine
Grouped aggregation works through a three-step process:
Split: Data is divided into groups based on unique values in the grouping column.
Apply: Summary operations are performed on each group separately.
Combine: Results from each group are assembled into a single summary table.

### Data Transformation:
Deriving new columns and rules based on exisiting columns and variables




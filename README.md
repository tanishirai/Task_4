# SQL Data Analysis Project - PizzaHut Database

## Project Overview

This project involves analyzing sales and product data from the PizzaHut database. The goal is to extract insights and summarize sales using SQL queries focusing on joins, subqueries, aggregation, views, and indexes.

---

## Project Contents

- **SQL Queries:** All SQL queries used for data exploration, analysis, and optimization are saved in `pizzahut_analysis.sql`.
- **Dataset:** The PizzaHut database includes the following tables:
  - `orders`
  - `order_details`
  - `pizzas`
  - `pizza_types`
- **Screenshots:** Query outputs and execution plans are provided in the `SQL Output Screenshots` file.
- **Documentation:** This `README.md` file explains the project steps.

---

## Steps Performed

### 1. Schema Exploration
- Used `DESCRIBE` commands to understand table structures and data types.

### 2. Basic Data Queries
- Retrieved all pizzas, orders, and order details with filters using `SELECT` and `WHERE`.

### 3. Aggregation and Grouping
- Calculated total pizzas sold per type.
- Summarized total and average sales using `SUM()` and `AVG()`.

### 4. Joins
- Combined data from multiple tables with `INNER JOIN` and `LEFT JOIN` to get detailed reports on orders and products.

### 5. Subqueries
- Used subqueries to find pizzas with sales above average or to filter orders with specific conditions.

### 6. Views
- Created reusable views like `monthly_pizza_sales` for summarizing data by month.

### 7. Index Optimization
- Added indexes on frequently searched columns to improve query performance.

---

## How to Run

1. Import the PizzaHut database schema into your MySQL server.
2. Execute the queries in the `pizzahut_analysis.sql` file using MySQL Workbench or any SQL client.
3. View the results, screenshots are provided for reference.

---

## Tools Used

- MySQL Server 8.x
- MySQL Workbench
- CSV files used for initial data import (if applicable)

---

## Notes

- Ensure the databases and tables are created before running imports.
- Verify data types match the dataset to avoid truncation issues.
- Use the Index Optimization script to speed up complex queries.
- Views have been created for common analysis patterns to simplify repeated tasks.

---


Thank you for reviewing this SQL Data Analysis project on the PizzaHut database.

# Shopify Trending Products Analysis 2026

## Project Overview
This project analyzes trending Shopify products using SQL. 
The goal is to identify:

* Top-performing product categories
* High-revenue products
* Trending products with growth potential
* Best-performing price ranges
* Trend source effectiveness
* Revenue contribution by category

## Tools Used
- PostgreSQL
- SQL
- GitHub

## Dataset
The dataset contains product level trend information including:

- Product ID
- Product Name
- Category
- Subcategory
- Estimated Total Units Sold
- Estimated Revenue
- Trend Score
- Price Range
- Trend Source
- Notes

## This project demonstrates SQL skills including:
* Filtering
*	Aggregations
*	GROUP BY
*	HAVING
*	CASE statements
*	Window functions
*	Subqueries
*	CTEs

## SQL Concepts Used
* Basic SQL
* SELECT
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* LIMIT
### Intermediate SQL
* CASE WHEN
* Subqueries
* Common Table Expressions (CTEs)
* Aggregate Functions
### Advanced SQL
* Window Functions
* RANK()
* ROW_NUMBER()
* SUM() OVER()
* AVG() OVER()
* STDDEV()
* CORR()
* Z-Score Analysis
* Pareto Analysis

## Business Questions
## The project answers the following business questions:
1.	Which products generate the highest revenue?
2.	Which categories contribute the most to total revenue?
3.	Which price ranges perform best?
4.	Which products have high trend scores but low revenue?
5.	Which trend sources are most effective?
6.	Which products generate the highest revenue per unit sold?
7.	Is there a relationship between trend score and revenue?
8.	Which products are above average performers?

## Analysis Performed
1. Top trending products by trend score
2. Highest revenue generating products
3. Category revenue analysis
4. Price range popularity
5. Revenue contribution by category

## Key Insights
- Eco Friendly category generated the highest revenue
- Products priced between $3.0-$4 sold the most units which comes under food and beverage category
- Top 10 products contribute a significant portion of total revenue

## Project Structure
dataset/
shopify_products.csv
sql_queries/
- 01_product_trends.sql
- 02_category_analysis.sql
- 03_price_analysis.sql
- advance_queries.sql

results/
query_output.png




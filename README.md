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

## This project demonstrates SQL skills including:
•	Filtering
•	Aggregations
•	GROUP BY
•	HAVING
•	CASE statements
•	Window functions
•	Subqueries
•	CTEs

## Analysis Performed
1. Top trending products by trend score
2. Highest revenue generating products
3. Category revenue analysis
4. Price range popularity
5. Revenue contribution by category

## Key Insights
- Fitness category generated the highest revenue
- Products priced between $3.0-$4 sold the most units
- Top 10 products contribute a significant portion of total revenue

## Project Structure
dataset/
shopify_products.csv

sql_queries/
- 01_product_trends.sql
- 02_category_analysis.sql
- 03_price_analysis.sql

results/
query_output.png

Business Questions
- Which products have the highest trend score?
- Which categories generate the most revenue?
- Which price range sells the most units?

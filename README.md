# Shopify Trending Products Analysis 2026

## Project Overview
This project analyzes trending Shopify products using SQL. 
The goal is to identify high performing products, revenue generating categories, 
and price ranges with the highest demand.

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

## Analysis Performed
1. Top trending products by trend score
2. Highest revenue generating products
3. Category revenue analysis
4. Price range popularity
5. Revenue contribution by category

## Key Insights
- Electronics category generated the highest revenue
- Products priced between $50–$100 sold the most units
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

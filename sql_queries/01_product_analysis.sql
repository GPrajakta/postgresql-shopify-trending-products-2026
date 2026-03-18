--Top 10 Trending Products---

SELECT product_name,category,trend_score
FROM shopify_products
ORDER BY trend_score DESC
LIMIT 10;

--Top 10 Products by Revenue--

SELECT product_name,
estimated_revenue_in_2025_usd
FROM shopify_products
ORDER BY estimated_revenue_in_2025_usd DESC
LIMIT 10;

--Products with High Trend but Low Revenue--

SELECT product_name,
trend_score,
estimated_revenue_in_2025_usd
FROM shopify_products
WHERE trend_score > 8
AND estimated_revenue_in_2025_usd < 50000;

-- TOP products in each category---
SELECT category,
product_name,
estimated_revenue_in_2025_usd,
RANK() OVER (PARTITION BY category ORDER BY estimated_revenue_in_2025_usd DESC) AS rank_in_category
FROM shopify_products;

-- Top 3 Products per Category--

SELECT * FROM 
(
  SELECT category,product_name,Estimated_Revenue_in_2025_USD,
  RANK() OVER (PARTITION BY category ORDER BY estimated_revenue_in_2025_usd DESC) AS rank_in
  FROM shopify_trending_products_2026
  )t
WHERE rank_in <=3;

--- Rank all products by unit price from most to least expensive ---

SELECT product_name,category,price_range_usd,
RANK() OVER (order by price_range_usd desc) AS price_rank
FROM shopify_trending_products_2026;

---  Find the top 2 most expensive products in each category --
select * from 
(
	select product_name,category,price_range_usd,
	row_number() OVER (partition by category order by price_range_usd DESC) AS product_rank
	FROM shopify_trending_products_2026
) t
where product_rank <= 2;

--- Identify Premium Products ----
SELECT product_name, 
Estimated_Revenue_in_2025_USD / Estimated_Total_Units_Sold_in_2025 AS price_per_unit
FROM shopify_trending_products_2026
order by price_per_unit desc;

--- Revenue Contribution by Product (Cumulative %) ---
/*---USING SUBQUERY-----*/
SELECT Product_Name,
revenue,
ROUND(
sum(revenue) OVER (order by revenue DESC) 
/ SUM(revenue) OVER() * 100 ,2) as cumulative_percentage
FROM
(
	SELECT product_name,
	SUM(estimated_revenue_in_2025_usd) AS revenue
	FROM shopify_trending_products_2026
	GROUP BY Product_Name
) AS t
order BY revenue desc;

/*---USING CTE ---*/
WITH revenue_data AS (
    SELECT 
        product_name,
        SUM(estimated_revenue_in_2025_usd) AS revenue
    FROM shopify_trending_products_2026
    GROUP BY product_name
),

calc AS (
    SELECT 
        product_name,
        revenue,
        SUM(revenue) OVER (ORDER BY revenue DESC) AS cumulative_sum,
        SUM(revenue) OVER () AS total_sum
    FROM revenue_data
)

SELECT 
    product_name,
    revenue,
    ROUND(cumulative_sum / total_sum * 100, 2) AS cumulative_percentage
FROM calc
ORDER BY revenue DESC;


-- Pareto Analysis (Top 80% Revenue Products) ---
WITH revenue_data AS(
	select product_name,
    sum(Estimated_Revenue_in_2025_USD) AS revenue
    FROM shopify_trending_products_2026
    group by Product_Name
),

cumulative AS (
	select product_name,
    revenue,
    SUM(revenue) OVER (order by revenue DESC) cumulative_revenue,
    sum(revenue) OVER () AS total_revenue
    FROM revenue_data
)
SELECT product_name,
revenue,
ROUND(cumulative_revenue / total_revenue * 100 ,2) AS cumulative_percent
FROM cumulative
WHERE cumulative_revenue / total_revenue <= 0.8;

--- Z-Score Analysis (Detect Outliers) ---

SELECT product_name,
Estimated_Revenue_in_2025_USD,
(
	ROUND((Estimated_Revenue_in_2025_USD - avg(Estimated_Revenue_in_2025_USD) OVER()) 
    / stddev(Estimated_Revenue_in_2025_USD) OVER() ,2)
) AS z_score
FROM shopify_trending_products_2026
order by z_score DESC;

/* Bucket Products by Performance */

SELECT product_name,
Estimated_Revenue_in_2025_USD,
CASE
	WHEN Estimated_Revenue_in_2025_USD > 100000 THEN 'High Performance'
    WHEN Estimated_Revenue_in_2025_USD > 50000 THEN 'Medium Performer'
    ELSE
    'Low Performer'
END AS performace_category
FROM shopify_trending_products_2026;

/* Category Leaders (Best Product in Each Category) */

SELECT category,
product_name, Estimated_Total_Units_Sold_in_2025,
rank() OVER(order by Estimated_Total_Units_Sold_in_2025 DESC) AS rn
from shopify_trending_products_2026;

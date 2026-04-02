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

--- Bucket Products by Performance ---

SELECT product_name,
Estimated_Revenue_in_2025_USD,
CASE
	WHEN Estimated_Revenue_in_2025_USD > 100000 THEN 'High Performance'
    WHEN Estimated_Revenue_in_2025_USD > 50000 THEN 'Medium Performer'
    ELSE
    'Low Performer'
END AS performace_category
FROM shopify_trending_products_2026;

--- Category Leaders (Best Product in Each Category) ---

SELECT category,
product_name, Estimated_Total_Units_Sold_in_2025,
rank() OVER(order by Estimated_Total_Units_Sold_in_2025 DESC) AS rn
from shopify_trending_products_2026;

--- Revenue Efficiency (Revenue per Unit) ----
SELECT product_name,
ROUND(estimated_revenue_in_2025_usd 
/ Estimated_Total_Units_Sold_in_2025,2) AS revenue_per_unit
FROM shopify_trending_products_2026
ORDER by revenue_per_unit DESC;

--- Trend Score Bucketing ----
SELECT product_name,trend_score,
CASE
	WHEN trend_score >= 90 THEN 'Highly Trending'
	WHEN trend_score >= 30 THEN 'Moderately Trending'
	WHEN trend_score >= 20 THEN 'Low Performer'
END AS trend_category
FROM shopify_trending_products_2026;

--- High Trend but Low Revenue ---

Select product_name,trend_score,estimated_revenue_in_2025_usd
FROM(
SELECT 
        product_name,
        trend_score,
        estimated_revenue_in_2025_usd,
        AVG(trend_score) OVER() AS avg_trend_score,
        AVG(estimated_revenue_in_2025_usd) OVER() AS avg_revenue
    	FROM shopify_trending_products_2026
) t
WHERE trend_score > avg_trend_score
AND estimated_revenue_in_2025_usd < avg_revenue;

---- Correlation Insight (Trend vs Units) ----

SELECT CORR(trend_score, estimated_total_units_sold_in_2025) AS correlation
FROM shopify_trending_products_2026;


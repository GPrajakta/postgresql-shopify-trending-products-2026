--- Category Revenue Analysis ---
SELECT category,
SUM(estimated_revenue_in_2025_usd) AS revenue
FROM shopify_products
GROUP BY category
ORDER BY revenue DESC;

-- Category Trend Score--
select category,round(AVG(trend_score),2) AS avg_trend_score
FROM shopify_trending_products_2026
group by Category
order by avg_trend_score DESC;

---- Category Contribution to Total Revenue---
 SELECT category,
 CONCAT(ROUND((revenue * 100.0) / SUM(revenue) OVER(), 2), '%') AS revenue_percent
 FROM
 (
   SELECT category,sum(Estimated_Revenue_in_2025_USD) AS revenue 
   from shopify_trending_products_2026
   GROUP BY Category
 ) at
 ORDER BY revenue DESC;

-- Top categories contributing up to 80%--
SELECT 
category,
revenue,
revenue_percent,
cumulative_percent
FROM
(
    SELECT 
    category,
    revenue,
    
    -- % contribution
    ROUND((revenue * 100.0) / SUM(revenue) OVER(), 2) AS revenue_percent,
    
    -- cumulative %
    ROUND(
        SUM(revenue) OVER (ORDER BY revenue DESC) * 100.0 
        / SUM(revenue) OVER(), 
    2) AS cumulative_percent

    FROM
    (
        SELECT 
        category,
        SUM(estimated_revenue_in_2025_usd) AS revenue
        FROM shopify_products
        GROUP BY category
    ) t
) final
WHERE cumulative_percent <= 80
ORDER BY revenue DESC;




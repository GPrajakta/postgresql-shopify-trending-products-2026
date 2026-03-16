---Category Revenue Analysis---
SELECT category,
SUM(estimated_revenue_in_2025_usd) AS revenue
FROM shopify_products
GROUP BY category
ORDER BY revenue DESC;

--Category Trend Score--
select category,round(AVG(trend_score),2) AS avg_trend_score
FROM shopify_trending_products_2026
group by Category
order by avg_trend_score DESC;

---Category Contribution to Total Revenue---

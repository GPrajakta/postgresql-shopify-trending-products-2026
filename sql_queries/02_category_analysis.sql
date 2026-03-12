SELECT category,
SUM(estimated_revenue_in_2025_usd) AS revenue
FROM shopify_products
GROUP BY category
ORDER BY revenue DESC;

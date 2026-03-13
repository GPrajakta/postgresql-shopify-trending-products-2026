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

--

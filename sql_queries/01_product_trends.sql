SELECT product_name,category,trend_score
FROM shopify_products
ORDER BY trend_score DESC
LIMIT 10;

SELECT price_range_usd,
SUM(estimated_total_units_sold_in_2025) AS units_sold
FROM shopify_products
GROUP BY price_range_usd
ORDER BY units_sold DESC;

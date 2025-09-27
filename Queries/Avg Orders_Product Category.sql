WITH product_cat AS (
  SELECT
    p.category,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.num_of_item) AS total_items
  FROM
    `cc-coursework-no00505.thelook.orders` o,
    `cc-coursework-no00505.thelook.order_items` oi,
    `cc-coursework-no00505.thelook.products` p
  WHERE
    o.order_id = oi.order_id
    AND oi.product_id = p.id
    AND o.status = 'Complete'
  GROUP BY
    p.category
)
SELECT
  category,
  total_orders,
  total_items,
  ROUND(total_items / total_orders, 2) AS avg_orders
FROM
  product_cat
ORDER BY
  avg_orders DESC;

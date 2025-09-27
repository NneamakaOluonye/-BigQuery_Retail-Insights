WITH gender_AO AS (
  SELECT
    gender,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(num_of_item) AS total_items
  FROM
    `cc-coursework-no00505.thelook.orders` o
  WHERE
    o.status = 'Complete'
  GROUP BY
    gender
)
SELECT
  gender,
  total_orders,
  total_items,
  ROUND(total_items / total_orders, 2) AS avg_orders
FROM 
  gender_AO
ORDER BY
  avg_orders DESC;

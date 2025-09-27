WITH hourly_AOV AS (
  SELECT
    EXTRACT(HOUR FROM o.created_at) AS order_hour,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(num_of_item) AS total_items
  FROM
    `cc-coursework-no00505.thelook.orders` o
    JOIN `cc-coursework-no00505.thelook.order_items` oi ON o.order_id = oi.order_id
  WHERE
    o.status = 'Complete'
  GROUP BY
    order_hour
)
SELECT
  order_hour,
  total_orders,
  total_items,
  ROUND(total_items / total_orders, 2) AS AOV
FROM
  hourly_AOV
ORDER BY
  order_hour;
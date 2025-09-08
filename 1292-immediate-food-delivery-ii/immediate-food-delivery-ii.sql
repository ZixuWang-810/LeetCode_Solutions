-- Write your PostgreSQL query statement below
SELECT
  ROUND(
    COUNT(*) * 100.0 / (
      SELECT COUNT(DISTINCT customer_id)
      FROM Delivery
    ), 2
  ) AS immediate_percentage
FROM Delivery a
JOIN Delivery b
  ON a.order_date = b.customer_pref_delivery_date
 AND a.customer_id = b.customer_id
WHERE a.order_date = (
  SELECT MIN(order_date)
  FROM Delivery c
  WHERE c.customer_id = a.customer_id
);
-- Write your PostgreSQL query statement below
WITH cte AS (
    SELECT
        product_id,
        new_price
    FROM Products
    WHERE (product_id, change_date) IN(
        SELECT 
            product_id,
            MAX(change_date)
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY 1
    )
)

SELECT
    p.product_id,
    (CASE WHEN c.new_price IS NULL THEN 10
    ELSE c.new_price END) AS price
FROM (select distinct product_id from products) p
LEFT JOIN cte c
ON p.product_id = c.product_id
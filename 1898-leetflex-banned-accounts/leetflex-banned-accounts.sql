-- Write your PostgreSQL query statement below
SELECT
    DISTINCT l1.account_id
FROM LogInfo l1
INNER JOIN LogInfo l2
    ON l1.account_id = l2.account_id
WHERE l1.ip_address != l2.ip_address
AND l1.login BETWEEN l2.login AND l2.logout


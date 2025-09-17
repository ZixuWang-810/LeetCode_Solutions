WITH    cte AS (
        SELECT            num,
            lag (num, 1) OVER () AS lag_1,
            lag (num, 2) OVER () AS lag_2
        FROM            Logs
    )
SELECT DISTINCT    (num) AS ConsecutiveNums
FROM    cte
WHERE    num = lag_1
    AND num = lag_2;
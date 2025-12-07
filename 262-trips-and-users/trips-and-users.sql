-- Write your PostgreSQL query statement below

    select
        request_at as Day,
        round(
            sum(case when status = 'cancelled_by_driver'
            or status = 'cancelled_by_client' then 1 else 0 end)::decimal
            / count(*)::decimal
            ,2
        ) as "Cancellation Rate"
    from trips 
    where request_at between '2013-10-01'
        and '2013-10-03'
    and client_id in (
        select users_id
        from users
        where role = 'client'
        and banned = 'No'
    )
    and driver_id in (
        select users_id
        from users
        where role = 'driver'
        and banned = 'No'
    )
    group by 1
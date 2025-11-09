-- Write your PostgreSQL query statement below
select
    round(
        count(distinct(requester_id, accepter_id))::decimal /
        (select 
            case 
                when count(distinct(sender_id, send_to_id)) = 0 then 1
                else count(distinct(sender_id, send_to_id))
                end
            from FriendRequest
        )::decimal
        ,2
    )as accept_rate
from RequestAccepted


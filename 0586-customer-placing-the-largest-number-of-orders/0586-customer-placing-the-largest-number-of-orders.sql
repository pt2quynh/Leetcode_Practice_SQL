# Write your MySQL query statement below
with t1 as (
    select customer_number,
            count(1) as number_order
    from orders
    group by 1
    having count(1) = (select max(number_order)
            from (
                select customer_number,
                    count(1) as number_order
                from orders
                group by 1
            )sub_tb
    ) 
)

select customer_number
from t1
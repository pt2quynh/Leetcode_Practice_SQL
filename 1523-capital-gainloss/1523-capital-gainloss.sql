# Write your MySQL query statement below
with t1 as (
        select stock_name, operation, operation_day, price,
                row_number() over(partition by stock_name order by operation_day) as stock_order
        from stocks
)
, 
t2 as (
        select stock_name,
                sum(case when operation = 'Sell' then price else 0 end) as sell_price,
                sum(case when operation = 'Buy' then price else 0 end) as buy_price
        from t1
        group by stock_name
)

select stock_name,
        sell_price - buy_price as capital_gain_loss
from t2
# Write your MySQL query statement below
with t1 as (
        select prices.product_id, prices.start_date, prices.end_date, prices.price, 
        unitssold.purchase_date, unitssold.units
        from prices 
        join UnitsSold on (prices.product_id = unitssold.product_id) 
        and(unitssold.purchase_date between prices.start_date and prices.end_date)
)
select product_id, round(sum(price*units)/sum(units),2) as average_price 
from t1
group by t1.product_id
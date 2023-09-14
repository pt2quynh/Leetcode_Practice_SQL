# Write your MySQL query statement below

select product_id, product_name
from product 
where product_id not in (select product_id from sales where sale_date between '2019-04-01' and '2019-12-31' group by 1)
and product_id in (select product_id from sales where sale_date between '2019-01-01' and '2019-03-31' group by 1)
and product_id not in (select product_id from sales where sale_date <= '2018-12-31' group by 1)
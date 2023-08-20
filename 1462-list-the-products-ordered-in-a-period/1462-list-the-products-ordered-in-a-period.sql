select p.product_name, sum(o.unit) as unit
from products p
join orders o on p.product_id = o.product_id and (o.order_date >= '2020-02-01' and o.order_date <= '2020-02-29')
group by 1
having sum(o.unit) >= 100
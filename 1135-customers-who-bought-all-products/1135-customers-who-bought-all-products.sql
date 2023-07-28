with t1 as (
  select customer_id,
        product_key,
        dense_rank() over(partition by customer_id order by product_key) as rnk
  from customer
)
select distinct customer_id
from t1
where rnk = (select count(1) from product)

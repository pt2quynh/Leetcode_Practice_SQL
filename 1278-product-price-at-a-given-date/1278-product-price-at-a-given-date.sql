with t1 as (
    select product_id, 10 as price
    from products
    where product_id not in (select product_id from products where change_date <= '2019-08-16')
),

t2 as (
    select p.product_id, p.new_price as price
    from products p
    join 
    (select product_id, max(change_date) as max_date
        from products where change_date <= '2019-08-16' group by product_id) sub_1
    on p.product_id = sub_1.product_id and p.change_date = sub_1.max_date
)

select * from t1
union 
select * from t2
# Write your MySQL query statement below
select u.name, sub_tb.balance
from users u
left join (select account, sum(amount) as balance from transactions group by 1) sub_tb on u.account = sub_tb.account
where  sub_tb.balance > 10000
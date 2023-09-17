# Write your MySQL query statement below
# select u.name, sub_tb.balance
# from users u
# left join (select account, sum(amount) as balance from transactions group by 1) sub_tb on u.account = sub_tb.account
# where  sub_tb.balance > 10000


select u.name, coalesce(sum(t.amount), 0) as balance
from users u
left join transactions t on u.account = t.account
group by 1
having sum(t.amount) > 10000
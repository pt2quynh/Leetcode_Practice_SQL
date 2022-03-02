# Write your MySQL query statement below

# find the number of cancelled requests
# unbanned users + client/driver

with rolewithbanned_filter as (
	select *
	from trips t
	where t.client_id in (select users_id from users where banned = 'No' and (role =                        'client' or role = 'driver'))
	and t.driver_id in (select users_id from users where banned = 'No' and (role = 'client'                 or role = 'driver'))
	and t.request_at between '2013-10-01' and '2013-10-03'
),


count_cancel as (
    select request_at,
	sum(case when status = 'cancelled_by_client' or status = 'cancelled_by_driver' then 1
		else 0 end) as number_cancelled
    from rolewithbanned_filter
    group by request_at
),
# find the total number of requests
# unbanned users
count_total as (
    select request_at, count(*) as total_cancelled_request
    from rolewithbanned_filter
    group by request_at
)

#calculate cancellation rate
select c.request_at as Day, round(c.number_cancelled/t.total_cancelled_request, 2) as "Cancellation Rate"
from count_cancel c, count_total t
where c.request_at = t.request_at



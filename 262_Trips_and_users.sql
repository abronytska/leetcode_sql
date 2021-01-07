/* Write your PL/SQL query statement below */
with b as(
select t.request_at,
       t.status,
       count(1) s
  from trips t
  join users c
    on t.client_id = c.users_id
   and c.banned = 'No'
  join users d
    on t.driver_id = d.users_id
   and d.banned = 'No'
 where t.request_at >= '2013-10-01'--to_date('2013-10-01', 'yyyy-mm-dd')
   and t.request_at <= '2013-10-03'--to_date('2013-10-03', 'yyyy-mm-dd')
group by t.request_at, t.status)
,a as(
select t.request_at,
       count(1) s
  from trips t
  join users c
    on t.client_id = c.users_id
   and c.banned = 'No'
  join users d
    on t.driver_id = d.users_id
   and d.banned = 'No'
 where t.request_at >= '2013-10-01'--to_date('2013-10-01', 'yyyy-mm-dd')
   and t.request_at <= '2013-10-03'--to_date('2013-10-03', 'yyyy-mm-dd')
group by t.request_at)
select a.request_at as "Day",
       nvl(round(b.s/a.s,2),0.00) as "Cancellation Rate"
  from a
  left join b
    on a.request_at = b.request_at
   and b.status != 'completed'
 order by 1;
/* Write your PL/SQL query statement below */
select to_char(a.activity_date, 'YYYY-MM-DD') as day, count(distinct user_id) as active_users
  from Activity a
 where a.activity_date <= to_date('2019-07-27', 'YYYY-MM-DD')
   and a.activity_date > to_date('2019-07-27', 'YYYY-MM-DD') - 30
 group by a.activity_date
 order by 1
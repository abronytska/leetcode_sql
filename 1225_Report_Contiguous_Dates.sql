/* Write your PL/SQL query statement below */
with t as(
select 'succeeded' as state, success_date as task_date from Succeeded
union all 
select 'failed' as state, fail_date as task_date from Failed),
p as(
select state,
       task_date,
       row_number() over (partition by state order by task_date) as rn
  from t
 where task_date >= to_date('2019-01-01','YYYY-MM-DD') and 
       task_date <= to_date('2019-12-31','YYYY-MM-DD'))
select state as period_state,
       to_char(min(task_date)) as start_date,
       to_char(max(task_date)) as end_date
  from p
 group by state, task_date - rn
 order by start_date

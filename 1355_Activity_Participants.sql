/* Write your PL/SQL query statement below */
with count_part as(
select activity, count(id) as cn
  from friends
 group by activity),
mm as (
select min(cn) as min_part, max(cn) as max_part from count_part)

select distinct activity from(
select activity,
       cn
  from count_part)
 where cn != (select min_part from mm)
   and cn != (select max_part from mm)
  
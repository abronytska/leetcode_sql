/* Write your PL/SQL query statement below */
with rt as(
select q.query_name, count(q.query_name) as rat_top
  from queries q
 where q.rating < 3
 group by q.query_name
)
select q.query_name,
       round(avg(q.rating/q.position), 2) as quality,
       decode(rt.rat_top, null, 0,
       round(rt.rat_top/count(q.query_name) * 100, 2)) as poor_query_percentage
  from queries q
  left join rt
    on q.query_name = rt.query_name
 group by rt.rat_top, q.query_name

-- select
--     q.query_name
--     , round(avg(q.rating/q.position), 2) quality
--     , round( sum(case when q.rating < 3 then 1 else 0 end) / count(1) * 100, 2) poor_query_percentage
-- from
--     queries q
-- group by
--     q.query_name
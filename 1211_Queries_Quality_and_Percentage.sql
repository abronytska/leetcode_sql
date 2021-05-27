/* Write your PL/SQL query statement below */
with rt as(
select q.query_name, count(q.query_name) as rat_top
  from queries q
 where q.rating < 3
 group by q.query_name
)
select q.query_name,
       round(sum(q.rating/q.position)/count(q.query_name), 2) as quality,
       decode(rt.rat_top, null, 0,
       round(rt.rat_top/count(q.query_name) * 100, 2)) as poor_query_percentage
  from queries q
  left join rt
    on q.query_name = rt.query_name
 group by rt.rat_top, q.query_name

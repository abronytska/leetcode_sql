/* Write your PL/SQL query statement below */
select t.team_id, t.team_name, nvl(sum(p.points), 0) as num_points
  from (
select host_team as team_id,
       case when host_goals > guest_goals then 3
            when host_goals = guest_goals then 1
            else 0
       end as points
  from matches m
union all
select guest_team as team_id,
       case when host_goals < guest_goals then 3
            when host_goals = guest_goals then 1
            else 0
       end as points
  from matches m) p
  right join teams t
    on p.team_id = t.team_id
 group by t.team_id, t.team_name
 order by num_points desc, t.team_id
 
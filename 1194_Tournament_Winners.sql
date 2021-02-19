/* Write your PL/SQL query statement below */
with a as(
select player_id, sum(score) as score from(
select m.first_player as player_id, m.first_score as score
  from matches m
union all
select m.second_player as player_id, m.second_score as score
  from matches m)
 group by player_id
)
select b.group_id, b.player_id
  from (
select p.group_id, a.player_id, 
       dense_rank() over (partition by group_id order by a.score desc, a.player_id) as rn
  from a
  join players p
    on a.player_id = p.player_id) b
 where b.rn = 1

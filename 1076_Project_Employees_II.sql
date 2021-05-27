/* Write your PL/SQL query statement below */
-- with q as(
-- select p.project_id, count(p.employee_id) as emp_amount
--   from project p
--  group by p.project_id)

-- select q.project_id
--   from q
--  where q.emp_amount = (select max(q.emp_amount) from q)

select pp.project_id from(
select p.project_id,
       rank() over(order by count(p.employee_id) desc) as rnk
  from project p
 group by p.project_id) pp
 where pp.rnk = 1
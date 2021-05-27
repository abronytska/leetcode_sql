/* Write your PL/SQL query statement below */
with q as(
select p.project_id, count(e.employee_id) as emp_amount
  from project p
  join employee e
    on p.employee_id = e.employee_id
 group by p.project_id)

select q.project_id
  from q
 where q.emp_amount = (select max(q.emp_amount) from q)
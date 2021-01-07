/* Write your PL/SQL query statement below */
select department, employee, salary from(
select d.name as department,
       e.name as employee,
       e.salary,
       dense_rank() over(partition by d.id order by e.salary desc) as rn
  from employee e
  join department d
    on e.departmentid = d.id)
where rn <= 3;
/* Write your PL/SQL query statement below */
with a as(
select max(salary) as max_sal, departmentid
  from employee
 group by departmentid)
select d.name as department,e.name as employee, a.max_sal as salary
  from a
  join department d
    on a.departmentid = d.id
  join employee e
    on e.departmentid = a.departmentid
   and e.salary = a.max_sal;

/*second variant is more beautiful and correct as for me*/
select d.name as department,
       ee.name as employee,
       ee.salary
  from (
select e.DepartmentId,
       e.name,
       e.salary,
       dense_rank() over (partition by e.departmentId order by salary desc) as dr
  from employee e) ee
  join Department d
    on ee.DepartmentId = d.id
 where dr = 1;
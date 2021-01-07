/* Write your PL/SQL query statement below */
select e.name as "Employee"
  from employee e
  join employee ee
    on e.managerId = ee.id
   and e.salary > ee.salary;
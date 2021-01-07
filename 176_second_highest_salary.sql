/* Write your PL/SQL query statement below */
select max(salary) as "SecondHighestSalary" 
  from employee e
 where salary != (select max(salary) from employee e);

 /*2nd variant, wont work if there is onle one salary in table*/
 select salary as "SecondHighestSalary" from(
select salary,
       dense_rank() over(order by salary desc) as rn
  from employee e)
where rn = 2
/* Write your PL/SQL query statement below */
select e.email as "Email"
  from person e
 group by e.email
having count(1) > 1;
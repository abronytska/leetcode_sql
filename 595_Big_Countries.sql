/* Write your PL/SQL query statement below */
select w.name, w.population, w.area
  from world w
 where w.population > 25000000
    or w.area > 3000000;
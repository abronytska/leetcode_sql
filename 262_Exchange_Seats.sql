/* Write your PL/SQL query statement below */
with a as(
select s1.id + 1 as id, s1.student
  from seat s1
 where mod(s1.id,2) > 0
   and s1.id != (select count(id) from seat))
,b as(
select s1.id - 1 as id, s1.student
  from seat s1
 where mod(s1.id,2) = 0)
--select * from b
select s.id, nvl(nvl(b.student, a.student), s.student) as student
  from seat s
  left join a
    on a.id = s.id
  left join b
    on s.id = b.id
 order by 1;
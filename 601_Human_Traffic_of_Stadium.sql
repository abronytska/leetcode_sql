/* Write your PL/SQL query statement below */
with a as(
select s1.id id1, s1.visit_date vd1, s1.people p1,
       s2.id id2, s2.visit_date vd2, s2.people p2,
       s3.id id3, s3.visit_date vd3, s3.people p3
  from stadium s1
  join stadium s2
    on s1.id = s2.id + 1
  join stadium s3
    on s1.id = s3.id + 2
 where s1.people >= 100
   and s2.people >= 100
   and s3.people >= 100)
select id as "id", 
       to_char(to_date(visit_date,'YYYY-MM-DD')) as "visit_date", 
       people as "people" 
  from(
select id1 as id, vd1 as visit_date, p1 as people from a
union
select id2 as id, vd2 as visit_date, p2 as people from a
union
select id3 as id, vd3 as visit_date, p3 as people from a)
order by 2
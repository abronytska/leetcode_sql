/* Write your PL/SQL query statement below */
with t as(
select e.exam_id, 
       e.student_id, 
       min(score) over (partition by e.exam_id) as min_exam_score, 
       max(score) over (partition by e.exam_id) as max_exam_score,
       score
  from exam e)
select s.student_id, s.student_name
  from (select distinct t.student_id
          from t
        minus
        select distinct t.student_id
          from t
         where t.score in (t.min_exam_score, t.max_exam_score)) tt
  join student s
    on tt.student_id = s.student_id


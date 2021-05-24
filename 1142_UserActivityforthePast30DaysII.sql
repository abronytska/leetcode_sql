/* Write your PL/SQL query statement below */
with df as(
select a.*
  from activity a
 where a.activity_date <= to_date('2019-07-27','YYYY-MM-DD')
   and a.activity_date > to_date('2019-07-27','YYYY-MM-DD') - 30)

select round(
    decode(nvl(count(distinct df.user_id), 0), 0, 0,
    count(distinct df.session_id) / count(distinct df.user_id)), 2) as average_sessions_per_user
  from df
  -- join df df1
  --   on df.user_id = df1.user_id
  --  and df.session_id = df1.session_id
  --  and df.activity_type = 'open_session'
  --  and df1.activity_type = 'end_session'

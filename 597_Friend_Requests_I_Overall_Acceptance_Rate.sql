/* Write your PL/SQL query statement below */
with ac as(
select count(*) as accepted_cn
  from (select distinct requester_id, accepter_id 
          from RequestAccepted))
, tot as(
select count(*) as tot_cn 
  from(select distinct sender_id, send_to_id
         from FriendRequest))
select round((select accepted_cn from ac)/
       decode((select tot_cn from tot), 0, 1, 
              (select tot_cn from tot)), 2) as accept_rate
  from dual
/* Write your PL/SQL query statement below */
select oa.customer_id, c.customer_name
  from orders oa
  join orders ob
    on oa.customer_id = ob.customer_id
   and oa.product_name = 'A'
   and ob.product_name = 'B'
  join customers c
    on oa.customer_id = c.customer_id
 where oa.customer_id not in (
 select o.customer_id from orders o where o.product_name = 'C')
 -- where 0 = (select count(1) 
 --              from orders o 
 --             where o.customer_id = oa.customer_id 
 --               and o.product_name = 'C')
 -- where not exists(
 -- select * from orders o where o.customer_id = oa.customer_id and o.product_name = 'C')
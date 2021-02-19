--#1
with a as(
select o.customer_id, 
       o.product_id,
       dense_rank() over(partition by o.customer_id--, o.product_id 
                         order by count(o.product_id) desc) as rn
  from orders o
 group by o.customer_id, o.product_id)

select a.customer_id, a.product_id, p.product_name
  from a
  join products p
    on a.product_id = p.product_id
 where a.rn = 1;
 --#2
 with a as(
select t.customer_id, t.product_id,
       dense_rank() over (partition by t.customer_id order by prod_amount desc) as rn
  from (select o.customer_id, o.product_id, count(o.product_id) prod_amount
          from orders o
         group by o.customer_id, o.product_id) t)
select a.customer_id, a.product_id, p.product_name
  from a
  join products p
    on a.product_id = p.product_id
 where a.rn = 1;
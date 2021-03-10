/* Write your PL/SQL query statement below */
select round (
((select count(1) from Delivery where order_date = customer_pref_delivery_date) / 
(select count(*) from Delivery)) * 100, 2) as immediate_percentage
from dual
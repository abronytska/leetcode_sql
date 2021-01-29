/* Write your PL/SQL query statement below */
select category,
nvl("MONDAY", 0) as "MONDAY",
nvl("TUESDAY", 0) as "TUESDAY",
nvl("WEDNESDAY", 0) as "WEDNESDAY",
nvl("THURSDAY", 0) as "THURSDAY",
nvl("FRIDAY", 0) as "FRIDAY",
nvl("SATURDAY", 0) as "SATURDAY",
nvl("SUNDAY", 0) as "SUNDAY"
from(
select i.item_category as category, 
        to_char(o.order_date, 'DAY') as day,
        o.quantity
  from orders o
  right join items i 
    on o.item_id = i.item_id
)
pivot
(sum(quantity) for day in('MONDAY   ' as "MONDAY",
                             'TUESDAY  ' as "TUESDAY",
                             'WEDNESDAY' as "WEDNESDAY",
                             'THURSDAY ' as "THURSDAY",
                             'FRIDAY   ' as "FRIDAY",
                             'SATURDAY ' as "SATURDAY",
                             'SUNDAY   ' as "SUNDAY")
)
order by category
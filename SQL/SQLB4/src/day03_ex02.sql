select
   m.pizza_name,
   m.price,
   pi.pizzeria_name
from
    (select o.menu_id, o.order_date from person_order as o) as o
right join (select m.pizzeria_id,m.pizza_name,m.price,m.id from menu as m) as m on m.id = o.menu_id
left join (select pi.name as pizzeria_name, pi.id as pizzeria_id from pizzeria as pi) as pi on m.pizzeria_id = pi.pizzeria_id
where o.order_date is NULL
order by 1,2

select p.address,
       pi.name,
       count(o.id) as count_of_orders
from person_order as o
join menu m on m.id = o.menu_id
join person p on o.person_id = p.id
join pizzeria pi on m.pizzeria_id = pi.id
group by p.address, pi.name
order by 1,2
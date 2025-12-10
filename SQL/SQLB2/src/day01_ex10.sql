select
    p.name,
    m.pizza_name,
    pi.name
from
    person_order as o
join person as p on p.id = o.person_id
join menu as m on m.id = o.menu_id
join pizzeria as pi on pi.id = m.pizzeria_id

order by 1,2,3;
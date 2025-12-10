select distinct pi.name
from pizzeria as pi
left join (select m.id, m.pizzeria_id from menu as m) as m on pi.id = m.pizzeria_id
right join (select v.visit_date,v.pizzeria_id,v.person_id from person_visits as v) as v on (v.pizzeria_id = pi.id)
left join (select o.person_id, o.order_date,o.menu_id from person_order as o ) as o on (o.order_date = v.visit_date and o.person_id = v.person_id)
right join (select p.id from person as p where p.name = 'Andrey') as p on p.id = v.person_id
where (order_date is null)
order by 1
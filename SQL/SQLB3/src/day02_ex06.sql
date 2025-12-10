select m.pizza_name, pi.name as pizzeria_name
from menu as m
         left join (select o.menu_id, o.person_id from person_order as o) as o on m.id = o.menu_id
         left join (select pi.id, pi.name from pizzeria as pi) as pi on m.pizzeria_id = pi.id
         inner join (select p.name, p.id from person as p where (p.name = 'Denis' or p.name = 'Anna')) as p
                    on p.id = o.person_id
order by 1, 2
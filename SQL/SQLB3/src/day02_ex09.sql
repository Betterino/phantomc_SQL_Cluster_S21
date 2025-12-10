(select p.name
from person as p
         left join person_order as o on p.id = o.person_id
         left join menu as m on o.menu_id = m.id
where (m.pizza_name = 'pepperoni pizza') and p.gender = 'female')
    intersect
(select p.name
from person as p
         left join person_order as o on p.id = o.person_id
         left join menu as m on o.menu_id = m.id
where (m.pizza_name = 'cheese pizza') and p.gender = 'female')
order by 1
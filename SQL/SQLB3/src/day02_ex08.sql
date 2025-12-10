select p.name
from person as p
         left join person_order as o on p.id = o.person_id
         right join(select m.id from menu as m where (m.pizza_name = 'pepperoni pizza' or m.pizza_name = 'mushroom pizza')) as m on o.menu_id = m.id
where (p.address = 'Moscow' or p.address = 'Samara') and p.gender = 'male'
order by 1 desc
(select
    pi.name,
    count(v.id),
    'visit' as action_type
from person_visits as v
join pizzeria as pi on v.pizzeria_id = pi.id
group by pi.name
limit 3)
union
(select
    pi.name,
    count(o.id),
    'order' as action_type
from person_order as o
join menu as m on o.menu_id = m.id
join pizzeria as pi on m.pizzeria_id = pi.id
group by pi.name
limit 3)
order by 3 ,2 desc
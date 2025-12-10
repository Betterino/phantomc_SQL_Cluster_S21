select un.name,
       sum(un.count) as total_count
from
((select
    pi.name,
    count(v.id)
from person_visits as v
join pizzeria as pi on v.pizzeria_id = pi.id
group by pi.name)
union
(select
    pi.name,
    count(o.id)
from person_order as o
join menu as m on o.menu_id = m.id
join pizzeria as pi on m.pizzeria_id = pi.id
group by pi.name)) as un
group by un.name
order by 2 desc, 1
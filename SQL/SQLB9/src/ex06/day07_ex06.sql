select pi.name,
       count(o.id),
       round(avg(price),2),
       max(price),
       min(price)
from person_order as o
join menu as m  on o.menu_id = m.id
join pizzeria as pi on m.pizzeria_id = pi.id
group by pi.name
order by 1
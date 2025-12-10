select
    p.name,
    m.pizza_name,
    m.price,
    m.price * (1 - (pd.discount / 100)) as discount_price,
    pi.name as pizzeria_name
from person_order as o
join person as p on o.person_id = p.id
join menu as m on o.menu_id = m.id
join pizzeria as pi on m.pizzeria_id = pi.id
join person_discounts as pd on (p.id = pd.person_id and pi.id = pd.pizzeria_id)
order by 1,2

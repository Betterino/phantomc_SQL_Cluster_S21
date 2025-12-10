select  m.pizza_name,
        pi1.name,
        pi2.name,
        m.price
from menu as m
inner join (select m1.pizza_name, m1.pizzeria_id, m1.price from menu as m1) as m1 on (m.price = m1.price and m.pizzeria_id > m1.pizzeria_id and m.pizza_name = m1.pizza_name)
inner join (select pi1.name, pi1.id from pizzeria as pi1) as pi1 on m.pizzeria_id = pi1.id
inner join (select pi2.name, pi2.id from pizzeria as pi2) as pi2 on m1.pizzeria_id = pi2.id
order by 1,2
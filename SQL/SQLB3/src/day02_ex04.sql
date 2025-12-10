select
    m.pizza_name,
    pi.name as pizzeria_name,
    m.price
from menu as m
inner join pizzeria as pi on m.pizzeria_id = pi.id and (pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza')
order by 1,2
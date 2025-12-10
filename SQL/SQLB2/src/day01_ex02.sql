(select
    m.pizza_name as pizza_name

from
    menu as m)
UNION
(select
    m.pizza_name as pizza_name

from
    menu as m
)
order by pizza_name desc
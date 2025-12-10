(select
    p.name as object_name
from
    person as p
order by object_name)
UNION ALL
(select
    m.pizza_name as object_name

from
    menu as m
order by object_name)

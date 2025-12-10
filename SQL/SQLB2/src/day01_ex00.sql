(select
    p.id as object_id,
    p.name as object_name
from
    person as p)
UNION ALL
(select
    m.id as object_id,
    m.pizza_name as object_name

from
    menu as m)
order by object_id, object_name
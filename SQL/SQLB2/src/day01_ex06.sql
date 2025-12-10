(select
    o.order_date as action_date,
    p.name
from
    person_order as o,
    person as p
where   o.person_id = p.id)
intersect
(select
    v.visit_date as action_date,
    p.name
from
    person_visits as v,
    person as p
where   v.person_id = p.id)
order by action_date, 2 desc
select
    o.order_date as action_date,
    name ||' (age:'||age||')' as person_information
from
    person as p
inner join person_order as o on o.person_id = p.id
order by 1,2;
select distinct p.name
from
    person_order as o
join person as p on o.person_id = p.id
order by 1
select
    pi.name,
    pi.rating
from
    pizzeria as pi
left join person_visits as v on pi.id  = v.pizzeria_id where v.id is null -- v is null when no visits
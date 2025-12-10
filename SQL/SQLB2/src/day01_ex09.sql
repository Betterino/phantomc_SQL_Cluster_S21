select
    name
from
    pizzeria as p
where not exists(
select
    pizzeria_id
from
    person_visits as v
where v.pizzeria_id = p.id);

select
    name
from
    pizzeria as p
where p.id not in(
select
    pizzeria_id
from
    person_visits as v
where v.pizzeria_id = p.id);
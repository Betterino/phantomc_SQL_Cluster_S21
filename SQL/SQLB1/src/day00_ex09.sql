select
    pe.name as person_name,
    pi.name as pizzeria_name
from
    person as pe,
    pizzeria as pi,
    person_visits as o

where
    o.person_id = pe.id
  and
    o.visit_date BETWEEN '2022-01-07' And '2022-01-09'
  and
    pi.id = o.pizzeria_id
order by person_name ,pizzeria_name desc
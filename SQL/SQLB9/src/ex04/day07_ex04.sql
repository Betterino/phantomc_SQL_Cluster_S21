select p.name,
       count(v.id)
from
    person_visits as v
join person as p on v.person_id = p.id
group by p.name having count(v.id) > 3
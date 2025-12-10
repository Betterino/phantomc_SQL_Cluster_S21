select
    person_id,
    count(id)
from person_visits
group by person_id
order by 2 desc,1
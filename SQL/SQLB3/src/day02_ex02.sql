select
    coalesce(p.name,'-') as person_name,
    v.visit_date as visit_date,
    coalesce(pi.name,'-') as pizzeria_name
from
    person as p
left join
        person_visits as v
            on v.person_id = p.id
            and visit_date between '2022-01-01' and '2022-01-03'
full join pizzeria as pi
    on v.pizzeria_id = pi.id
order by 1,2,3
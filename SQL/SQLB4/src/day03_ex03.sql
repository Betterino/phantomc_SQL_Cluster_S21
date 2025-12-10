select pi.name
from
(select pi.name,
    count(case when p.gender = 'male' then 1 end) !=
       count(case when p.gender = 'female' then 1 end) as gender_check
from pizzeria as pi
         right join (select v.pizzeria_id, v.person_id from person_visits as v) as v
                    on v.pizzeria_id = pi.id
         left join (select p.id, p.gender from person as p) as p on p.id = v.person_id
group by pi.name) as pi
where gender_check = 'true'
order by 1

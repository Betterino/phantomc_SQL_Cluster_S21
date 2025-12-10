create materialized view mv_dmitriy_visits_and_eats as
 (select pi.name
from pizzeria as pi
         inner join (select m.pizzeria_id as pizzeria_id, m.price from menu as m where m.price < 800) as m
                    on pi.id = m.pizzeria_id
         inner join (select v.visit_date, v.person_id as person_id, v.pizzeria_id as pizzeria_id
                     from person_visits as v
                     where v.visit_date = '2022-01-08') as v on pi.id = v.pizzeria_id
         inner join (select p.id as person_id, p.name from person as p where p.name = 'Dmitriy') as p
                    on v.person_id = p.person_id
    order by 1)
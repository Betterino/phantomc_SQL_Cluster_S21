select
   m.pizza_name,
   m.price,
   pi.pizzeria_name,
   v.visit_date
from
    (select v.person_id, v.pizzeria_id, v.visit_date from person_visits as v) as v
inner join (select p.id as person_id,p.name from  person as p where p.name = 'Kate') as p on p.person_id = v.person_id
inner join (select pi.name as pizzeria_name, pi.id as pizzeria_id from pizzeria as pi) as pi on v.pizzeria_id = pi.pizzeria_id
left join (select m.pizzeria_id,m.pizza_name,m.price from menu as m) as m on m.pizzeria_id = v.pizzeria_id
where price between 800 and 1000
order by 1,2,3
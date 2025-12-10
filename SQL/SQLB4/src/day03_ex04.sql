with
    females as ( --!
select pi.name,
       count(case when p.gender = 'male' then 1 end) = 0 as gender_check
from (select m.id,
             m.pizzeria_id
      from menu as m) as m
right join (select o.menu_id,
                   o.person_id
            from person_order as o) as o on o.menu_id = m.id
right join (select p.id,
                   p.gender
            from person as p) as p on p.id = o.person_id
left join (select pi.id,
                  pi.name
           from pizzeria as pi) as pi on pi.id = m.pizzeria_id
group by pi.name
),
    males as ( --!
select pi.name,
       count(case when p.gender = 'female' then 1 end) = 0 as gender_check
from (select m.id,
             m.pizzeria_id
      from menu as m) as m
right join (select o.menu_id,
                   o.person_id
            from person_order as o) as o on o.menu_id = m.id
right join (select p.id,
                   p.gender
            from person as p) as p on p.id = o.person_id
left join (select pi.id,
                  pi.name
           from pizzeria as pi) as pi on pi.id = m.pizzeria_id
group by pi.name
)


select f1.name
from females as f1
where gender_check = 'true'
union
select m1.name
from males as m1
where gender_check = 'true'
order by 1

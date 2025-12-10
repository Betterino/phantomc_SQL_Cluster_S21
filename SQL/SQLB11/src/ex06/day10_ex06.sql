create function fnc_person_visits_and_eats_on_date(pperson varchar = 'Dmitriy',pprice integer = '500',pdate date = '2022-01-08')
    returns table (name varchar)
    language sql as
$$
select pi.name from (select * from person_visits where visit_date = pdate) as v
    full join pizzeria as pi on v.pizzeria_id = pi.id
    full join (select * from menu where price < pprice) as m on m.pizzeria_id = pi.id
    full join person as p on v.person_id = p.id
    where p.name = pperson;
$$;
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
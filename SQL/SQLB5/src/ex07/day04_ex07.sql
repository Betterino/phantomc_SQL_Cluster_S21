insert into person_visits
values ((select max(id) from person_visits) + 1,
        (select id from person as p where p.name = 'Dmitriy'),
        (select id from pizzeria as pi where pi.name = 'DoDo Pizza'),
        '2022-01-08');

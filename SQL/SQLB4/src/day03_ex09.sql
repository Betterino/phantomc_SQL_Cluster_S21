insert into person_visits
values ((select max(id) + 1 from person_visits) + 1, (select id from person as p where p.name = 'Denis'),
        (select id from pizzeria as pi where pi.name = 'Dominos'), '2022-02-24'),
       ((select max(id) + 2 from person_visits) + 1, (select id from person as p where p.name = 'Irina'),
        (select id from pizzeria as pi where pi.name = 'Dominos'), '2022-02-24');
insert into person_order
values ((select max(id) from person_order) + 1, (select id from person as p where p.name = 'Denis'),
        (select id from menu as m where m.pizza_name = 'sicilian pizza'), '2022-02-24'),
       ((select max(id) from person_order) + 2, (select id from person as p where p.name = 'Irina'),
        (select id from menu as m where m.pizza_name = 'sicilian pizza'), '2022-02-24');
insert into menu
values ((select max(id) from menu) + 1, (select id from pizzeria as pi where pi.name = 'Dominos'), 'sicilian pizza',
        900);
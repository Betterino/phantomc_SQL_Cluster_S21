set enable_seqscan = on;
explain analyze select m.pizza_name,
       pi.name as pizzeria_name
from pizzeria as pi
inner join menu as m on m.pizzeria_id = pi.id;
set enable_seqscan = off;
explain analyze select m.pizza_name,
       pi.name as pizzeria_name
from pizzeria as pi
inner join menu as m on m.pizzeria_id = pi.id;

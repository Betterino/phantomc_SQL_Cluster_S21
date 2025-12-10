insert into person_order(id,person_id,menu_id,order_date)
select (select max(id) from person_order) + num, num, (select id from menu as m where m.pizza_name = 'greek pizza'),'2022-02-25'
from generate_series(1,(select max(id) from person),1) as num
CREATE view v_price_with_discount AS
(SELECT p.person_name,
       m.pizza_name,
       price,
       m.price * 0.9 as discount_price
FROM person_order as o
         left join (select m.price, m.id, m.pizza_name from menu as m) as m on m.id = o.menu_id
         left join (select p.name as person_name, p.id from person as p) as p on p.id = o.person_id
order by 1, 2)
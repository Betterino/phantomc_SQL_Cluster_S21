update menu
set price = (select m.price from menu as m where m.pizza_name = 'greek pizza') * 0.9
where pizza_name = 'greek pizza'
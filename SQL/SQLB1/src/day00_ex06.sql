select
    p.name , (case  when (p.name = 'Denis') then 'true' else 'false' end) as check_name
from
    person as p,
    person_order as o
where
    (o.menu_id = 13 or o.menu_id = 14 or o.menu_id = 18)
  and
    o.person_id = p.id
  and
    o.order_date = '2022-01-07'

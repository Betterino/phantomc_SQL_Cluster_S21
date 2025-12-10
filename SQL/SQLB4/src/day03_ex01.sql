select
    m.id as menu_id
from menu as m
except
select
    o.menu_id
from person_order as o
order by 1

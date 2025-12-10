insert into person_discounts select
                                ROW_NUMBER() OVER (partition by pd.id) AS id,
                                o.person_id as person_id,
                                m.pizzeria_id as pizzeria_id,
                                case when count(o.id) = 1 then 10.5
                                     when count(o.id) = 2 then 22
                                     else 30 end as discount
                             from person_discounts as pd
                                 full join person_order as o on true
                                 join menu as m on o.menu_id = m.id
                                 group by o.person_id,m.pizzeria_id,pd.id

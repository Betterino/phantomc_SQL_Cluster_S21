select
    person_order.order_date as action_date,
    p.name ||' (age:'||p.age||')' as person_information
from
    person_order
natural join
        (select  person.name,
                 person.id as person_id,
                 person.age
         from person
         ) as p
ORDER BY 1, 2;
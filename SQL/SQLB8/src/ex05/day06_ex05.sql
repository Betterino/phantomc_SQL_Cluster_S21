comment on table person_discounts is 'Table with personalized discounts for regular customers of pizzerias';
comment on column person_discounts.person_id is 'In this column we track id of the person to whom discount is applied. This value can repeat because person can be regular in number of pizzerias';
comment on column person_discounts.pizzeria_id is 'In this column we track id of the pizzeria where discount is applied to a specific person.';
comment on column person_discounts.discount is 'Discount amount. More orders - bigger discount';
comment on column person_discounts.id is 'Master Key';
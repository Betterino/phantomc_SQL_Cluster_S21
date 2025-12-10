create sequence seq_person_discounts
increment by 1;
select setval('seq_person_discounts', (select max(id)+1 from person_discounts));
alter table person_discounts alter column  id set default nextval('seq_person_discounts');
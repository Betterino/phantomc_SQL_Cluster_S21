create function fnc_persons(pgender varchar = NULL)
    returns setof person
    language sql as
$$
select *
from (select *
      from v_persons_male
      union
      select *
      from v_persons_female) as v
where case
    when pgender is not null then v.gender = pgender
    else true end;
$$;
select *
from fnc_persons();

select *
from fnc_persons(pgender := 'female');

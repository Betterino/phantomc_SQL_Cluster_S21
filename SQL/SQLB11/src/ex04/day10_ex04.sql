create function fnc_persons_male()
returns setof person language sql as
    $$
    select * from v_persons_male;
$$;
create function fnc_persons_female()
returns setof person language sql as
    $$
    select * from v_persons_female;
$$;
select * from fnc_persons_female();
select * from fnc_persons_male();
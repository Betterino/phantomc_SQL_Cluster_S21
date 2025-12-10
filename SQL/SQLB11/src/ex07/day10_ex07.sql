create function func_minimum(variadic arr numeric[])
returns numeric(18,2) language sql as
$$
select * from unnest(arr)
    order by 1
    limit 1;
$$;
SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4,-5.0]);
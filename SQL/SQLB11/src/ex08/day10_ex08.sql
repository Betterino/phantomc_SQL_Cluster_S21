create function fnc_fibonacci(pstop bigint = 10)
returns table ( number integer, fibonacci decimal)
language sql as $$
WITH RECURSIVE fibonacci(position, current_value, next_value) AS (
    SELECT
        1::bigint as position,
        0::decimal as current_value,
        1::decimal as next_value
    UNION ALL
   SELECT
        (position + 1)::bigint,
        next_value::decimal,
        (current_value + next_value)::decimal
    FROM fibonacci
    WHERE position < pstop
)
    SELECT
    position,
    current_value as fibonacci_number
    FROM fibonacci;
$$;
select * from fnc_fibonacci(100::bigint);
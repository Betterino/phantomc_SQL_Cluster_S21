-- Задание 01 — Detailed Query
insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION fnc_t1_exchange(curr varchar, pdate1 timestamp)
  RETURNS TABLE(id bigint, name varchar, rate_to_usd numeric, updated timestamp) LANGUAGE plpgsql
AS
$$
BEGIN
  RETURN QUERY (
    SELECT c.id, c.name, c.rate_to_usd, c.updated
    FROM currency c
    WHERE c.updated <= pdate1 AND c.name = curr
    ORDER BY c.updated DESC
    LIMIT 1
  );
END;
$$;

CREATE OR REPLACE FUNCTION fnc_t2_exchange(curr varchar, pdate1 timestamp)
  RETURNS TABLE(id bigint, name varchar, rate_to_usd numeric, updated timestamp) LANGUAGE plpgsql
AS
$$
BEGIN
  RETURN QUERY (
    SELECT c.id, c.name, c.rate_to_usd, c.updated
    FROM currency c
    WHERE c.updated > pdate1 AND c.name = curr
    ORDER BY c.updated
    LIMIT 1
  );
END;
$$;

CREATE OR REPLACE FUNCTION fnc_closest_exchange(curr varchar, pdate1 timestamp)
  RETURNS TABLE(updated timestamp, rate numeric) LANGUAGE plpgsql
AS
$$
BEGIN
  CASE
    WHEN EXISTS(SELECT * FROM fnc_t1_exchange(curr, pdate1)) THEN
      RETURN QUERY SELECT t1.updated, t1.rate_to_usd FROM fnc_t1_exchange(curr, pdate1) t1;
    ELSE
      RETURN QUERY SELECT t2.updated, t2.rate_to_usd FROM fnc_t2_exchange(curr, pdate1) t2;
  END CASE;
END;
$$;

SELECT
  COALESCE(u.name, 'not defined') AS name,
  COALESCE(u.lastname, 'not defined') AS lastname,
  c.name AS currency_name,
  b.money * (SELECT rate FROM fnc_closest_exchange(c.name, b.updated)) AS currency_in_usd
FROM currency c
LEFT JOIN balance b ON c.id = b.currency_id AND (SELECT updated FROM fnc_closest_exchange(c.name, b.updated)) = c.updated
LEFT JOIN "user" u ON b.user_id = u.id AND b.user_id IS NOT NULL
WHERE b.money IS NOT NULL
ORDER BY 1 DESC, 2, 3;

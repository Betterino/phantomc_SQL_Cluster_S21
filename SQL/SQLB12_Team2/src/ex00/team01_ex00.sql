-- Задание 00 — Classical DWH

WITH currency_last_updated AS (
  SELECT 
    name,
    MAX(updated) AS max_updated
  FROM currency
  GROUP BY name
),
currency_last_rate AS (
  SELECT 
    c.name,
    c.rate_to_usd AS last_rate_to_usd
  FROM currency c
  JOIN currency_last_updated clu ON c.name = clu.name AND c.updated = clu.max_updated
),
select1 AS (
  SELECT 
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    b.type AS type,
    SUM(b.money) AS volume,
    b.user_id
  FROM public.user u
  FULL JOIN balance b ON b.user_id = u.id
  GROUP BY u.name, u.lastname, b.type, b.user_id
),
select2 AS (
  SELECT 
    b2.user_id AS user_id,
    b2.type AS type,
    COALESCE(c.name, 'not defined') AS currency_name,
    COALESCE(clr.last_rate_to_usd, 1) AS last_rate_to_usd,
    SUM(b2.money) AS money
  FROM balance b2
  LEFT JOIN (SELECT DISTINCT id, name FROM currency) c ON b2.currency_id = c.id
  LEFT JOIN currency_last_rate clr ON c.name = clr.name
  GROUP BY c.name, b2.type, b2.user_id, clr.last_rate_to_usd
  ORDER BY 1, 2
)
SELECT 
  s1.name,
  s1.lastname,
  s1.type,
  s1.volume,
  s2.currency_name,
  s2.last_rate_to_usd,
  s2.money * s2.last_rate_to_usd AS total_volume_in_usd
FROM select1 s1
RIGHT JOIN select2 s2 ON s1.type = s2.type AND s1.user_id = s2.user_id
ORDER BY 1 DESC, 2, 3;

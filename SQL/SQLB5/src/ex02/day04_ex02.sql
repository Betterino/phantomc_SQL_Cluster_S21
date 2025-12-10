CREATE VIEW v_generated_dates
as select generated_dates::date
from generate_series('2022-01-01'::date,'2022-01-31'::date,'1 day') as generated_dates
order by 1
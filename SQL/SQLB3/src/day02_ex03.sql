with dates as (select generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')::date as missing_date)
select missing_date
from dates
         left join
     (select visit_date
      from person_visits
      where person_id = 1
         or person_id = 2) as res
     on
         missing_date = res.visit_date
where visit_date is null
order by 1
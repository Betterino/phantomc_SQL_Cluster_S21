select generated_dates from v_generated_dates
except
select distinct visit_date from person_visits
order by 1
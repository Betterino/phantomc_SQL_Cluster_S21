select p.address,
       max(p.age) - round((min(p.age)::numeric/max(p.age)::numeric),2) as formula,
       round(avg(p.age),2) as average,
       max(p.age) - round((min(p.age)/max(p.age)),2) > round(avg(p.age),2) as comparison
from person p
group by p.address
order by 1
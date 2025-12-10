with recursive find_tour(string) as (
select 'a' as string
union all
select
    concat(f.string,r.next_pos) as string
    from (select point2 as next_pos,point1 as cur_pos from routes) as r
        join find_tour as f on position(next_pos in string) = 0 and position(cur_pos in string) = length(string)
),

summation as (select
    r1.cost+r2.cost+r3.cost+r4.cost as total_cost,
    STRING_TO_ARRAY(string, NULL) as tour
from
    (select concat(string, 'a') as string
FROM find_tour
    WHERE LENGTH(string) = 4) as s
join routes as r1 on 1 = position(r1.point1 in s.string) and 2 = position(r1.point2 in s.string)
join routes as r2 on 2 = position(r2.point1 in s.string) and 3 = position(r2.point2 in s.string)
join routes as r3 on 3 = position(r3.point1 in s.string) and 4 = position(r3.point2 in s.string)
join routes as r4 on 4 = position(r4.point1 in s.string) and 1 = position(r4.point2 in s.string))

(select total_cost,tour
from
summation
where total_cost = (select min(total_cost) from summation)
order by 1,2)

UNION

(select total_cost,tour
from
summation
where total_cost = (select max(total_cost) from summation)
order by 1,2)

create table routes
( id bigint primary key ,
  point1 char,
    point2 char,
    cost bigint
  );
alter table routes add constraint ch_point1 check ( point1 in ('a','b','c','d'));
alter table routes add constraint ch_point2 check ( point2 in ('a','b','c','d'));
alter table routes add constraint ch_pointdub check ( point1 != point2);

insert into routes values (1,'a','b',10),
                          (2,'a','d',20),
                          (3,'a','c',15),
                          (4,'b','d',25),
                          (5,'b','c',35),
                          (6,'c','d',30),
                          (7,'b','a',10),
                          (8,'d','a',20),
                          (9,'c','a',15),
                          (10,'d','b',25),
                          (11,'c','b',35),
                          (12,'d','c',30);

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

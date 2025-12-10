/* session #1 */
begin;
set transaction isolation level repeatable read;
/* session #2 */
begin;
set transaction isolation level repeatable read;
/* session #1 */
select sum(rating) from pizzeria;
/* session #2 */
insert into pizzeria values (11,'Kazan Pizza 2  ',4);
commit;
/* session #1 */
select sum(rating) from pizzeria;
commit;
/* session #2 */
select sum(rating) from pizzeria;
/* session #1 */
select sum(rating) from pizzeria;
/* session #1 */
begin;
set transaction isolation level serializable;
/* session #2 */
begin;
set transaction isolation level serializable;
/* session #1 */
select rating from pizzeria where name = 'Pizza Hut';
/* session #2 */
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
commit;
/* session #1 */
select rating from pizzeria where name = 'Pizza Hut';
commit;
/* session #2 */
select rating from pizzeria where name = 'Pizza Hut';
/* session #1 */
select rating from pizzeria where name = 'Pizza Hut';
/* session #1*/
begin;
set transaction isolation level repeatable read;
/* session #2 */
begin;
set transaction isolation level repeatable read;
/* session #1 */
select rating from pizzeria where name = 'Pizza Hut';
/* session #2 */
select rating from pizzeria where name = 'Pizza Hut';
/* session #1 */
update pizzeria set rating = 4 where name = 'Pizza Hut';
/* session #2 */
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
/* session #1 */
commit;
/* session #2 */
commit;
/* result */
select rating from pizzeria where name = 'Pizza Hut';
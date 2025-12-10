/* session #1*/
begin;
update pizzeria set rating = 5 where name = 'Pizza Hut';
select rating from pizzeria where name = 'Pizza Hut';
/* session #2 */
select rating from pizzeria where name = 'Pizza Hut';
/* session #1 */
commit;
select rating from pizzeria where name = 'Pizza Hut';
/* session #2 */
select rating from pizzeria where name = 'Pizza Hut';

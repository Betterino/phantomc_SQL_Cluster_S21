drop function fnc_trg_person_delete_audit() cascade;
drop function fnc_trg_person_insert_audit() cascade;
drop function fnc_trg_person_update_audit() cascade;

truncate person_audit;
delete
from person
where id = 10;
create function fnc_trg_person_audit()
    returns trigger as
$$
begin
    if (TG_OP = 'DELETE') Then
        insert into person_audit (created, type_event, row_id, name, age, gender, address)
        values (CURRENT_TIMESTAMP, 'D', old.id, old.name, old.age, old.gender,
                old.address);
    elseif (TG_OP = 'UPDATE') then
        insert into person_audit (created, type_event, row_id, name, age, gender, address)
        values (CURRENT_TIMESTAMP, 'U', NEW.id, NEW.name, NEW.age, NEW.gender,
                NEW.address);
    elseif (TG_OP = 'INSERT') then
        insert into person_audit (created, type_event, row_id, name, age, gender, address)
        values (CURRENT_TIMESTAMP, 'I', NEW.id, NEW.name, NEW.age, NEW.gender,
                NEW.address);
    END IF;
    return NULL;
end;
$$ language plpgsql;
create trigger trg_person_audit
    after delete or update or insert
    on person
    for each row
execute function fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

UPDATE person
SET name = 'Bulat'
WHERE id = 10;

UPDATE person
SET name = 'Damir'
WHERE id = 10;

DELETE
FROM person
WHERE id = 10;
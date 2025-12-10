create table person_audit
(
    created    timestamp not null,
    type_event char(1)   not null,
    row_id     bigint    not null,
    name       varchar,
    age        integer,
    gender     varchar,
    address    varchar
        constraint ch_type_event check (type_event = 'I' OR type_event = 'D' OR type_event = 'U' )
);

create function fnc_trg_person_insert_audit()
    returns trigger as
$$
begin
    insert into person_audit (created, type_event, row_id, name, age, gender, address)
    values (CURRENT_TIMESTAMP, 'I', NEW.id, NEW.name, NEW.age, NEW.gender,
            NEW.address);
    return NULL;
end;
$$ language plpgsql;

create trigger trg_person_insert_audit
    after insert
    on person
    for each row
execute function fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
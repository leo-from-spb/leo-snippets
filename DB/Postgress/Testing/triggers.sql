create table tab1
(
    id int not null primary key ,
    c1 char(1),
    c2 char(2)
)
;

create table log1
(
    id int not null references tab1,
    row bigserial,
    timestamp timestamp default current_timestamp not null
)
;

create function preserveId() returns trigger
as
$$
begin
    if old.id != new.id
        then
            raise 'Don''t touch my id!';
        end if;
end;
$$ language plpgsql
;

create function fun1() returns trigger
as
$$
begin
    insert into log1 (id) values (old.id);
end;
$$ language plpgsql
;

create trigger tab1_preserve_id_tg
    before update on tab1
    for each row
    when (old.id is distinct from new.id)
    execute procedure preserveId()
;

create trigger log1_preserve_id_tg
    before update on log1
    for each row
    when (old.id is distinct from new.id)
    execute procedure preserveId()
;

create trigger tab1_log1_ins_del_tg
    after insert or delete on tab1
    for each row
    execute procedure fun1()
;

create trigger tab1_log1_upd_tg
    after update on tab1
    for each row
    when (old.* is distinct from new.*)
    execute procedure fun1()
;

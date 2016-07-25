create table thread
(
    thrd_id serial primary key,
    thrd_opened timestamp default now() not null,
    thrd_closed boolean default false,
    thrd_first_msg_id int,
    thrd_last_msg_id int
);

create table message
(
    thrd_id int not null references thread,
    msg_id int not null,
    text varchar(160),
    primary key (thrd_id, msg_id)
);

alter table thread
    add constraint thread_first_msg_fk
        foreign key (thrd_id, thrd_first_msg_id)
            references message;

alter table thread
    add constraint thread_last_msg_fk
        foreign key (thrd_id, thrd_last_msg_id)
            references message;

create function message_assign_id() returns trigger as
$$
declare
    new_id int;
begin
    select coalesce(max(msg_id),0) + 1
        into new_id
        from message
        where thrd_id = new.thrd_id;
    new.msg_id = new_id;
    return new;
end;
$$
language plpgsql;

create trigger message_assign_id
    before insert on message
    for each row
    when (new.msg_id is null)
    execute procedure message_assign_id();

create rule message_new_update_thread
    as on insert to message
    do also
update thread
    set thrd_first_msg_id = coalesce(thrd_first_msg_id, new.msg_id),
        thrd_last_msg_id = new.msg_id
    where thrd_id = new.thrd_id
;


insert into thread (thrd_id) values (1), (2);

insert into message (thrd_id, text) values (1, 'Text A');
insert into message (thrd_id, text) values (1, 'Text B');
insert into message (thrd_id, text) values (1, 'Text C');

insert into message (thrd_id, text) values (2, 'Текст А');
insert into message (thrd_id, text) values (2, 'Текст Б');
insert into message (thrd_id, text) values (2, 'Текст В');


select * from message
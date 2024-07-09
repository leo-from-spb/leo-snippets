------------------------ IN THE EXPLICITLY SPECIFIED SCHEMA --------------------

create table Sandbox.A13 (C1 char, D1 number(1))
/

alter table Sandbox.A13 rename to A26
/

alter table Sandbox.A26
    add C2 char(2)
/

create index Sandbox.A26_i
    on Sandbox.A26(C2)
/

create trigger Sandbox.A26_tr
    after delete on Sandbox.A26
begin
    null;
end;
/

alter table Sandbox.A26
    drop column D1
/

comment on table Sandbox.A26 is 'A small table'
/

comment on column Sandbox.A26.C1 is 'A little column'
/

alter trigger Sandbox.A26_tr compile
/

drop table Sandbox.A26 purge
/





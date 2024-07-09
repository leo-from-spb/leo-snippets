------------------------------ IN THE CURRENT SCHEMA ---------------------------

create table A13 (C1 char)
/

alter table A13 rename to A26
/

alter table A26
    add C2 char(2)
/

create index A26_i
    on A26(C2)
/

create trigger A26_tr
    after delete on A26
begin
    null;
end;
/

rename A26 to A44
/

comment on table A44 is 'A small table'
/

comment on column A44.C1 is 'A little column'
/

alter trigger A26_tr compile
/

drop table A44 purge
/





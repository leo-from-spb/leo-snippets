-- Long names require Oracle 12.2+

create sequence Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Name_seq
/

create table Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Name_Table
(
    Id number(9)
        constraint Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Name_Table_pk
            primary key,
    Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Name_Note_column varchar(4000)
)
/

create trigger Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Name_Table_tg
    before insert on Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Name_Table
    for each row
    when (new.Id is null)
begin
    select Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Name_seq.nextval
        into :new.Id
        from dual;
end;
/

create view Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Name_View as
select *
from Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Long_Name_Table
with check option
/

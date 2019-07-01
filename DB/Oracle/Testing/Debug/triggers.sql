create table Table_with_Triggers
(
    Code char(1),
    Name varchar(26)
)
/

create trigger Table_with_Triggers_Trg_1
    before update on Table_with_Triggers
declare
    x positive := 42;
begin
    dbms_output.put_line('trigger before update statement');
end;
/

create trigger Table_with_Triggers_Trg_2
    before update on Table_with_Triggers
    for each row
begin
    dbms_output.put_line('trigger before update row '||:old.Code);
end;
/

create trigger Table_with_Triggers_Trg_3
    after update on Table_with_Triggers
    for each row
begin
    dbms_output.put_line('trigger after update row '||:old.Code);
end;
/

create trigger Table_with_Triggers_Trg_4
    after update on Table_with_Triggers
begin
    dbms_output.put_line('trigger after update statement');
end;
/

insert into Table_with_Triggers values ('A', 'Altai');
insert into Table_with_Triggers values ('B', 'Barnaul');
commit;

alter trigger Table_with_Triggers_Trg_1 compile debug;
alter trigger Table_with_Triggers_Trg_2 compile debug;
alter trigger Table_with_Triggers_Trg_3 compile debug;
alter trigger Table_with_Triggers_Trg_4 compile debug;

begin
    dbms_output.enable(4000);
end;
/

begin
    update Table_with_Triggers
        set Name = Name || '+';
end;
/

rollback
/


select *
from user_source
/


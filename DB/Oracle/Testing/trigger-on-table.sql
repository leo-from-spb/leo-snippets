create table T1 (
    Id number(9) not null primary key,
    Name varchar(26),
    Kind char,
    Modified_Timestamp date default sysdate
)
/

create trigger T1_kind_tr
    before update on T1
    for each row
    when (old.Id != new.id and old.Kind is not null)
begin
    raise_application_error(-20001, 'Interdit');
end;
/

create trigger T1_modified_timestamp_tr
    before update on T1
    for each row
begin
    :new.Modified_Timestamp := sysdate;
end;
/

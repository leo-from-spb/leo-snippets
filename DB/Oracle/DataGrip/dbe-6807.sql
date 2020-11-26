create table Dbe_6807_Tab
(
    id   number(9)   not null,
    name varchar(40) not null
)
/

begin
    insert into Dbe_6807_Tab (id, name) values (1, 'Roman');
    insert into Dbe_6807_Tab (id, name) values (2, 'John');
    insert into Dbe_6807_Tab (id, name) values (3, 'James');
    insert into Dbe_6807_Tab (id, name) values (4, 'Sherlock');
end;
/

commit
/

create package Dbe_6807_P as
    type Ref_Cursor is ref cursor;
    function Get_Table_Data return Ref_Cursor;
end Dbe_6807_P;
/

create package body Dbe_6807_P as
    function Get_Table_Data return Ref_Cursor is
        the_result Ref_Cursor;
    begin
        open the_result for
            select id, name
            from Dbe_6807_Tab;
        return the_result;
    end Get_Table_Data;
end Dbe_6807_P;
/

select Dbe_6807_P.Get_Table_Data
from dual
/

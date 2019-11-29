create package Roll
as
    procedure pl (s string);
end Roll;
/

create or replace package body Roll
as
    procedure pl(s string)
    is
    begin
        sys.dbms_output.put_line(s);
    end;
end Roll;
/


begin
    Roll.pl('Test before wrapping');
end;
/

declare
    text varchar(2000);
begin
    text := sys.dbms_metadata.get_ddl('PACKAGE_BODY', 'ROLL', user);
    text := trim(replace(text, 'EDITIONABLE', ''));
    --sys.dbms_output.put_line(text);
    sys.dbms_ddl.create_wrapped(text);
end;
/

alter package Roll compile body
/

begin
    Roll.pl('Test after wrapping');
end;
/

select S.*, length(text) as text_length
from sys.user_source S
where name = 'ROLL'
  and type = 'PACKAGE BODY'
/

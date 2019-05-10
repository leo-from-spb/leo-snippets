begin
    --dbms_output.enable(2000);
    dbms_output.put_line('Session Id: ' || userenv('sessionId'));
end;
/

select userenv('sessionId') as Session_Id
from dual
/

create or replace procedure Pro1 as
begin
    dbms_output.put_line('Line A');
    dbms_output.put_line('Line B');
    dbms_output.put_line('Line C');
    dbms_output.put_line('Line D');
end;
/


alter session set plsql_debug = true
/

alter procedure Pro1 compile debug
/


begin
    Pro1;
end;
/

declare
    dsid varchar(60);
begin
    dsid := dbms_debug.initialize;
    dbms_output.put_line('Target session id: ''' || dsid || '''');
end;
/

begin
    --dbms_output.put_line('Procedure started.');
    dbms_debug.debug_on(immediate => true);
    --
    Pro1();
    --
    dbms_debug.debug_off;
    --dbms_output.put_line('Procedure completed.');
end;
/

begin
    dbms_debug.debug_on(immediate => false);
end;
/

begin
    Pro1;
end;
/

declare
    X binary_integer := 10;
    Y binary_integer := 25;
begin
    X := X + Y;
    Y := X - Y;
    X := X - Y;
    dbms_output.put_line('X = ' || X);
    dbms_output.put_line('Y = ' || Y);
end;
/


begin
    dbms_debug.debug_off;
end;
/

alter session set plsql_debug = false
/



create or replace function X4000 return string
as
    X varchar(4000);
begin
    X := rpad('X', 4000, 'X');
    return X;
end;
/

create or replace function X20000 return string
as
begin
    return X4000 || X4000 || X4000 || X4000 || X4000;
end;
/




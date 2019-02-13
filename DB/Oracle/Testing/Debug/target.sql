begin
    dbms_output.enable(2000);
    dbms_output.put_line('Session Id: ' || userenv('sessionId'));
end;
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
    dbms_output.put_line('Target session id: ' || dsid);
end;
/

begin
    dbms_output.put_line('Procedure started.');
    dbms_debug.debug_on(immediate => true);
    --
    Pro1();
    --
    dbms_debug.debug_off;
    dbms_output.put_line('Procedure completed.');
end;
/

create or replace procedure Pro_B as
begin
    dbms_output.put_line('Procedure Pro_B');
end;
/

create or replace procedure Pro_C as
begin
    dbms_output.put_line('Procedure Pro_C');
end;
/

create or replace procedure Pro as
begin
    -- commentary --
    dbms_output.put_line('Line A');
    -- commentary --
    dbms_output.put_line('Line B');
    Pro_B();
    -- commentary --
    dbms_output.put_line('Line C');
    Pro_C();
    -- commentary --
    dbms_output.put_line('Line D');
end;
/

alter procedure Pro_B compile debug;
alter procedure Pro_C compile debug;
alter procedure Pro compile debug;

create or replace package Simplex
as
    --
    counter binary_integer := 0;
    --
    procedure inc_counter;
    pragma restrict_references (inc_counter, RNDS, WNDS);
    --
    procedure inc_counter_N_times (times binary_integer);
    pragma restrict_references (inc_counter_N_times, RNDS, WNDS);
    --
end Simplex;
/

create or replace package body Simplex
as
    --
    procedure inc_counter is
    begin
        counter := counter + 1;
    end;
    --
    procedure inc_counter_N_times (times binary_integer) is
    begin
        for i in 1 .. times
            loop
                inc_counter();
            end loop;
    end;
    --
end Simplex;
/




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
    X number := -1;
begin
    -- commentary --
    dbms_output.put_line('Line A');
    select 26
        into X
        from dual;
    dbms_output.put_line('   variable X = ' || X);
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

alter package Simplex compile debug;
alter package Simplex compile debug body;
alter procedure Pro_B compile debug;
alter procedure Pro_C compile debug;
alter procedure Pro compile debug;

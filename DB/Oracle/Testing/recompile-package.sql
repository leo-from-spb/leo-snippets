create view odin
as
select 1 as x
from dual
/

create or replace package my_package
is
    function fun return integer;
end my_package;
/

create or replace package body my_package
is
    --
    function internal_fun return natural is
    begin
        return 42;
    end;
    --
    function fun return integer is
        xx integer;
    begin
        select sum(x) into xx from odin;
        return xx + internal_fun;
    end;
    --
end my_package;
/

begin
  dbms_output.put_line(my_package.fun);
end;
/

drop view odin
/

create or replace view odin
as
select 4 as x
from dual
/

alter package my_package compile body reuse settings
/





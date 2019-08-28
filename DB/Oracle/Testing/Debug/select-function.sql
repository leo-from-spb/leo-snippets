create function rnd return binary_integer is
begin
    return dbms_random.random;
end;
/

alter function rnd compile debug
/


declare
    x natural;
begin
    select count(*)
    into x
    from dual
    where rnd < 100 or rnd = 0;
end;
/


select rnd
from dual
/

select rnd, rnd
from dual
/


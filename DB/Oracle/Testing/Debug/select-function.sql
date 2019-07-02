create function rnd return binary_integer is
begin
    return dbms_random.random;
end;
/

alter function rnd compile debug
/

select rnd
from dual
/


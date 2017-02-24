create or replace function op_scon (a varchar, b varchar) return varchar as
begin
    if a is not null and b is not null then return a || ' ' || b;
    elsif a is not null then return a;
    elsif b is not null then return b;
    else return null;
    end if;
end;
/

create or replace operator scon
    binding (varchar, varchar)
    return varchar
    using op_scon
/


select scon('aaa', 'bbb') from dual
/

select *
from user_operators
/


drop operator scon force
/

drop function op_scon
/


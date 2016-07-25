create or replace procedure do_something is
begin
   dbms_output.put_line('Something was done.');
end;
/

create or replace view dumb_view as
select 42 as "42"
from dual
/

create or replace trigger dumb_view_t
    instead of update on dumb_view
begin
    do_something;
end;
/

drop procedure do_something
/

alter trigger dumb_view_t compile
/

begin
    update dumb_view
    set "42" = 43;
end;
/

select *
from user_objects
where object_name like 'DUMB_VIEW%'
/

create view View_A
as
select 1 as one
from dual
/

create view View_B
as
select 'B' as B
from dual
/

create view View_C
as
select 42 as "42"
from View_A cross join View_B
/

create or replace view View_A
as
select B as New_A
from View_B
/

alter view View_C compile
/





drop view View_C
/
drop view View_B
/
drop view View_A
/


create table Table_with_Comments
(
    C1 char,
    C2 char(2)
)
/

comment on table Table_with_Comments is 'This table has a comment'
/

comment on column Table_with_Comments.C1 is 'A simple physical column'
/

comment on column Table_with_Comments.C2 is 'Another physical column'
/


create materialized view Mat_View_with_Comments
build immediate
as
select 1 as One, 2 as Two
from dual
/

comment on table Mat_View_with_Comments is 'A simple meaningless materialized view with a comment'
/

comment on column Mat_View_with_Comments.One is 'A simple materialized column'
/

comment on column Mat_View_with_Comments.Two is 'Another materialized column'
/


create view View_with_Comments
as
select 11 as Eleven, 12 as Twelve
from dual
/

comment on table View_with_Comments is 'A simple meaningless view with a comment'
/

comment on column View_with_Comments.Eleven is 'A simple column'
/

comment on column View_with_Comments.Twelve is 'Another column'
/


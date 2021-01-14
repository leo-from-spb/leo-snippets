create table Comm_T1
(
    a_char char,
    a_digit number(1)
)
/

comment on table Comm_T1 is 'Just a table with comments'
/
comment on column Comm_T1.a_char is 'Just a single character'
/
comment on column Comm_T1.a_digit is 'Just a digit'
/


create view Comm_V1 as
select a_char, a_digit
from Comm_T1
/

comment on table Comm_V1 is 'Just a view with comments'
/
comment on column Comm_V1.a_char is 'Just a single character in the view'
/
comment on column Comm_V1.a_digit is 'Just a digit in the view'
/


create materialized view Comm_MV1 as
select a_char, a_digit
from Comm_T1
/

comment on materialized view Comm_MV1 is 'Just a simple materialized view with comments'
/
comment on column Comm_MV1.a_char is 'Just a single character in the materialized view'
/
comment on column Comm_MV1.a_digit is 'Just a digit in the materialized view'
/


create table Comm_PMV1
(
    a_char char,
    a_digit number(1)
)
/

comment on table Comm_PMV1 is 'Pre-built table for materialized view'
/
comment on column Comm_PMV1.a_char is 'Single character in a pre-built table'
/
comment on column Comm_PMV1.a_digit is 'Single digit in a pre-built table'
/


create materialized view Comm_PMV1
            on prebuilt table
    refresh complete on demand
as
select a_char, a_digit
from Comm_T1
/

comment on materialized view Comm_PMV1 is 'Materialized view based on a pre-built table'
/

create table Mini_Table
(
    Digit number(1)
)
/

create materialized view Mini_Mat_View
    refresh complete on demand
    as
select *
from Mini_Table
/


alter table Mini_Table
    add Word varchar(10)
/

alter materialized view Mini_Mat_View compile
/

drop table Mini_Table
/

drop materialized view Mini_Mat_View
/


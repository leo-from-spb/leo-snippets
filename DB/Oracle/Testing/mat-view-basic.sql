create table Useless_Basic_Table
(
    Id number(9) not null
        constraint Useless_Basic_Table_pk primary key,
    Name varchar(26) not null
        constraint Useless_Basic_Table_Name_ak unique,
    Status number(1) default 0 not null,
    Note varchar(80)
)
/

create index Useless_Basic_Table_Status_Name_i
    on Useless_Basic_Table (Status, Name)
/


create materialized view log on Useless_Basic_Table
    with rowid, primary key (Name, Status) including new values
/


create materialized view Useless_Dumb_Mat_View
    refresh complete on demand
    as
select *
from Useless_Basic_Table
/


create materialized view Useless_Mat_View_With_Condition
    refresh fast on commit
    as
select Id, Name, Status, Note
from Useless_Basic_Table
where Status > 0
/

create materialized view Useless_Mat_View_With_Aggregation
    refresh fast on commit
    as
select Status, count(*) as Cnt
from Useless_Basic_Table
group by Status
/


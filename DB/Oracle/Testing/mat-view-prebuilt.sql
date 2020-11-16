create table Strange_Original_Table
(
    Id number(6) not null
        constraint Strange_Original_Table_pk primary key,
    Status number(1) default 0 not null
)
/


create table Strange_Stat
(
    Status number(1) not null
        constraint Strange_Stat_pk primary key,
    Cnt number(9) not null
)
/


create materialized view Strange_Stat
    on prebuilt table
    refresh complete on demand
    as
select Status, cast(count(*) as number(9)) as Cnt
from Strange_Original_Table
group by Status
/


begin
    insert into Strange_Original_Table values (1001, 1);
    insert into Strange_Original_Table values (1002, 2);
    insert into Strange_Original_Table values (1003, 2);
    insert into Strange_Original_Table values (1004, 3);
    insert into Strange_Original_Table values (1005, 3);
    insert into Strange_Original_Table values (1006, 3);
    insert into Strange_Original_Table values (1007, 3);
end;
/

commit
/

begin
    dbms_mview.Refresh('STRANGE_STAT', 'C');
end;
/

select *
from Strange_Stat
/



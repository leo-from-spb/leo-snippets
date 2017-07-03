create table mat_owners
(
    name varchar(128) -- primary key
)
    -- organization index
/


create materialized view mat_owners
    on prebuilt table
    refresh complete
as
select distinct owner as name
    from sys.all_mviews
/

alter materialized view mat_owners refresh complete
/

select *
from mat_owners
/

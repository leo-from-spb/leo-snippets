create materialized view owners
    refresh complete
as
select distinct owner
  from sys.all_objects
/

create materialized view schemas
    refresh complete
as
select owner as name
  from owners
  where owner not in ('SYS','SYSTEM','PUBLIC','XDB','CTXSYS','EXFSYS','WMSYS','DBSNMP')
/

alter materialized view owners refresh complete
/

alter materialized view schemas refresh complete
/

select *
from schemas
/

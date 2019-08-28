-- Analyze Sys Clusters
select 'analyze cluster '||cluster_name||' compute statistics;' as command
from sys.dba_clusters C
where owner = 'SYS'
order by (select min(obj#) from sys.obj$ where name = C.cluster_name and type#=3 and subname is null)
/


-- Analyze Sys Tables
select 'analyze table '||table_name||' compute statistics;' as command
from sys.dba_tables T
where owner = 'SYS'
  and table_name not like '!_%' escape '!'
  and cluster_name is null
  and not (iot_type = 'IOT_OVERFLOW')
order by (select min(obj#) from sys.obj$ where name = T.table_name and type#=2 and subname is null)
/

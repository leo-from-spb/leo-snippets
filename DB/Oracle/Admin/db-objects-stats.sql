with O as ( select object_type as type, owner as schema, count(*) as cnt
			from all_objects
			where owner not in ('PUBLIC', 'SYS', 'SYSTEM', 'ORDSYS', 'MDSYS', 'XDB', 'CTXSYS', 'WMSYS', 'DVSYS')
			group by object_type, owner
			union all
			select 'COLUMN' as type, owner as schema, count(*) as cnt
			from all_tab_columns
			where owner not in ('PUBLIC', 'SYS', 'SYSTEM', 'ORDSYS', 'MDSYS', 'XDB', 'CTXSYS', 'WMSYS', 'DVSYS')
			group by owner
			union all
			select 'ARGUMENT' as type, owner as schema, count(*) as cnt
			from all_arguments
			where owner not in ('PUBLIC', 'SYS', 'SYSTEM', 'ORDSYS', 'MDSYS', 'XDB', 'CTXSYS', 'WMSYS', 'DVSYS')
			group by owner
			union all
			select 'DB LINK' as type, owner as schema, count(*) as cnt
			from all_db_links
			group by owner )
select type, round(avg(cnt), 0) as cnt_avg, max(cnt) as cnt_max, sum(cnt) as cnt_sum
from O
group by type
/



with S as ( select owner, name, type, count(*) as lines, sum(length(text)) as amount
			from all_source
			group by owner, name, type )
select type, count(*) as cnt,
       round(avg(lines),0) as lines_avg, max(lines) as lines_max, sum(lines) as lines_sum,
       round(avg(amount),0) as amount_avg, max(amount) as amount_max, sum(amount) as amount_sum
from S
group by type
order by cnt desc
/


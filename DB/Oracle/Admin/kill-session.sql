
select *
from v$session
where username = user
  and sid != userenv('sid')
/

select userenv('sid') from dual
/

alter system kill session '527,3'
/

select *
from sys.all_objects
where ROWNUM <= 10
  and data_object_id is null


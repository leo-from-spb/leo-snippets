-- Currently running queries
select S.sid, S.serial#, S.audsid,
       S.username, S.status, S.schemaname, S.osuser, S.machine, S.program,
       Q.sql_text
from v$session S,
     v$sql Q
where S.sql_address = Q.address (+)
  and S.sql_hash_value = Q.hash_value (+)
  and S.type != 'BACKGROUND'
/
select *
from sys.dba_data_files
/

-- If you are using a database version prior to 11g,
-- reducing the size of the temporary tablespace is similar to reclaiming space from the undo tablespace.
-- Create a new temp tablespace, move the users on to it,
-- then drop the old temp tablespace.

create temporary tablespace Temp2
    tempfile 'D:\Oracle\OraData\Ora10g\Temp2.dbf'
    size 1G
    autoextend on next 16M
/

alter database default temporary tablespace Temp2
/

select *
from dba_users
where temporary_tablespace != 'TEMP2'
/

drop tablespace Temp including contents and datafiles
/

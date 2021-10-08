declare
    username constant string(30) := 'Beholder';
    cursor G is
        select object_name as name
           from user_objects
           where object_type in ('TABLE', 'MATERIALIZED VIEW', 'VIEW');
    cnt binary_integer := 0;
    cmd string(160);
begin
   for rec in G
       loop
           cmd := 'grant select on '||rec.name||' to '||username;
           execute immediate cmd;
           cnt := cnt + 1;
       end loop;
   dbms_output.put_line('Granted access to '||cnt||' tables.');
end;
/


declare
    username constant string(30) := 'Beholder';
    cursor G is
        select object_name as name
           from user_objects
           where object_type in ('PACKAGE', 'PROCEDURE', 'FUNCTION');
    cnt binary_integer := 0;
    cmd string(160);
begin
   for rec in G
       loop
           cmd := 'grant execute on '||rec.name||' to '||username;
           execute immediate cmd;
           cnt := cnt + 1;
       end loop;
   dbms_output.put_line('Granted access to '||cnt||' packages and/or routines.');
end;
/
declare
    cursor G1 is
        select object_name as name
        from user_objects
        where object_type in ('TABLE', 'MATERIALIZED VIEW', 'VIEW');
    cursor G2 is
        select object_name as name
        from user_objects
        where object_type in ('PACKAGE', 'PROCEDURE', 'FUNCTION');
    cmd varchar(160);
begin
    for r in G1
        loop
            cmd := 'grant select on '||r.name||' to Guest';
            execute immediate cmd;
        end loop;
    for r in G2
        loop
            cmd := 'grant execute on '||r.name||' to Guest';
            execute immediate cmd;
        end loop;
end;
/
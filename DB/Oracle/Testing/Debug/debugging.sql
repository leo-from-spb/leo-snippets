begin
    dbms_output.enable(2000);
    dbms_output.put_line('Session Id: ' || userenv('sessionId'));
end;
/

declare
    tsid varchar(15) := '007E603E0001';
    ri dbms_debug.runtime_info;
    rz binary_integer;
begin
    dbms_debug.attach_session(tsid);
    --
    rz := dbms_debug.synchronize(ri);
    dbms_output.put_line('Synchronize result code: ' || rz);
    dbms_output.put_line('Synchronize line nr:     ' || ri.Line#);
    --
    rz := dbms_debug.continue(ri, 0);
    dbms_output.put_line('Continue result code: ' || rz);
    --
    --rz := dbms_debug.synchronize(ri);
    --dbms_output.put_line('Synchronize result code: ' || rz);
    --dbms_output.put_line('Synchronize line nr:     ' || ri.Line#);
    --
    dbms_debug.detach_session;
end;
/
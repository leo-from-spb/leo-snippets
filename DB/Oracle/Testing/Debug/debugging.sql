begin
    dbms_output.enable(2000);
    dbms_output.put_line('Session Id: ' || userenv('sessionId'));
end;
/


declare
    z binary_integer;
begin
    dbms_debug.attach_session('036331710001');
    z := dbms_debug.set_timeout(10);
end;
/

declare -- SYNC
    ri dbms_debug.runtime_info;
    pi dbms_debug.program_info;
    rz binary_integer;
begin
    rz := dbms_debug.synchronize(ri, 14);
    pi := ri.program;
    dbms_output.put_line('Synchronize result code: ' || rz);
    dbms_output.put_line('Synchronize info:');
    dbms_output.put_line('    Breakpoint:       ' || ri.Breakpoint);
    dbms_output.put_line('    StackDepth:       ' || ri.StackDepth);
    dbms_output.put_line('    Reason:           ' || ri.Reason);
    dbms_output.put_line('    Terminated:       ' || ri.Terminated);
    dbms_output.put_line('Program info:');
    dbms_output.put_line('    Owner:            ' || pi.Owner);
    dbms_output.put_line('    Name:             ' || pi.Name);
    dbms_output.put_line('    Line#:            ' || pi.Line#);
    dbms_output.put_line('    EntryPointName:   ' || pi.EntryPointName);
end;
/

declare -- CONTINUE
    ri dbms_debug.runtime_info;
    pi dbms_debug.program_info;
    rz binary_integer;
begin
    rz := dbms_debug.continue(ri, 12+32, 14+32);
    pi := ri.program;
    dbms_output.put_line('Continue result code: ' || rz);
    dbms_output.put_line('Continue info:');
    dbms_output.put_line('    Line#:            ' || ri.Line#);
    dbms_output.put_line('    Breakpoint:       ' || ri.Breakpoint);
    dbms_output.put_line('    StackDepth:       ' || ri.StackDepth);
    dbms_output.put_line('    Reason:           ' || ri.Reason);
    dbms_output.put_line('    Terminated:       ' || ri.Terminated);
    dbms_output.put_line('Program info:');
    dbms_output.put_line('    LibUnitType:      ' || pi.LibUnitType);
    dbms_output.put_line('    Owner:            ' || pi.Owner);
    dbms_output.put_line('    Name:             ' || pi.Name);
    dbms_output.put_line('    Line#:            ' || pi.Line#);
    dbms_output.put_line('    EntryPointName:   ' || pi.EntryPointName);
end;
/

declare
    source dbms_debug.vc2_table := null;
begin
    dbms_debug.show_frame_source(1, 10, ?, 1);
    open ? for select * from table(source);
end;
/

begin
    dbms_debug.detach_session;
end;
/


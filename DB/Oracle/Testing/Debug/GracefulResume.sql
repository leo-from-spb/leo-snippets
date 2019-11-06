declare
    v1     binary_double := extract(second from localtimestamp);
    v2     binary_double;
    delta  binary_double;
    breaks binary_integer := 46;
    ri     dbms_debug.runtime_info;
    proc   binary_integer := 0;
    rc     binary_integer;
    d      binary_integer;
    r      binary_integer;
begin
    --
    loop
        rc := dbms_debug.continue(ri, breaks, 14);
        r := ri.Reason;
        d := ri.StackDepth;
        exit when rc != 0 or r != 9;
        v2 := extract(second from localtimestamp);
        delta := v2 - v1;
        exit when delta < 0 || delte > 0.3;
    end loop;
    --
    ? := rc;
    ? := r;
    ? := ri.Line#;
    ? := ri.Breakpoint;
    ? := d;
    ? := ri.program.Namespace;
    ? := ri.program.Owner;
    ? := ri.program.Name;
    ? := ri.program.EntryPointName;
    ? := ri.Terminated;
    if (dbms_debug.target_program_running) then proc := 1; end if;
    ? := proc;
    --
end;
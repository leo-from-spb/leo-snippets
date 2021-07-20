-- There're  two packages:
--    Debug_Inner_Pack — without debug info
--    Debug_Outer_Pack — with debug info


create or replace package Debug_Inner_Pack as

    procedure Sleep_1;
    --pragma restrict_references (Sleep_1, rnds, wnds);

    procedure Say(msg string);
    pragma restrict_references (Say, rnds, wnds);

    procedure Pro_1;
    procedure Pro_2;

end Debug_Inner_Pack;
/

create or replace package body Debug_Inner_Pack as

    procedure Sleep_1 is
    begin
        dbms_Lock.sleep(seconds => 1);
    end;

    procedure Say(msg string) is
    begin
        dbms_Output.put_line(msg);
    end;

    procedure Pro_1 is
    begin
        Say('nner Pro_1 begin');
        Sleep_1;
        Sleep_1;
        Say('Inner Pro_1 end');
    end;

    procedure Pro_2 is
    begin
        Say('Inner Pro_2 begin');
        Pro_1;
        Pro_1;
        Say('Inner Pro_2 end');
    end;

end Debug_Inner_Pack;
/




create or replace package Debug_Outer_Pack as

    procedure Do_Something_1;
    procedure Do_Something_2;
    procedure Do_Something_3;

end Debug_Outer_Pack;
/

create or replace package body Debug_Outer_Pack as

    procedure Do_Something_1 is
    begin
        Debug_Inner_Pack.Pro_1;
        Debug_Inner_Pack.Pro_2;
    end;

    procedure Do_Something_2 is
    begin
        Debug_Inner_Pack.Pro_1;
        Do_Something_1;
    end;

    procedure Do_Something_3 is
    begin
        Do_Something_1;
        Do_Something_2;
    end;

end Debug_Outer_Pack;
/


alter package Debug_Outer_Pack compile debug
/


begin
    Debug_Outer_Pack.Do_Something_3();
end;
/

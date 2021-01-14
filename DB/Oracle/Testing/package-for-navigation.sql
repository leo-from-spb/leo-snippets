create package Package_for_Navigation is
    --
    X binary_integer := 0;
    G binary_integer := 1;
    --
    procedure foo;
    --
    procedure bar;
    procedure bar (x natural, y binary_integer);
    procedure bar (x natural, y number);
    procedure bar (x natural, y date);
    procedure bar (x natural);
    --
end Package_for_Navigation;
/

create package body Package_for_Navigation is
    --
    procedure foo is
    begin
        null;
    end;
    --
    procedure bar (x natural, y binary_integer) is
    begin
        null;
    end;
    --
    procedure bar (x natural, y number) is
    begin
        null;
    end;
    --
    procedure bar (x natural, y date) is
    begin
        null;
    end;
    --
    procedure bar (x natural) is
    begin
        null;
    end;
    --
    procedure bar is
    begin
        null;
    end;
    --
end Package_for_Navigation;
/


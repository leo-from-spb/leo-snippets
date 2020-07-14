create package P1 is
    --
    X binary_integer := 0;
    G binary_integer := 1;
    --
    procedure foo;
        pragma restrict_references (foo, rnds, wnds);
    --
    procedure bar;
        pragma restrict_references (bar, rnds, wnds);
    --
    function result return binary_integer;
        pragma restrict_references (result, rnds, wnds, wnps);
    --
end P1;
/

create package body P1 is
    --
    procedure foo is
    begin
        X := X + 26 * G;
    end;
    --
    procedure bar is
    begin
        X := X + 74 * G;
    end;
    --
    function result return binary_integer is
    begin
        return X;
    end;
    --
end;
/

create package P2 is
    --
    procedure plusFoo;
    procedure plusBar;
    procedure minusFoo;
    procedure minusBar;
    --
end P2;
/

create package body P2 is
    --
    procedure plusFoo is
    begin
        P1.G := +1;
        P1.foo;
    end;
    --
    procedure plusBar is
    begin
        P1.G := +1;
        P1.bar;
    end;
    --
    procedure minusFoo is
    begin
        P1.G := -1;
        P1.foo;
    end;
    --
    procedure minusBar is
    begin
        P1.G := -1;
        P1.bar;
    end;
    --
end P2;
/


create view V1 as
select P1.result
from dual
/

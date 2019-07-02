create package Fibonacci is
    --
    function f (n natural) return integer;
    pragma restrict_references (f, rnds, wnds, rnps, wnps);
    --
end Fibonacci;
/

create package body Fibonacci is
    --
    function plus (a integer, b integer) return integer deterministic is
    begin
        return a + b;
    end;
    --
    function f (n natural) return integer is
        a number;
        b number;
        c number;
    begin
        if (n < 2)
            then
                return n;
            else
                a := f(n - 2);
                b := f(n - 1);
                c := plus(a, b);
                return c;
        end if;
    end;
    --
end Fibonacci;
/

alter package Fibonacci compile debug
/

alter package Fibonacci compile debug body
/

declare
    x number;
begin
    dbms_output.enable(1000);
    x := Fibonacci.f(7);
    dbms_output.put_line(x);
end;
/

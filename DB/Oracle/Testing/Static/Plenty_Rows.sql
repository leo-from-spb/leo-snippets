create materialized view Plenty_Digit
    build immediate
    refresh complete on demand 
as
select cast(level - 1 as number(1)) as Digit
from dual
connect by level <= 10
/

create view Plenty_99
as
select D1.Digit as Digit_1,
       D2.Digit as Digit_2,
       cast(D1.Digit * 10 + D2.Digit as number(2)) as Value
from Plenty_Digit D1 cross join Plenty_Digit D2
/

create view Plenty_999
as
select D1.Digit as Digit_1,
       D2.Digit as Digit_2,
       D3.Digit as Digit_3,
       cast(D1.Digit*100 + D2.Digit*10 + D3.Digit as number(3)) as Value
from Plenty_Digit D1 cross join Plenty_Digit D2 cross join Plenty_Digit D3
/

create view Plenty_999999
as
select cast(T1.Value*1000 + T2.Value as number(6)) as Value
from Plenty_999 T1 cross join Plenty_999 T2
/

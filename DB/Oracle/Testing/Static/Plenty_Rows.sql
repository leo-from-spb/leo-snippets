create materialized view plenty_R10 (Digit)
    never refresh
as
select cast(d as number(1))
from (select 0 as d from dual union all
      select 1 as d from dual union all
      select 2 as d from dual union all
      select 3 as d from dual union all
      select 4 as d from dual union all
      select 5 as d from dual union all
      select 6 as d from dual union all
      select 7 as d from dual union all
      select 8 as d from dual union all
      select 9 as d from dual)
/


create materialized view plenty_R1000 (Value)
    never refresh
as
select cast(D1.Digit * 100 + D2.Digit * 10 + D3.Digit as number(3))
from plenty_R10 D1,
     plenty_R10 D2,
     plenty_R10 D3
/


create materialized view plenty_R1000000 (Value)
    never refresh
as
select cast(V1.Value * 1000 + V2.Value as number(6))
from plenty_R1000 V1 cross join plenty_R1000 V2
/

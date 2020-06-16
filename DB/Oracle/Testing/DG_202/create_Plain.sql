create table Plain_N1K
(
    Nr number(4) not null
        constraint Plain_T1000_range_ch check (Nr between 1 and 1000)
        constraint Plain_T1000_uq unique
)
/

create materialized view Plain_N1M
as
select (K1.Nr - 1) * 1000 + K2.Nr as Nr
from Plain_N1K K1 cross join Plain_N1K K2
/

begin
    for i in 1 .. 1000
        loop
            insert into Plain_N1K values (i);
        end loop;
end;
/

commit
/

alter materialized view Plain_N1M refresh complete
/


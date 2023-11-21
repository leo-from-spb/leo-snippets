create table Part_Crazy_One
(
    Id int not null,
    Nothing char(1)
) partition by range (Id)
;


select replace('create table Part_Crazy_One_# partition of Part_Crazy_One for values from (#000) to (#999+1) partition by range (Id);', '#', d1::char)
from generate_series(0, 9) as Digit1(d1)
;

select translate('create table Part_Crazy_One_#$ partition of Part_Crazy_One_# for values from (#$00) to (#$99+1) partition by range (Id);', '#$', d1::char||d2::char)
from generate_series(0, 9) as Digit1(d1),
     generate_series(0, 9) as Digit2(d2)
;

select translate('create table Part_Crazy_One_#$% partition of Part_Crazy_One_#$ for values from (#$%0) to (#$%9+1);', '#$%', d1::char||d2::char||d3::char)
from generate_series(0, 9) as Digit1(d1),
     generate_series(0, 9) as Digit2(d2),
     generate_series(0, 9) as Digit3(d3)
;

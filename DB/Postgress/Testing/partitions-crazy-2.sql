create table Part_Crazy_Two
(
    Id int not null,
    Nothing char(1)
) partition by range (Id)
;


-- First 10
select replace('create table Part_Crazy_Two_# partition of Part_Crazy_Two for values from (#0000) to (#9999+1) partition by range (Id);', '#', d1::char)
from generate_series(0, 9) as Digit1(d1)
order by d1
;

-- Next 100
select translate('create table Part_Crazy_Two_#$ partition of Part_Crazy_Two_# for values from (#$000) to (#$999+1) partition by range (Id);', '#$', d1::char||d2::char)
from generate_series(0, 9) as Digit1(d1),
     generate_series(0, 9) as Digit2(d2)
order by d1, d2
;

-- Next 1000
select translate('create table Part_Crazy_Two_#$% partition of Part_Crazy_Two_#$ for values from (#$%00) to (#$%99+1) partition by range (Id);', '#$%', d1::char||d2::char||d3::char)
from generate_series(0, 9) as Digit1(d1),
     generate_series(0, 9) as Digit2(d2),
     generate_series(0, 9) as Digit3(d3)
order by d1, d2, d3
;

-- Next 10000
select translate('create table Part_Crazy_Two_#$%@ partition of Part_Crazy_Two_#$% for values from (#$%@0) to (#$%@9+1) partition by range (Id);', '#$%@', d1::char||d2::char||d3::char||d4::char)
from generate_series(0, 9) as Digit1(d1),
     generate_series(0, 9) as Digit2(d2),
     generate_series(0, 9) as Digit3(d3),
     generate_series(0, 9) as Digit4(d4)
order by d1, d2, d3, d4
;

-- Last Half A
select translate('create table Part_Crazy_Two_#$%@A partition of Part_Crazy_Two_#$%@ for values from (#$%@0) to (#$%@5);', '#$%@', d1::char||d2::char||d3::char||d4::char)
from generate_series(0, 9) as Digit1(d1),
     generate_series(0, 9) as Digit2(d2),
     generate_series(0, 9) as Digit3(d3),
     generate_series(0, 9) as Digit4(d4)
order by d1, d2, d3, d4
;

-- Last Half A
select translate('create table Part_Crazy_Two_#$%@B partition of Part_Crazy_Two_#$%@ for values from (#$%@5) to (#$%@9+1);', '#$%@', d1::char||d2::char||d3::char||d4::char)
from generate_series(0, 9) as Digit1(d1),
     generate_series(0, 9) as Digit2(d2),
     generate_series(0, 9) as Digit3(d3),
     generate_series(0, 9) as Digit4(d4)
order by d1, d2, d3, d4
;

-- Check
select *
from pg_catalog.pg_tables
where tablename like 'part_crazy_two%'
order by tablename
;
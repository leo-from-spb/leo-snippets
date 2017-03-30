create table Table_A
(
    A_Id int
)
;

create table Table_B
(
    B_Id int
)
inherits (Table_A)
;

create table Table_C
(
    C_Id int
)
inherits (Table_A)
;

create table Table_D
(
    D_Id int
)
inherits (Table_B, Table_C)
;


insert into Table_A values (11)
;

insert into Table_B values (21,22)
;

insert into Table_C values (31,33)
;

insert into Table_D values (41,42,43,44)
;

select *
from Table_A
;

commit
;

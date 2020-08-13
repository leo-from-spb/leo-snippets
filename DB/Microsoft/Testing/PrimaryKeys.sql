create table UT7
(
    column_0 tinyint,
    column_1_k_3 char(3) not null,
    column_2_k_2 char(2) not null,
    column_3_k_1 char(1) not null,
    column_4 bigint,
    constraint UT7_pk primary key (column_3_k_1, column_2_k_2, column_1_k_3)
)

create table UT8
(
    dach_g bigint,
    dritte_og char(3) not null,
    zweite_og char(2) not null,
    erste_og char(1) not null,
    erde_g tinyint,
    constraint U87_pk primary key (erste_og, zweite_og, dritte_og)
)

go

create table UT4
(
    zero   tinyint,
    first  char(1) not null,
    second char(2) not null,
    third  char(3) not null,
    fourth char(4) not null,
    fifth  char(5) not null,
    last   bigint,
    constraint UT4_pk primary key (first, second, third),
    constraint UT4_ak unique (second, third, fourth)
)

create table UT5
(
    x_zero tinyint,
    x_1_k_3 char(3),
    x_2_k_2 char(2),
    x_3_k_1 char(1),
    x_last bigint,
    constraint UT5_UT4_fk foreign key (x_3_k_1, x_2_k_2, x_1_k_3) references UT4
)

create table UT6
(
    y_zero tinyint,
    y_1_k_4 char(4),
    y_2_k_3 char(3),
    y_3_k_2 char(2),
    y_last bigint,
    constraint UT6_UT4_fk foreign key (y_3_k_2, y_2_k_3, y_1_k_4) references UT4 (second, third, fourth)
)

go

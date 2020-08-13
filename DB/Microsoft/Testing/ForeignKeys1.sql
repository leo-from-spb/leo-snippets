create table UT1
(
    F0 tinyint,
    F1 char(1) not null ,
    F2 varchar(2) not null ,
    F3 int not null ,
    F4 bigint not null,
    F5 varchar(10),
    constraint T1_pk primary key (F1,F2,F3),
    constraint T1_ak unique (F2,F3,F4)
)

create table UT2
(
    X7 tinyint,
    X6 char(1),
    X5 varchar(2),
    X4 int,
    X3 char(3),
    constraint T2_T1_fk foreign key (X6,X5,X4) references UT1
)

create table UT3
(
    Y7 tinyint,
    Y6 char(1),
    Y5 varchar(2),
    Y4 int,
    Y3 bigint,
    Y2 varchar(2),
    constraint T3_T1_fk foreign key (Y5,Y4,Y3) references UT1 (F2,F3,F4)
)

go

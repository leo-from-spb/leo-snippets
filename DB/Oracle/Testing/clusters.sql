------ INDEX CLUSTER ------

create cluster PROJECT_DATA
(
    TM_ID number(6),
    PRO_ID number(6)
)
    size 256
/


create index PROJECT_DATA_I
    on cluster PROJECT_DATA
/


create table PROJECT
(
    TM_ID number(6),
    PRO_ID number(6),
    PRO_NAME varchar(60),
    primary key (TM_ID,PRO_ID)
)
    cluster PROJECT_DATA(TM_ID,PRO_ID)
/


create table PROJECT_PROPERTY
(
    TM_ID number(6),
    PRO_ID number(6),
    PROP_CODE varchar(26),
    PROP_NAME varchar(60),
    PROP_VALUE varchar(60),
    primary key (TM_ID,PRO_ID,PROP_CODE)
)
    cluster PROJECT_DATA(TM_ID,PRO_ID)
/


------ HASH CLUSTER ------

create cluster DUMP
(
    X number(9),
    Y number(9)
)
    hash is X*13 + Y*7 hashkeys 129
/



create table CAPPING
(
    COORD_X number(9),
    COORD_Y number(9),
    AMOUNT number(10,4),
    primary key (COORD_X,COORD_Y)
)
    cluster DUMP(COORD_X,COORD_Y)
/


create table KERN_ROCK
(
    COORD_X number(9),
    COORD_Y number(9),
    ROCK_TYPE char(1),
    AMOUNT number(10,4),
    primary key (COORD_X,COORD_Y,ROCK_TYPE)
)
    cluster DUMP(COORD_X,COORD_Y)
/

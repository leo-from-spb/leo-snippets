create table INDEXED_TABLE
(
    F1 char(1),
    F2 char(2),
    F3 char(3),
    F4 char(4),
    F5 char(5),
    F6 char(6),
    F7 char(7),
    F8 char(8),
    F9 char(9)
)
/

create unique index INDEX_1_2_3 on INDEXED_TABLE (F1, F2, F3)
/
create unique index INDEX_4_5d_6 on INDEXED_TABLE (F4, F5 desc, F6)
/
create unique index INDEX_7d_8_9d on INDEXED_TABLE (F7 desc, F8, F9 desc)
/


create table UNIQUE_INDEXED_TABLE
(
    F1 number(1),
    F2 number(2),
    F3 number(3),
    F4 number(4),
    F5 number(5),
    F6 number(6),
    F7 number(7),
    F8 number(8),
    F9 number(9)
)
/

create unique index UNIQUE_INDEX_1_2_3 on UNIQUE_INDEXED_TABLE (F1, F2, F3)
/
create unique index UNIQUE_INDEX_4_5d_6 on UNIQUE_INDEXED_TABLE (F4, F5 desc, F6)
/
create unique index UNIQUE_INDEX_7d_8_9d on UNIQUE_INDEXED_TABLE (F7 desc, F8, F9 desc)
/



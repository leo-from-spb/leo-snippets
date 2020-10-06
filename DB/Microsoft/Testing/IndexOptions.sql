create table Table_With_Key
(
    Column_basic_X smallint,
    Column_basic_Y bigint,
    Column_basic_Z varchar(10),
    constraint Table_With_Key_pk primary key (Column_basic_X, Column_basic_Y)
)
go


create table Table_With_Key_A1
(
    Column_A1_X smallint,
    Column_A1_Y bigint,
    Column_A1_Z varchar(10),
    constraint Table_With_Key_A1_pk primary key (Column_A1_X, Column_A1_Y)
        with (pad_index = off)
)
create table Table_With_Key_A2
(
    Column_A2_X smallint,
    Column_A2_Y bigint,
    Column_basic_Z varchar(10),
    constraint Table_With_Key_A2_pk primary key (Column_A2_X, Column_A2_Y)
        with (pad_index = on)      -- option sys.indexes.is_padded default false
)
go


create table Table_With_Key_B1
(
    Column_B1_X smallint,
    Column_B1_Y bigint,
    Column_basic_Z varchar(10),
    constraint Table_With_Key_B1_pk primary key (Column_B1_X, Column_B1_Y)
        with (ignore_dup_key = off)
)
create table Table_With_Key_B2
(
    Column_B2_X smallint,
    Column_B2_Y bigint,
    Column_basic_Z varchar(10),
    constraint Table_With_Key_B2_pk primary key (Column_B2_X, Column_B2_Y)
        with (ignore_dup_key = on)    -- option sys.indexes.ignore_dup_key default false
)
go


create table Table_With_Key_C1
(
    Column_C1_X smallint,
    Column_C1_Y bigint,
    Column_basic_Z varchar(10),
    constraint Table_With_Key_C1_pk primary key (Column_C1_X, Column_C1_Y)
        with (allow_row_locks = off)
)
create table Table_With_Key_C2
(
    Column_C2_X smallint,
    Column_C2_Y bigint,
    Column_basic_Z varchar(10),
    constraint Table_With_Key_C2_pk primary key (Column_C2_X, Column_C2_Y)
        with (allow_row_locks = on)    -- option sys.indexes.allow_row_locks default true
)
go


create table Table_With_Key_D1
(
    Column_D1_X smallint,
    Column_D1_Y bigint,
    Column_basic_Z varchar(10),
    constraint Table_With_Key_D1_pk primary key (Column_D1_X, Column_D1_Y)
        with (allow_page_locks = off)
)
create table Table_With_Key_D2
(
    Column_D2_X smallint,
    Column_D2_Y bigint,
    Column_basic_Z varchar(10),
    constraint Table_With_Key_D2_pk primary key (Column_D2_X, Column_D2_Y)
        with (allow_page_locks = on)    -- option sys.indexes.allow_page_locks default true
)
go


create table Table_With_Key_E1
(
    Column_E1_X smallint,
    Column_E1_Y bigint,
    Column_basic_Z varchar(10),
    constraint Table_With_Key_E1_pk primary key (Column_E1_X, Column_E1_Y)
)
alter index Table_With_Key_E1_pk on Table_With_Key_E1
    disable                                             -- option sys.indexes.is_disabled
go


create table Table_With_Key_F1
(
    Column_F1_X smallint,
    Column_F1_Y bigint,
    Column_basic_Z varchar(10),
    constraint Table_With_Key_F1_pk primary key (Column_F1_X, Column_F1_Y)
        with fillfactor=25                              -- option sys.indexes.fill_factor default 0
)
go


create table Base_Table_11 (column11 int primary key, note varchar(10));
create table Base_Table_12 (column12 int primary key, note varchar(10));
create table Base_Table_13 (column13 int primary key, note varchar(10));
create table Base_Table_14 (column14 int primary key, note varchar(10));
create table Base_Table_15 (column15 int primary key, note varchar(10));
create table Base_Table_16 (column16 int primary key, note varchar(10));
create table Base_Table_17 (column17 int primary key, note varchar(10));
create table Base_Table_18 (column18 int primary key, note varchar(10));


create table A_Stupid_Table_A
(
    id bigint primary key,
    column01 int default (01 + 01) check (column01 between -100 and +100),
    column02 int default (02 + 02) check (column02 between -100 and +100),
    column03 int default (03 + 03) check (column03 between -100 and +100),
    column04 int default (04 + 04) check (column04 between -100 and +100),
    column05 int default (05 + 05) check (column05 between -100 and +100),
    column06 int default (06 + 06) check (column06 between -100 and +100),
    column07 int default (07 + 07) check (column07 between -100 and +100),
    column08 int default (08 + 08) check (column08 between -100 and +100),
    column09 int default (09 + 09) check (column09 between -100 and +100),
    column10 int default (10 + 10) check (column10 between -100 and +100),
    column11 int default (11 + 11) check (column11 between -100 and +100) references Base_Table_11 (column11),
    column12 int default (12 + 12) check (column12 between -100 and +100) references Base_Table_12 (column12),
    column13 int default (13 + 13) check (column13 between -100 and +100) references Base_Table_13 (column13),
    column14 int default (14 + 14) check (column14 between -100 and +100) references Base_Table_14 (column14),
    column15 int default (15 + 15) check (column15 between -100 and +100) references Base_Table_15 (column15),
    column16 int default (16 + 16) check (column16 between -100 and +100) references Base_Table_16 (column16),
    column17 int default (17 + 17) check (column17 between -100 and +100) references Base_Table_17 (column17),
    column18 int default (18 + 18) check (column18 between -100 and +100) references Base_Table_18 (column18),
    column19 int default (19 + 19) check (column19 between -100 and +100),
    column20 int default (20 + 20) check (column20 between -100 and +100)
) engine InnoDB;


create trigger A_Stupid_Table_A_tg_1
    before insert on A_Stupid_Table_A
    for each row set new.column19 = new.column19+1;

create trigger A_Stupid_Table_A_tg_2
    before update on A_Stupid_Table_A
    for each row set new.column20 = old.column20+1;
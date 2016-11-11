create table Language
(
    Lang_Code char(2) not null
        constraint Language_pk
            primary key,
    Lang_Name varchar(40) not null
        constraint Language_ak
            unique
)
    organization index
/

create table Country
(
    Ctr_Code char(2) not null
        constraint Country_pk
            primary key,
    Ctr_Name varchar(80) not null
        constraint Country_ak
            unique
)
/

create table Country_Synonym
(
    Ctr_Code char(2) not null
        constraint Country_Synonym_Country_fk
            references Country,
    Lang_Code references Language,
    Syn_Name varchar(80) not null
)
/

create index Country_Synonym_Code_Name_ui
    on Country_Synonym (Ctr_Code, Syn_Name)
/

alter table Country_Synonym
    add constraint Country_Synonym_pk
        primary key (Ctr_Code, Syn_Name)
            using index Country_Synonym_Code_Name_ui
/

create table Region
(
    Ctr_Code char(2) not null
        constraint Region_Country_fk
            references Country,
    Reg_Id number(6) not null,
    Reg_Code varchar(6) not null,
    Reg_Name varchar(80) not null,
    constraint Region_pk
        primary key (Reg_Id),
    constraint Region_ak
        unique (Ctr_Code, Reg_Code),
    constraint Region_Name_ak
        unique (Ctr_Code, Reg_Name)
)
/


create sequence City_seq
    start with 5001
    order nocache
/

create table City
(
    Ctr_Code char(2) not null
        constraint City_Country_fk
            references Country,
    Reg_Code varchar(6),
    Cty_Id number(6) not null,
    Cty_Name varchar(80) not null,
    Cty_Latitude number(10,7),
    Cty_Longitude number(10,7),
    constraint City_pk
        primary key (Ctr_Code, Cty_Id),
    constraint City_Region_fk
        foreign key (Ctr_Code, Reg_Code)
            references Region (Ctr_Code, Reg_Code)
)
/


create table Toponym
(
    Ctr_Code char(2) not null,
    Reg_Code varchar(6),
    Cty_Id number(6),
    Topo_Name varchar(80) not null,
    Topo_Rowid rowid not null
)
/

create index Toponym_Name_i
    on Toponym (Topo_Name)
/

create materialized view Toponym
    on prebuilt table
as
select Ctr_Code,
       cast(null as varchar(6)) as Reg_Code,
       cast(null as number(6)) as Cty_Id,
       Ctr_Name as Topo_Name,
       Country.rowid as Topo_Rowid
from Country
union
select Ctr_Code,
       Reg_Code,
       cast(null as number(6)) as Cty_Id,
       Reg_Name as Topo_Name,
       Region.rowid  as Topo_Rowid
from Region
union
select Ctr_Code,
       Reg_Code,
       Cty_Id,
       Cty_Name as Topo_Name,
       City.rowid as Topo_Rowid
from City
/



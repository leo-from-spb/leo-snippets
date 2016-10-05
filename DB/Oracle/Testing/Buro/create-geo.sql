create table Language
(
    Lang_Code char(2) not null
        constraint Language_pk
            primary key,
    Lang_Name varchar(40) not null
        constraint Language_ak
            unique
)
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
organization index
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

create sequence City_seq
    start with 5001
    order nocache
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


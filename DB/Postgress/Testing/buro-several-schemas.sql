create schema Geo

    create table Country
    (
        Ctr_Abb        char(2)     not null primary key,
        Ctr_Name       varchar(40) not null unique,
        Ctr_Name_Alias varchar(40) unique
    )

    create table City
    (
        Ctr_Abb        char(2)     not null references Country,
        Cty_Id         serial      not null,
        Cty_Name       varchar(40) not null,
        Cty_Post_Index varchar(8),
        Cty_Capital    boolean,
        primary key (Ctr_Abb, Cty_Id),
        unique (Ctr_Abb, Cty_Name)
    )
;


create schema Buro

    create table Face
    (
        Face_Id         serial not null primary key,
        Face_Kind       char(1) not null,
        Face_Name       varchar(80) not null,
        Face_Name_Alias varchar(80),
        Face_Note       varchar(1000)
    )

    create table Org
    (
        Org_Legal_Name  varchar(120),
        Org_Legal_Stuff text
    )
    inherits (Face)

    create table Person
    (
        Person_Name_0  varchar(40),
        Person_Name_1  varchar(40),
        Person_DOB     date
    )
    inherits (Face)

    create table Address
    (
        Face_Id            int      not null,
        Ctr_Abb            char(2)  not null references Geo.Country,
        Cty_Id             serial   not null,
        Address_Post_Index varchar(8),
        Address_Line_1     varchar(120),
        Address_Line_2     varchar(120),
        foreign key (Ctr_Abb, Cty_Id) references Geo.City
    )

;

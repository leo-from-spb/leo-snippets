create sequence Department_seq
    start with 101 maxvalue 999999
    cache 10 noorder
/

create sequence Chair_seq
    start with 501 maxvalue 999999
    cache 10 noorder
/

create table Department
(
    Dep_Id number(6) not null
        constraint Department_pk
            primary key,
    Dep_Parent_Id number(6)
        constraint Department_Parent_fk
            references Department,
    Dep_Name varchar(40) not null,
    constraint Department_Name_ui
        unique (Dep_Parent_Id, Dep_Name)
)
organization index
/

create table Chair
(
    Cha_Id number(6) not null
        constraint Chair_pk
            primary key,
    Cha_Name varchar(40) not null
        constraint Chair_ak
            unique,
    Cha_Legal_Name varchar(40)
)
/

create table Staff_Matrix
(
    Dep_Id references Department on delete cascade not null,
    Cha_Id references Chair on delete cascade not null,
    Staff_Vacancies number(4) not null,
    Staff_Salary_Min number(6),
    Staff_Salary_Max number(6),
    Staff_Remark varchar(80),
    Staff_Open date default sysdate,
    Staff_Closed date,
    constraint Staff_Matrix_pk
        primary key (Dep_Id, Cha_Id),
    constraint Staff_Matrix_Salary_ch
        check (Staff_Salary_Min <= Staff_Salary_Max)
)
/



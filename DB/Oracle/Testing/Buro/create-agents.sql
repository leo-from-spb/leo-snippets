create cluster Agent (Agn_Id number(9))
    size 1K
/

create index Agent_ci on cluster Agent
/

create sequence Agent_seq
    start with 1001 order nocache nocycle
/

create table Agent
(
    Agn_Id number(9) not null
        constraint Agent_pk
            primary key
        constraint Agent_Id_positive_ch
            check (Agn_Id > 0),
    Agn_Kind char(1)
        constraint Agent_Kind_ch
            check (Agn_Kind in ('O','P')),
    Agn_Name varchar(80) not null
        constraint Agent_Name_ui
            unique,
    Agn_Note varchar(2000),
    Agn_Status number(1) default 0 not null,
    Agn_Status_Time date default sysdate not null,
    Agn_Created_Time date default sysdate not null,
    Agn_Modified_Time date default sysdate not null
)
cluster Agent(Agn_Id)
/

create table Org
(
    Agn_Id number(9) not null
        constraint Org_Agent_fk
            references Agent on delete cascade
        constraint Org_pk
            primary key,
    Org_Name_Prefix varchar(15),
    Org_Name varchar(80) not null
        constraint Org_Name_ui
            unique,
    Org_Name_Suffix varchar(15)
)
cluster Agent(Agn_Id)
/

create table Person
(
    Agn_Id number(9) not null
        constraint Psn_Agent_fk
            references Agent on delete cascade
        constraint Psn_pk
            primary key,
    Psn_Name_0 varchar(40),
    Psn_Name_1 varchar(40),
    Psn_Name_2 varchar(40),
    Psn_Sex char(1)
        constraint Person_Sex_ch
            check (Psn_Sex in ('F','M')),
    Psn_Born date
        constraint Person_Born_ch
            check (trunc(Psn_Born) = Psn_Born)
)
cluster Agent(Agn_Id)
/

create index Person_Names_i
    on Person (Psn_Name_0, Psn_Name_1, Psn_Name_2)
/

create index Person_Born_Sex_i
    on Person (Psn_Born, Psn_Sex)
/

create table Agent_Word
(
    Agn_Id number(9) not null
        constraint Agw_Agent_fk
            references Agent on delete cascade,
    Agw_Sn number(4) not null
        constraint Agw_Sn_ch
            check (Agw_Sn > 0),
    Word varchar(40) not null,
    constraint Agent_Word_pk
        primary key (Agn_Id, Agw_Sn)
)
cluster Agent(Agn_Id)
/

create index Agent_Word_i
    on Agent_Word (Word)
/

create table Org_Contact
(
    Agn_Id number(9) not null
        constraint Org_Contact_Agent_fk
            references Agent on delete cascade,
    Contact_sn number(4) not null,
    Psn_Id references Person on delete cascade,
    Contact_Remark varchar(80),
    constraint Org_Contact_pk
        primary key (Agn_Id, Contact_sn),
    constraint Org_Contact_ak
        unique (Agn_Id, Psn_Id)
)
cluster Agent(Agn_Id)
/

create index Org_Contact_Psn_i
    on Org_Contact (Psn_Id)
/

create table Kinsman
(
    Kin char(1) not null
        constraint Kinsman_pk
            primary key,
    Mean_A_F number(15),
    Mean_A_M number(15),
    Mean_B_F number(15),
    Mean_B_M number(15)
)
organization index
/

create table Person_Kinsman
(
    Psn_A_Id references Person on delete cascade not null,
    Psn_B_Id references Person on delete cascade not null,
    Kin references Kinsman,
    constraint Person_Kinsman_AB_ch
        check (Psn_B_Id != Psn_B_Id),
    constraint Person_Kinsman_pk
        primary key (Psn_A_Id, Psn_B_Id)
)
/

create index Person_Kinsman_A_i
    on Person_Kinsman (Psn_A_Id, Psn_B_Id, Kin)
/

create index Person_Kinsman_B_i
    on Person_Kinsman (Psn_B_Id, Psn_A_Id, Kin)
/

create trigger Agent_Id_trg
    before insert on Agent
    for each row
    when (new.Agn_Id is null)
begin
    select Agent_seq.nextval into :new.Agn_Id from dual;
end;
/

create trigger Agent_Status_trg
    before update of Agn_Status on Agent
    for each row
begin
    :new.Agn_Status_Time := sysdate;
end;
/

create trigger Agent_Modification_trg
    before update of Agn_Kind,Agn_Name,Agn_Note on Agent
    for each row
begin
    :new.Agn_Modified_Time := sysdate;
end;
/

create view Org_Info as
select Agn_Id, Agn_Name,
       Org_Name_Prefix, Org_Name, Org_Name_Suffix,
       Agn_Note, Agn_Status, Agn_Status_Time,
       Agn_Created_Time, Agn_Modified_Time
from Agent natural join Org
where Agn_Status >= 0
with check option
/

create trigger Org_Info_Insert_trg
    instead of insert on Org_Info
    for each row
declare
    id Agent.Agn_Id%type;
begin
    insert
        into Agent (Agn_Kind, Agn_Name, Agn_Note, Agn_Status)
        values ('O', :new.Agn_Name, :new.Agn_Note, :new.Agn_Status)
        return Agn_Id into id;
    insert
        into Org (Agn_Id, Org_Name_Prefix, Org_Name, Org_Name_Suffix)
        values (id, :new.Org_Name_Prefix, :new.Org_Name, :new.Org_Name_Suffix);
end;
/

create trigger Org_Info_Update_trg
    instead of update on Org_Info
    for each row
begin
    update Agent
        set Agn_Name = :new.Agn_Name,
            Agn_Note = :new.Agn_Note
        where Agn_Id = :old.Agn_Id;
    update Org
        set Org_Name = :new.Org_Name,
            Org_Name_Prefix = :new.Org_Name_Prefix,
            Org_Name_Suffix = :new.Org_Name_Suffix
        where Agn_Id = :old.Agn_Id;
end;
/

create trigger Org_Info_Delete_trg
    instead of delete on Org_Info
    for each row
begin
    if :old.Agn_Status > 0
        then
            update Agent
                set Agn_Status = -1
                where Agn_Id = :old.Agn_Id;
        else
            delete from Agent
                where Agn_Id = :old.Agn_Id;
        end if;
end;
/
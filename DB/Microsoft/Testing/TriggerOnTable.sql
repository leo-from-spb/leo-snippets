create table Tab1
(
    Id integer,
    Note varchar(60)
)
go

create table Tab1_Archive
(
    Id integer,
    Note varchar(60)
)
go

create trigger Tab1_Trim_Note_tr
    on Tab1
    after insert, update
    not for replication
as
begin
    update Tab1
    set Note = ltrim(rtrim(Note))
    where Id in (select Id from INSERTED);
end
go


create trigger Tab1_Delete_tr
    on Tab1
    after delete
    not for replication
as
    insert into Tab1_Archive
    select *
    from DELETED;
go


create trigger Tab1_All_Events_tr
    on Tab1
    for insert, delete, update
as
select -1
go

create trigger Tab1_Archive_Delete_tr
    on Tab1_Archive
    instead of delete
as
delete
    from Tab1_Archive
    where Id in (select Id from DELETED)
go
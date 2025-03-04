create table Department
(
    Id number(6) primary key,
    Parent_Id references Department,
    Name varchar(25)
)
/
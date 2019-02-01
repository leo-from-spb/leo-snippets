create table Master (
    Id number(9) not null primary key,
    Note varchar(80)
);

create table Detail (
    Ref_Id number(9) not null references Master,
    Note_2 varchar(160)
);


create table Cluster_Basic
(
    Id bigint
        constraint Cluster_Basic_pk primary key clustered,
    Name varchar(26)
        constraint Cluster_Basic_sk unique nonclustered,
    Note varchar(80)
)


create table Cluster_Second
(
    Id bigint
        constraint Cluster_Second_pk primary key nonclustered,
    Name varchar(26)
        constraint Cluster_Second_sk unique clustered,
    Note varchar(80)
)


create table Heap_Basic
(
    Id bigint
        constraint Heap_Basic_pk primary key nonclustered,
    Name varchar(26)
        constraint Heap_Basic_sk unique nonclustered,
    Note varchar(80)
)



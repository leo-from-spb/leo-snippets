create table My_Table_With_Indices_1
(
    F1 int,
    F2 int,
    F3 int,
    F4 int
)

create table My_Table_With_Indices_2
(
    F5 int,
    F6 int,
    F7 int,
    F8 int
)

create clustered index Basic_Clustered_Index on My_Table_With_Indices_1 (F1,F2)

create nonclustered index Basic_NonClustered_Index on My_Table_With_Indices_1 (F3,F4)

create unique clustered index Unique_Clustered_Index on My_Table_With_Indices_2 (F5,F6)

create unique nonclustered index Unique_NonClustered_Index on My_Table_With_Indices_2 (F7,F8)


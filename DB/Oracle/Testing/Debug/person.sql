create table Person
(
    Id     number(9) not null primary key,
    Born   number(4),
    Name_1 varchar(26),
    Name_2 varchar(26),
    Status decimal(1) default 1 not null
)
/

begin
    insert into Person values (1, 1901, 'Иван', 'Иванов', 1);
    insert into Person values (2, 1921, 'Пётр', 'Петров', 1);
    insert into Person values (3, 1941, 'Фёдор', 'Фёдоров', 1);
    insert into Person values (4, 1961, 'Сидор', 'Сидоров', 1);
end;
/

create procedure Print_Name(anId positive) is
    person1 Person%rowtype;
begin
    select *
        into person1
        from Person
        where Id = anId;
    dbms_output.put_line(person1.name_1 || ' ' || person1.name_2);
end;
/

alter procedure Print_Name compile debug
/

begin
    dbms_output.enable(1000);
    Print_Name(1);
    Print_Name(2);
    Print_Name(3);
    Print_Name(4);
end;
/

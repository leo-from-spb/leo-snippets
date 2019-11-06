alter type Person_Name compile debug body
/


declare
    p1 Person_Name := Person_Name('Сидоров', 'Иван', 'Петрович');
    x string(100);
begin
    dbms_output.enable(256);
    x := p1.lfm;
    dbms_output.put_line(x);
end;
/


create table Person
(
    Id   number(9)   not null primary key,
    Name Person_Name not null,
    Note varchar(80)
)
/

begin
    insert into Person values (1, Person_Name('Иванов', 'Иван', 'Иваныч'), null);
    insert into Person values (2, Person_Name('Петров', 'Пётр', 'Петрович'), null);
    insert into Person values (3, Person_Name('Фёдоров', 'Фёдор', 'Фёдорович'), null);
end;
/

create or replace view Person_Simple as
select p.Id, p.Name.lfm() as Name_lfm
from Person p
where p.Name.is_Ok() = 1
/

select *
from Person_Simple

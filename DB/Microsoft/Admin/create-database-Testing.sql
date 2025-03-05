use master
go

create database Testing
    on primary (name = 'Testing',
                filename = '/var/opt/mssql/data/Testing.mdf',
                size = 8192kb,
                filegrowth = 65536kb)
    log on (name = 'Testing_log',
            filename = '/var/opt/mssql/data/Testing_log.ldf',
            size = 8192kb,
            filegrowth = 65536kb)
go

alter database Testing set
    -- compatibility_level = 140,
    recovery simple
go

create login Tester with password = 'test', check_policy = OFF
go

use Testing
go

create user Tester from login Tester
go

exec sp_addrolemember 'db_ddladmin', 'Tester'
exec sp_addrolemember 'db_datareader', 'Tester'
exec sp_addrolemember 'db_datawriter', 'Tester'
go

create schema tests authorization Tester
go

alter user Tester with default_schema = tests
go

grant select, insert, update, delete on schema ::tests to Tester
grant select, insert, update, delete on database ::Testing to Tester
grant create table on database ::Testing to Tester
grant alter on schema ::tests to Tester
grant alter on database ::Testing to Tester
grant control on database ::Testing to Tester
grant showplan to Tester
go

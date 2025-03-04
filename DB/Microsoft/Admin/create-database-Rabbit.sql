use master
go

create database Rabbit
    on primary (name = 'Rabbit',
                filename = '/var/opt/mssql/data/Rabbit.mdf',
                size = 8192kb,
                filegrowth = 65536kb)
    log on (name = 'Rabbit_log',
            filename = '/var/opt/mssql/data/Rabbit_log.ldf',
            size = 8192kb,
            filegrowth = 65536kb)
go

alter database Rabbit set
    -- compatibility_level = 140,
    recovery simple
go

create login Leo with password = 'lemon', check_policy = OFF
go

use Rabbit
go

create user Leo from login Leo
go

exec sp_addrolemember 'db_ddladmin', 'Leo'
exec sp_addrolemember 'db_datareader', 'Leo'
exec sp_addrolemember 'db_datawriter', 'Leo'
go

create schema leo authorization Leo
go

alter user Leo with default_schema = leo
go

grant showplan to Leo
go

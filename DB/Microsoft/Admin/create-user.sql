-- before creating user, create a login being logged in to the master database


-- in the necessary database

create user tester from login Tester
go

exec sp_addrolemember 'db_ddladmin', 'tester'
exec sp_addrolemember 'db_datareader', 'tester'
exec sp_addrolemember 'db_datawriter', 'tester'

create schema tests authorization tester
go

alter user tester with default_schema = tests
go

grant showplan to tester
go
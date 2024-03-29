---- DEVELOPMENT ROLE ----

create role Development
/

grant create cluster,
      create sequence,
      create type,
      create table,
      create view,
      create materialized view,
      create trigger,
      create procedure,
      create operator,
      create indextype,
      create dimension,
      create database link,
      create synonym
to Development
/


---- REMOVE STUPID "SECURITY" ----

alter profile default limit password_life_time unlimited
/

alter profile default
    limit failed_login_attempts unlimited
    password_life_time unlimited
/

alter profile default
    limit password_verify_function null
/

create role tester with login password 'test'
;

create schema test authorization tester
;

grant all privileges on database testing to tester
;

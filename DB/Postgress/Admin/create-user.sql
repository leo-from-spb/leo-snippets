create role tester with login password 'test'
;

create schema tester authorization tester
;

grant all privileges on database testing to tester
;

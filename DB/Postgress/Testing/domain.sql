create domain person_name as varchar(26) not null
;

create domain person_sex as "char"
    constraint person_sex_possible_values_ch check (value in ('F'::"char",'M'::"char"))
;

create domain person_dob as date
    constraint person_dob_possible_date_1_ch check (value >= date '1900-01-01')
    constraint person_dob_possible_date_2_ch check (value <= date '2099-12-31')
;

create domain subject_status as smallint
    default 1
;

create domain record_timestamp as timestamp not null
    default current_timestamp
;

create domain project_codes as int[]
;


create table person
(
    id int,
    first_name person_name,
    second_name person_name,
    sex person_sex,
    dob person_dob,
    status subject_status,
    participation project_codes,
    created_timestamp record_timestamp,
    note varchar(2000)
)
;


alter domain person_dob
    add constraint person_dob_interval_ch check (value between date '1900-01-01' and date '2099-12-31')
;

alter domain person_dob
    drop constraint person_dob_possible_date_1_ch
;

alter domain person_dob
    drop constraint person_dob_possible_date_2_ch
;

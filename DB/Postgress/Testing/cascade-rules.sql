create table master
(
    id int not null constraint master_pk primary key
)
;

create table refer
(
    ref1 int constraint ref1 references master,
    ref2 int constraint ref2 references master deferrable,
    ref3 int constraint ref3 references master deferrable initially deferred,
    ref4 int constraint ref4 references master on update cascade on delete cascade,
    ref5 int constraint ref5 references master on update set null on delete set null,
    ref6 int constraint ref6 references master on update restrict,
    ref7 int constraint ref7 references master on update restrict deferrable,
    ref8 int constraint ref8 references master on update restrict deferrable initially deferred,
    ref9 int default 9 constraint ref9 references master on delete set default
)
;

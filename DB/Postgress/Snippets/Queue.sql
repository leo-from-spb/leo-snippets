create table queue (qid int);

insert into queue values (1),(2),(3),(4),(5);
select * from queue;
commit;

select *
from queue
for update skip locked
limit 1;

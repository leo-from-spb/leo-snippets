create user Rabbit identified by Krolik42
                  default tablespace data
                  temporary tablespace temp
                  quota unlimited on data
/

grant connect, development
    to Rabbit with admin option
/

grant select any dictionary, debug connect session
    to Rabbit
/


create user Tester identified by Labuda42
                   default tablespace data
                   temporary tablespace temp
                   quota unlimited on data
/

grant connect, development
    to Tester with admin option
/

grant debug connect session
    to Tester
/

create user Tester_Admin identified by MuraLabuda42
                         default tablespace data
                         temporary tablespace temp
                         quota unlimited on data
/

grant connect, development
    to Tester_Admin with admin option
/

grant select any dictionary, select_catalog_role, debug connect session, debug any procedure
    to Tester_Admin
/


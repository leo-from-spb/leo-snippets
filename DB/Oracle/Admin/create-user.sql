create user #USER identified by #PASSWORD
                  default tablespace users
                  temporary tablespace temp
                  quota unlimited on users
/

grant connect, development
    to #USER with admin option
/

grant select any dictionary, debug connect session
    to #USER
/
create user Test_User identified by test
                      default tablespace users
                      temporary tablespace temp
                      quota unlimited on users
/

grant connect, development
    to Test_User with admin option
/

grant debug connect session
    to Test_User
/

create user Test_Admin identified by test
                       default tablespace users
                       temporary tablespace temp
                       quota unlimited on users
/

grant connect, development
    to Test_Admin with admin option
/

grant select any dictionary, select_catalog_role, debug connect session, debug any procedure
    to Test_Admin
/

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

grant debug connect session, select any dictionary
    to Test_Admin
/

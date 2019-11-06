create type Person_Name as object
(
    last_name varchar(26),
    first_name varchar(26),
    middle_name varchar(26),
    member function lfm return varchar,
    member function fml return varchar,
    member function is_Not_Empty return boolean,
    member function is_Ok return natural
)
/

create or replace type body Person_Name is
    member function lfm return varchar is
            r varchar(81) := last_name;
        begin
            if first_name is not null or middle_name is not null then
                if r is not null then
                    r := r || ', ';
                end if;
                if first_name is not null then
                    r := r || first_name;
                end if;
                if first_name is not null or middle_name is not null then
                    r := r || ' ';
                end if;
                if last_name is not null then
                    r := r || middle_name;
                end if;
            end if;
            return r;
        end;
    member function fml return varchar is
            r varchar(80) := first_name;
        begin
            if r is not null and middle_name is not null then
                r := r || ' ';
            end if;
            if middle_name is not null then
                r := r || middle_name;
            end if;
            if r is not null and last_name is not null then
                r := r || ' ';
            end if;
            if last_name is not null then
                r := r || last_name;
            end if;
            return r;
        end;
    member function is_Not_Empty return boolean is
        begin
            return last_name is not null or
                   first_name is not null or
                   middle_name is not null;
        end;
    member function is_Ok return natural is
        begin
            if is_Not_Empty()
                then return 1;
                else return 0;
                end if;
        end;
end;
/






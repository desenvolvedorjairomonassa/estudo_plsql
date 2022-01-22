 -- mostrar saidas do db_output.put_line
set serveroutput on;

variable var_text varchar2(30);

variable var_number NUMBER;

variable var_date DATE;

declare
v_text varchar2(30);
begin
:var_text := 'Hello SQL';
:var_number := 20;
v_text := :var_text;
--dbms_output.put_line(v_text);
--dbms_output.put_line(:var_text);
end;

print var_text;

variable var_sql number;

begin 
  :var_sql := 100;
end;
--database da oracle sh
select * from employees where employee_id = :var_sql;

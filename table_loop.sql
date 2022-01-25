---use hr from oracle 
declare
  type e_list is table of employees.first_name%type index by employees.email%type;
  emps e_list;
  idx employees.email%type;
  v_email employees.email%type;
  v_first_name employees.first_name%type;
  v_salary employees.salary%type;
begin
    for x in 100 .. 120 loop
    select first_name,email, salary into v_first_name,v_email, v_salary from employees
       where employee_id = x;
    if v_salary > 10000 then
        emps(v_email) := v_first_name;
    end if;
  end loop;
  idx := emps.first;
  while idx is not null  loop
    dbms_output.put_line('o email de '|| emps(idx) ||'  : '|| idx);
    idx := emps.next(idx);
  end loop;
end;

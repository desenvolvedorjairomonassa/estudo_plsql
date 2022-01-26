-- usando base exemplo da oracle
-- cursor explicito com notfound
set serveroutput on;
declare
  cursor c_emps is select * from employees where salary > 12000;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  loop
    fetch c_emps into v_emps;
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name|| ' ' || TO_CHAR(v_emps.salary, 'fmL99G999D00'));
    exit when c_emps%notfound;
  end loop;
  close c_emps;
end; 

-- cursor explicito com while-notfound

declare
  cursor c_emps is select * from employees where salary > 13000;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  fetch c_emps into v_emps;
  while c_emps%found loop
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name|| ' ' || TO_CHAR(v_emps.salary, 'fmL99G999D00'));
    fetch c_emps into v_emps;
  end loop;
  close c_emps;
end; 

-- cursor explicito com for loop fixo
set serveroutput on;
declare
  --cursor só pegar 5 primeiras linhas por causa do fetch
  cursor c_emps is select * from employees where salary > 10000 order by 1 fetch next 5 rows only;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  for i in 1..5 loop
    fetch c_emps into v_emps;
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name|| ' ' || TO_CHAR(v_emps.salary, 'fmL99G999D00'));
   
  end loop;
  close c_emps;
end; 

-- cursor explicito com for passando cursor
set serveroutput on;
declare
  cursor c_emps is select * from employees where salary > 10000 order by 1 fetch next 5 rows only;
 -- v_emps c_emps%rowtype;
begin
 -- open c_emps;
  for v_emps in c_emps loop
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name|| ' ' || TO_CHAR(v_emps.salary, 'fmL99G999D00'));
  end loop;
end; 


-- cursor explicito com for passando select 
set serveroutput on;
begin
 -- open c_emps;
  for v_emps in (select * from employees where salary > 10000 order by 1 fetch next 5 rows only) loop
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name|| ' ' || TO_CHAR(v_emps.salary, 'fmL99G999D00'));
  end loop;
end; 


-- for loop encadeado com parametro
-- cursor explicito com for passando select 
set serveroutput on;
declare
 cursor c_emps(depart_id number) is (select * from employees where salary > 10000 and department_id = depart_id)  ; 
begin
 -- open c_emps;
 for v_depart in (select department_id, department_name from departments) loop
    dbms_output.put_line('---- > Departamento : '|| v_depart.department_name);
    for v_emps in c_emps(v_depart.department_id) loop
        dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name|| ' ' || TO_CHAR(v_emps.salary, 'fmL99G999D00'));
    end loop;
 end loop;
end; 

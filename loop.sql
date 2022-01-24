set SERVEROUTPUT ON;
declare
v_counter number(2) := 1;
begin
  dbms_output.put_line('loop simples com exit, se for maior de 10');
  loop
    dbms_output.put_line('contador loop: '|| v_counter);
    v_counter := v_counter + 1;

    exit when v_counter > 10;
  end loop;
  dbms_output.put_line('while-loop faz enquanto counter for maior que zero');
   while v_counter >= 0 loop
    dbms_output.put_line('contador while: '|| v_counter);
    v_counter := v_counter - 1;
   -- exit when v_counter > 3;
  end loop;
  dbms_output.put_line('for-loop faz contando de 1 a  10');
  for i in 1..10 loop
    dbms_output.put_line('contador for : '|| i);
  end loop;
end;

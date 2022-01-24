---------------- nested table
set SERVEROUTPUT ON
declare
  type lista is table of varchar2(50);
  tlista lista;
begin
  tlista := lista('Jose','Maria','Pedro');
  for i in 1..tlista.count() loop
    dbms_output.put_line(tlista(i));
  end loop;
end;

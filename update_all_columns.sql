--ATUALIZANDO UM REGISTRO INTEIRO
-- usando rh do orcale
declare
 -- tipo de variavel é uma registro
    record_emp employees%rowtype;
begin
   --faz uma copia e joga para registro declarado
    select * into record_emp from employees where employee_id = 100;
    r_emp.salary := 0;
    r_emp.commission_pct := 10;
 -- atualiza todas as colunas com a copia feita
    update employees set row = r_emp where employee_id = 100;
end;

create or replace function new_employee_after_insert_trigger()
returns trigger
as $$
begin
insert into salaryhistory(e_id, new_salary, Change_effect_d) values (new.e_id,new.e_salary,new.e_join_d);
return new;
end;
$$ language plpgsql;
create trigger new_employee_after_insert_trigger
after insert on employees 
for each row 
execute function new_employee_after_insert_trigger();



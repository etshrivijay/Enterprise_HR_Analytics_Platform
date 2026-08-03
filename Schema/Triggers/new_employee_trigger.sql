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

-- i am using both before and after trigger because of the foreign key issue between both the table the data couln't be inserted 

create or replace function new_employee_before_insert_trigger()
returns trigger
as $$
begin
if (new.e_salary<=0)
then
raise exception 'Salary must be greater than zero';
end if;
return new;
end;
$$ language plpgsql;
create trigger new_employee_before_insert_trigger
before insert on employees 
for each row 
execute function new_employee_before_insert_trigger();
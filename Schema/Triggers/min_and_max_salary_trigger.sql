-- since check() can't be implemented as it involves data from another table
create or replace function min_and_max_salary_trigger()
returns trigger
as $$
declare tem record;
begin
select min_salary,max_salary into tem from roles where new.e_role_id= role_id;
--if you try to input data in salarychange table the trigger there will automatically try to update 
--employees table which will make it to run min max trigger if the salary in the new salarychange
-- is lesser or grater than the role limit of the employee than automatically the entire thing stops 
--because of raise exception (since all of them are in the same transaction)
--it wont insert data in salaryhistory table also  
if(new.e_salary >= tem.min_salary and new.e_salary<=tem.max_salary )
then return new;
else 
raise Exception 'the salary entered does not match with the role of the employee% ',new.e_name;
end if;
end;
$$ language plpgsql;

create trigger min_and_max_salary_trigger

before insert or update of e_salary on employees 
for each row 
execute function min_and_max_salary_trigger();
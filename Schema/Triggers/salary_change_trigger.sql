create or replace function trigger_salary_change_entry()
returns trigger 
as $$ 
declare tem numeric;
declare tem1 date;

begin 
select max(change_effect_d) into tem1 from salaryhistory where e_id = new.e_id group by e_id;
select e_salary into tem from employees where e_id= new.e_id;
-- first condition prevents update in employees tables if its an earlier raise
-- this prevents updating joining salary in employees table again
--since this is before insert trigger you want insert to happen and 
--update shouldn't happen so you don't return null
if (tem1> new.change_effect_d or tem =new.new_salary  )
then return new;
else
update employees set e_salary=new.new_salary where e_id= new.e_id;
return new;
end if;
end;
$$language plpgsql;

create trigger trigger_salary_change_entry
before insert on salaryhistory
for each row 
execute function trigger_salary_change_entry();


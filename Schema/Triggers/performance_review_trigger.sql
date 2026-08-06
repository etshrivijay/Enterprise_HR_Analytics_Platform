create or replace function performance_review_salary_update()
returns trigger as
$$
declare salary_hike numeric;
begin
--once a year salary hike after review 
select e_salary into salary_hike from employees where e_id= new.e_id;
case 
when (new.rating=5) then salary_hike :=salary_hike*1.1;
when (new.rating=4) then salary_hike :=salary_hike*1.075;
when (new.rating=3) then salary_hike :=salary_hike*1.05;
when (new.rating=2) then salary_hike :=salary_hike*1.025;
else salary_hike :=salary_hike;
end case;
insert into salaryhistory (e_id, new_salary, change_effect_d) values(new.e_id,salary_hike,new.r_date);
return new;
end;
$$language plpgsql;

create trigger performance_review_salary_update
after insert on performancereview
for each row 
execute function performance_review_salary_update();
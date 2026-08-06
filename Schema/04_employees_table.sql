create table employees (
e_id int generated always as identity primary key,
e_name varchar(100) not null,
e_age int check(e_age>= 18),
e_salary numeric check(e_salary>0),
e_join_d date,
e_dept_id int not null references departments (d_id),
e_role_id int references roles (role_id),
e_m_id int references employees (e_id),
termination_date date,
e_status varchar(20) generated always as (
case when ( termination_date is not null)
then 'terminated'
else 'active'
end
) stored
);

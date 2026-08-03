create table employeeprojects (
e_id int not null references employees (e_id),
p_id int not null references projects (p_id),
project_role varchar(50),
time_worked int,
primary key (e_id, p_id)
);
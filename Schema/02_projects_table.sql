create table projects (
p_id int generated always as identity primary key,
p_name varchar(100),
p_d_id int not null references departments (d_id),
p_budget numeric check(p_budget>=0),
p_s_date date
);
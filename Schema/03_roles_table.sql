create table roles (
role_id int generated always as identity primary key,
role_title varchar(100) not null unique,
role_level varchar(50) not null,
min_salary numeric check(min_salary >= 0),
max_salary numeric check(max_salary  >= 0)
);
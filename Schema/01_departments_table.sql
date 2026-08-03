create table departments (
d_id int generated always as identity primary key,
d_name varchar(100) not null,
d_location varchar(100),
d_budget numeric
);
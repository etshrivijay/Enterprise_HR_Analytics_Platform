create table salaryhistory (
s_change_id int generated always as identity primary key,
e_id int not null references employees (e_id),
new_salary numeric not null,
change_effect_d date not null
);
create table performancereview (
r_id int  generated always as identity primary key,
e_id int not null references employees(e_id),
rating int not null check(rating between 1 and 5),
comments varchar(100),
r_date date default current_date, -- for testing i can use manual date but later it will be current date
);
create unique index idx_one_review_per_year on performancereview 
(e_id, (extract(year from r_date)));-- to follow business rule of one review per year
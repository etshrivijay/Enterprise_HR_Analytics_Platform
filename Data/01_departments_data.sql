truncate table departments restart identity cascade;

insert into departments (d_name, d_location, d_budget) 
values
('executive','chennai', 50000000),
('engineering','bangalore', 250000000),
('human resources','chennai', 12000000),
('finance','mumbai', 25000000),
('sales','delhi', 45000000),
('product','bangalore', 30000000),
('customer support','hyderabad', 18000000);
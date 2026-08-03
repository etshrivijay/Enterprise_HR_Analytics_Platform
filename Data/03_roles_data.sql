truncate table roles restart identity cascade;
--role rank 1 - executive
--role rank 2 management
--role rank 3 senior
--role rank 4 junior
--role rank 5 staff
insert into roles (role_title, role_level, min_salary, max_salary)
values
('chief executive officer', 'executive', 4000000.00, 6000000.00),
('vp of department', 'executive', 2000000.00, 3500000.00),
('engineering manager', 'management', 1400000.00, 2000000.00),
('product manager', 'management', 1200000.00, 1800000.00),
('senior developer', 'senior', 900000.00, 1500000.00),
('junior developer', 'junior', 400000.00, 750000.00),
('hr lead', 'senior', 900000.00, 1300000.00),
('hr associate', 'junior', 400000.00, 650000.00),
('finance lead', 'senior', 1000000.00, 1500000.00),
('sales executive', 'staff', 600000.00, 1000000.00),
('support specialist', 'staff', 400000.00, 700000.00);


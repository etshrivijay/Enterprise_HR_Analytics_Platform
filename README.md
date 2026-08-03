# Enterprise HR Analytics Platform

A PostgreSQL database schema designed for managing corporate HR data, organizational reporting hierarchies, project assignments, and historical compensation tracking.

## Entity Relationship Diagram
![Enterprise HR Analytics ERD](ERD.png)

## Execution Order
To avoid foreign key dependency errors, execute the SQL files in this exact order in pgAdmin or psql

1. `Schema/01_departments_table.sql`
2. `Schema/02_projects_table.sql`
3. `Schema/03_roles_table.sql`
4. `Schema/04_employees_table.sql`
5. `Schema/05_employeeprojects_table.sql`
6. `Schema/06_salaryhistory_table.sql`



-- Lesson 4: Relationships & JOIN

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Parent table
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Child table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(256) NOT NULL,
    salary NUMERIC(12, 2) NOT NULL CHECK (salary >= 0),
    department_id INT NOT NULL REFERENCES departments(id)
);

-- Insert departments
INSERT INTO departments (name)
VALUES
    ('IT'),
    ('HR'),
    ('Finance'),
    ('Marketing');

-- Insert employees
INSERT INTO employees (
    full_name,
    salary,
    department_id
)
VALUES
    ('Ahmed Saleban', 700, 1),
    ('Hodan Ali', 1200, 1),
    ('Maxamed Saleban', 500, 2),
    ('Muna Saleban', 1000, 3),
    ('Abdi Noor', 900, 3);

-- View departments
SELECT *
FROM departments;

-- View employees
SELECT *
FROM employees;

-- INNER JOIN
SELECT
    employees.full_name,
    departments.name AS department
FROM employees
INNER JOIN departments
    ON employees.department_id = departments.id;

-- JOIN + WHERE
SELECT
    employees.full_name,
    employees.salary,
    departments.name AS department
FROM employees
JOIN departments
    ON employees.department_id = departments.id
WHERE departments.name = 'IT';

-- LEFT JOIN
SELECT
    departments.name AS department,
    employees.full_name
FROM departments
LEFT JOIN employees
    ON employees.department_id = departments.id
ORDER BY departments.name;

-- Add another department with no employees
INSERT INTO departments (name)
VALUES ('Operations');

-- Run LEFT JOIN again
SELECT
    departments.name AS department,
    employees.full_name
FROM departments
LEFT JOIN employees
    ON employees.department_id = departments.id
ORDER BY departments.name;

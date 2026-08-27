-- Lesson 3: CRUD, ALTER TABLE & Constraints

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(256) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    department VARCHAR(256) NOT NULL,
    salary NUMERIC(12, 2) NOT NULL CHECK (salary >= 0)
);

-- INSERT
INSERT INTO employees (
    full_name,
    phone_number,
    department,
    salary
)
VALUES
    ('Ahmed Saleban', '252633306376', 'IT', 700),
    ('Maxamed Saleban', '252633306377', 'HR', 500),
    ('Muna Saleban', '252633306378', 'Business Management', 1000),
    ('Hodan Ali', '252633306379', 'IT', 1200),
    ('Abdi Noor', '252633306380', 'Finance', 900);

-- SELECT
SELECT * FROM employees;

SELECT id, full_name, department
FROM employees;

-- WHERE
SELECT *
FROM employees
WHERE department = 'IT';

SELECT *
FROM employees
WHERE salary > 700;

SELECT *
FROM employees
WHERE department != 'IT';

-- Multiple conditions
SELECT *
FROM employees
WHERE department = 'IT'
AND salary < 1000;

SELECT *
FROM employees
WHERE department = 'IT'
OR department = 'HR';

-- ORDER BY
SELECT *
FROM employees
ORDER BY salary ASC;

SELECT *
FROM employees
ORDER BY salary DESC;

-- LIMIT
SELECT *
FROM employees
LIMIT 2;

-- LIKE / ILIKE
SELECT *
FROM employees
WHERE full_name LIKE 'Ahmed%';

SELECT *
FROM employees
WHERE full_name ILIKE '%ahmed%';

-- UPDATE
UPDATE employees
SET salary = 800
WHERE id = 1;

-- DELETE
DELETE FROM employees
WHERE id = 3;

-- ALTER TABLE: add column
ALTER TABLE employees
ADD COLUMN is_active BOOLEAN DEFAULT FALSE;

-- Rename column
ALTER TABLE employees
RENAME COLUMN is_active TO active;

-- Change data type
ALTER TABLE employees
ALTER COLUMN salary TYPE NUMERIC(12, 2);

-- SELECT expression
SELECT
    full_name,
    department,
    salary AS monthly_salary,
    salary * 12 AS yearly_salary
FROM employees;

-- Transaction example
BEGIN;

UPDATE employees
SET salary = 1500
WHERE id = 1;

SELECT *
FROM employees
WHERE id = 1;

-- Undo the transaction
ROLLBACK;

-- To save a transaction, use COMMIT instead of ROLLBACK.

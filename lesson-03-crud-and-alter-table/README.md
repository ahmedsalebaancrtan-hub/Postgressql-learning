# Lesson 3 — CRUD, ALTER TABLE & Constraints

## 🎯 Learning Objectives

By the end of this lesson, you should be able to:

- Understand CRUD
- Use SELECT with WHERE
- Combine conditions with AND and OR
- Sort using ORDER BY
- Limit results
- Use LIKE and ILIKE
- Update records safely
- Delete records safely
- Modify table definitions with ALTER TABLE
- Use common PostgreSQL constraints
- Understand transactions

---

# Part 1 — CRUD

CRUD means:

```text
C → Create
R → Read
U → Update
D → Delete
```

---

## C — Create

Create data with `INSERT`.

```sql
INSERT INTO employees (
    full_name,
    phone_number,
    department,
    salary
)
VALUES (
    'Ahmed Saleban',
    '252633306376',
    'IT',
    700
);
```

---

## R — Read

Read data with `SELECT`.

```sql
SELECT *
FROM employees;
```

Select specific columns:

```sql
SELECT id, full_name, department
FROM employees;
```

---

## WHERE

Filter rows:

```sql
SELECT *
FROM employees
WHERE department = 'IT';
```

Comparison operators include:

```text
=       equal
!=      not equal
>       greater than
<       less than
>=      greater than or equal
<=      less than or equal
```

---

## Multiple Conditions

### AND

Both conditions must be true.

```sql
SELECT *
FROM employees
WHERE department = 'IT'
AND salary < 1000;
```

### OR

At least one condition must be true.

```sql
SELECT *
FROM employees
WHERE department = 'IT'
OR department = 'HR';
```

---

## ORDER BY

Ascending:

```sql
SELECT *
FROM employees
ORDER BY salary ASC;
```

Descending:

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

---

## LIMIT

Return only a specific number of rows:

```sql
SELECT *
FROM employees
LIMIT 2;
```

Do not write:

```sql
LIMIT = 2
```

---

## LIKE and ILIKE

`LIKE` performs pattern matching.

```sql
SELECT *
FROM employees
WHERE full_name LIKE 'Ahmed%';
```

`%` means zero or more characters.

`ILIKE` is PostgreSQL's case-insensitive version:

```sql
SELECT *
FROM employees
WHERE full_name ILIKE '%ahmed%';
```

---

# U — Update

Update an existing row:

```sql
UPDATE employees
SET salary = 800
WHERE id = 1;
```

### ⚠️ Important

This is dangerous:

```sql
UPDATE employees
SET salary = 800;
```

It updates every row because there is no `WHERE`.

---

# D — Delete

Delete one record:

```sql
DELETE FROM employees
WHERE id = 3;
```

This deletes all rows:

```sql
DELETE FROM employees;
```

Use it only when you intentionally want to remove every row.

---

# Part 2 — ALTER TABLE

`ALTER TABLE` changes the structure of an existing table.

## Add a Column

```sql
ALTER TABLE employees
ADD COLUMN is_active BOOLEAN DEFAULT FALSE;
```

## Rename a Column

```sql
ALTER TABLE employees
RENAME COLUMN is_active TO active;
```

## Change Data Type

```sql
ALTER TABLE employees
ALTER COLUMN salary TYPE NUMERIC(12, 2);
```

## Drop a Column

```sql
ALTER TABLE employees
DROP COLUMN active;
```

---

# Part 3 — Constraints

Constraints protect the quality and integrity of your data.

## PRIMARY KEY

Uniquely identifies a row.

```sql
id SERIAL PRIMARY KEY
```

## NOT NULL

A value must be provided.

```sql
full_name VARCHAR(256) NOT NULL
```

## UNIQUE

Prevents duplicate values.

```sql
email VARCHAR(256) UNIQUE
```

## CHECK

Requires a condition to be true.

```sql
salary NUMERIC CHECK (salary >= 0)
```

## DEFAULT

Provides a value automatically.

```sql
is_active BOOLEAN DEFAULT FALSE
```

## FOREIGN KEY

Connects one table to another.

```sql
department_id INT REFERENCES departments(id)
```

Foreign keys are explored in Lesson 4.

---

# Part 4 — Transactions

A transaction groups database operations.

Start:

```sql
BEGIN;
```

Make a change:

```sql
UPDATE employees
SET salary = 1200
WHERE id = 1;
```

Check:

```sql
SELECT *
FROM employees
WHERE id = 1;
```

Undo:

```sql
ROLLBACK;
```

Or permanently save:

```sql
COMMIT;
```

Basic flow:

```text
BEGIN
  ↓
SQL operations
  ↓
Check result
  ↓
COMMIT or ROLLBACK
```

---

# Part 5 — SELECT Expressions

You can calculate values while selecting data.

```sql
SELECT
    full_name,
    department,
    salary AS monthly_salary,
    salary * 12 AS yearly_salary
FROM employees;
```

`AS` creates a temporary display name called an alias.

---

# 💻 Practical Project

Build an `employees` table containing:

- ID
- Full name
- Phone number
- Department
- Salary
- Active status

Then:

1. Insert five employees.
2. Display all employees.
3. Find IT employees.
4. Find employees earning more than 700.
5. Sort by salary.
6. Return only two records.
7. Search names using `ILIKE`.
8. Update one employee.
9. Delete one employee.
10. Add a new column with `ALTER TABLE`.
11. Rename the new column.
12. Test a transaction using `ROLLBACK`.

See [`queries.sql`](./queries.sql) and [`../exercises/lesson-03.sql`](../exercises/lesson-03.sql).

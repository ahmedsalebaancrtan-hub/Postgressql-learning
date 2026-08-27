# Lesson 4 — Relationships & JOIN

## 🎯 Learning Objectives

By the end of this lesson, you should understand:

- Primary keys
- Foreign keys
- Why tables need relationships
- One-to-many relationships
- INNER JOIN
- LEFT JOIN
- Basic JOIN conditions

---

# 1. Why Relationships?

A database should avoid unnecessary duplication.

Imagine storing the department name in every employee row:

```text
Ahmed   IT
Hodan   IT
Abdi    IT
Muna    HR
```

If the department name changes, many rows may need to be updated.

Instead, create a separate `departments` table.

```text
departments
+----+-----------+
| id | name      |
+----+-----------+
| 1  | IT        |
| 2  | HR        |
| 3  | Finance   |
+----+-----------+
```

Then employees store the department ID:

```text
employees
+----+----------+---------------+
| id | name     | department_id |
+----+----------+---------------+
| 1  | Ahmed    | 1             |
| 2  | Muna     | 2             |
+----+----------+---------------+
```

---

# 2. Primary Key

A primary key uniquely identifies each row.

```sql
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);
```

Example:

```text
id = 1 → IT
id = 2 → HR
```

---

# 3. Foreign Key

A foreign key references a primary key in another table.

```sql
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(256) NOT NULL,
    department_id INT REFERENCES departments(id)
);
```

Here:

```text
departments.id
      ↑
      |
employees.department_id
```

The foreign key helps maintain referential integrity.

For example, an employee cannot normally reference a department ID that does not exist.

---

# 4. One-to-Many Relationship

One department can have many employees.

```text
Department
     |
     | 1
     |
     |--------< Many
                |
             Employees
```

Example:

```text
IT
├── Ahmed
├── Hodan
└── Abdi
```

This is called a **one-to-many relationship**.

---

# 5. INNER JOIN

`INNER JOIN` returns rows where the relationship exists in both tables.

```sql
SELECT
    employees.full_name,
    departments.name AS department
FROM employees
INNER JOIN departments
    ON employees.department_id = departments.id;
```

Result:

```text
full_name       department
--------------- ----------
Ahmed Saleban   IT
Muna Saleban    HR
```

---

# 6. LEFT JOIN

`LEFT JOIN` returns every row from the left table, even if there is no matching row in the right table.

```sql
SELECT
    departments.name AS department,
    employees.full_name
FROM departments
LEFT JOIN employees
    ON employees.department_id = departments.id;
```

This is useful when you want to see departments even if they have no employees.

---

# 7. JOIN with WHERE

You can combine JOIN and filtering.

```sql
SELECT
    employees.full_name,
    departments.name AS department
FROM employees
JOIN departments
    ON employees.department_id = departments.id
WHERE departments.name = 'IT';
```

---

# 💻 Practical Project

Create two tables:

```text
departments
employees
```

Requirements:

### departments

- `id`
- `name`

### employees

- `id`
- `full_name`
- `salary`
- `department_id`

Then:

1. Insert at least three departments.
2. Insert at least five employees.
3. Connect employees to departments.
4. Retrieve employees with their department names.
5. Retrieve only IT employees.
6. Use `LEFT JOIN` to display all departments.
7. Create a department with no employees and observe the `LEFT JOIN` result.

See [`queries.sql`](./queries.sql) and [`../exercises/lesson-04.sql`](../exercises/lesson-04.sql).

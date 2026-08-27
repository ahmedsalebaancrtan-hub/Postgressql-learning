# Lesson 2 — Database & Table Basics

## 🎯 Learning Objectives

By the end of this lesson, you should be able to:

- Create a PostgreSQL database
- Connect to a database
- Create a table
- Choose basic data types
- Insert one record
- Insert multiple records
- Retrieve all or selected columns

---

## 1. Create a Database

Syntax:

```sql
CREATE DATABASE database_name;
```

Example:

```sql
CREATE DATABASE registration_db;
```

After creating it in `psql`:

```text
\c registration_db
```

---

## 2. Create a Table

A table contains columns with names and data types.

Syntax:

```sql
CREATE TABLE table_name (
    column_name DATA_TYPE
);
```

Example:

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(256) NOT NULL,
    email VARCHAR(256) UNIQUE,
    age INT
);
```

---

## 3. Common Data Types

| Type           | Example          |
| -------------- | ---------------- |
| `INT`          | `25`             |
| `BIGINT`       | Large integer    |
| `VARCHAR(100)` | `'Ahmed'`        |
| `TEXT`         | Long text        |
| `BOOLEAN`      | `TRUE` / `FALSE` |
| `DATE`         | `'2026-08-27'`   |
| `TIMESTAMP`    | Date + time      |
| `NUMERIC`      | `1500.50`        |

For phone numbers, prefer `VARCHAR` rather than `NUMERIC` because phone numbers are identifiers, not quantities. This also preserves leading zeroes and symbols when necessary.

---

## 4. Insert One Record

```sql
INSERT INTO users (full_name, email, age)
VALUES ('Ahmed Saleban', 'ahmed@example.com', 22);
```

---

## 5. Insert Multiple Records

```sql
INSERT INTO users (full_name, email, age)
VALUES
    ('Ahmed Saleban', 'ahmed@example.com', 22),
    ('Maxamed Saleban', 'maxamed@example.com', 24),
    ('Muna Saleban', 'muna@example.com', 21);
```

---

## 6. Read Data

All columns:

```sql
SELECT *
FROM users;
```

Selected columns:

```sql
SELECT id, full_name, email
FROM users;
```

---

## 💻 Practical Project

Create a database called:

```text
registration_db
```

Then create:

```text
users
```

with:

- `id`
- `full_name`
- `email`
- `phone_number`
- `age`

Insert at least five users and retrieve them.

---

## 🧪 Practice

1. Create `school_db`.
2. Connect to it.
3. Create a `students` table.
4. Add at least five students.
5. Select all students.
6. Select only `full_name` and `email`.
7. Try adding a duplicate email and observe the constraint error.

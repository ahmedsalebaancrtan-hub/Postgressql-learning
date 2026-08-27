# Lesson 1 — Introduction to PostgreSQL

## 🎯 Learning Objectives

By the end of this lesson, you should understand:

- What a database is
- What a relational database is
- What PostgreSQL is
- What a table, row, and column are
- The difference between a database server and a database
- Basic PostgreSQL commands

---

## 1. What Is a Database?

A database is an organized collection of data that can be stored, searched, updated, and deleted.

For example, a school system may store:

```text
Students
Teachers
Classes
Subjects
Attendance
Grades
```

Instead of keeping this information in separate text files, a database stores it in a structured way.

---

## 2. What Is PostgreSQL?

PostgreSQL is an open-source relational database management system (RDBMS).

It uses SQL (Structured Query Language) to work with data.

Examples of tasks:

```sql
CREATE DATABASE school_db;
CREATE TABLE students (...);
INSERT INTO students (...);
SELECT * FROM students;
UPDATE students SET ...;
DELETE FROM students WHERE ...;
```

---

## 3. Relational Database

A relational database stores data in tables.

Example:

```text
students
+----+----------------+-----+
| id | full_name      | age |
+----+----------------+-----+
| 1  | Ahmed Saleban  | 22  |
| 2  | Muna Saleban   | 21  |
+----+----------------+-----+
```

Tables can also be related to other tables.

For example:

```text
students
    |
    | student_id
    v
student_courses
    |
    | course_id
    v
courses
```

Relationships are covered in Lesson 4.

---

## 4. Table, Row, and Column

### Table

A table stores a particular type of information.

Example:

```text
students
```

### Column

A column describes an attribute.

```text
id
full_name
email
age
```

### Row

A row represents one record.

```text
1 | Ahmed Saleban | ahmed@example.com | 22
```

---

## 5. SQL Categories

SQL commands are commonly grouped into categories.

### DDL — Data Definition Language

Used to define database structures.

```sql
CREATE
ALTER
DROP
```

### DML — Data Manipulation Language

Used to modify data.

```sql
INSERT
UPDATE
DELETE
```

### DQL — Data Query Language

Used to retrieve data.

```sql
SELECT
```

Transactions also use commands such as:

```sql
BEGIN;
COMMIT;
ROLLBACK;
```

---

## 6. Useful psql Commands

These commands are specific to the `psql` terminal.

List databases:

```text
\l
```

Connect to a database:

```text
\c database_name
```

List tables:

```text
\dt
```

Describe a table:

```text
\d table_name
```

Quit psql:

```text
\q
```

> `\l`, `\c`, and `\dt` are psql commands, not standard SQL.

---

## 💻 Practical

Open PostgreSQL and practice:

```sql
SELECT version();
```

Then inspect the current database:

```text
\conninfo
```

List databases:

```text
\l
```

Connect to a database:

```text
\c postgres
```

List tables:

```text
\dt
```

---

## 🧪 Practice Task

Complete these tasks without copying the answers from the lesson:

1. Connect to PostgreSQL.
2. Find your PostgreSQL version.
3. List all databases.
4. Connect to one database.
5. List its tables.
6. Explain the difference between a table, row, and column in your own words.

See [`../exercises/lesson-01.sql`](../exercises/lesson-01.sql).

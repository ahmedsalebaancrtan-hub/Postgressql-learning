-- Lesson 2: Database & Table Basics

-- Run this statement while connected to the postgres database
-- CREATE DATABASE registration_db;

-- In psql, connect to the database:
-- \c registration_db

-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(256) NOT NULL,
    email VARCHAR(256) UNIQUE,
    phone_number VARCHAR(20),
    age INT
);

-- Insert one record
INSERT INTO users (full_name, email, phone_number, age)
VALUES (
    'Ahmed Saleban',
    'ahmed@example.com',
    '252633306376',
    22
);

-- Insert multiple records
INSERT INTO users (full_name, email, phone_number, age)
VALUES
    ('Maxamed Saleban', 'maxamed@example.com', '252633306377', 24),
    ('Muna Saleban', 'muna@example.com', '252633306378', 21),
    ('Hodan Ali', 'hodan@example.com', '252633306379', 23),
    ('Abdi Noor', 'abdi@example.com', '252633306380', 25);

-- Read all data
SELECT *
FROM users;

-- Read selected columns
SELECT id, full_name, email
FROM users;

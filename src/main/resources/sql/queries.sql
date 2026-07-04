-- name: create_database
CREATE DATABASE IF NOT EXISTS student_manager;

-- name: use_database
USE student_manager;

-- name: create_students_table
CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

-- name: find_all_students
SELECT *
FROM students;

-- name: find_student_by_id
SELECT *
FROM students
WHERE id = ?;

-- name: insert_student
INSERT INTO students (firstname, lastname, age)
VALUES (?, ?, ?);

-- name: update_student
UPDATE students
SET firstname = ?,
    lastname = ?,
    age = ?
WHERE id = ?;

-- name: delete_student
DELETE FROM students
WHERE id = ?;
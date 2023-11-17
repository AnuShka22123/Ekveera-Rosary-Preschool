
CREATE DATABASE ekveera_rosary_preschool;

USE ekveera_rosary_preschool;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    parent_name VARCHAR(100),
    contact_number VARCHAR(15)
);

CREATE TABLE classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50) NOT NULL
);

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    qualification VARCHAR(100),
    contact_number VARCHAR(15)
);

CREATE TABLE registration (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    class_id INT,
    teacher_id INT,
    registration_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

INSERT INTO students (first_name, last_name, date_of_birth, parent_name, contact_number)
VALUES ('John', 'Doe', '2015-05-10', 'Mary Doe', '123-456-7890');

SELECT * FROM students;

UPDATE students
SET parent_name = 'Jane Doe'
WHERE student_id = 1;

DELETE FROM students
WHERE student_id = 1;


SELECT s.first_name, s.last_name, c.class_name, t.first_name AS teacher_first_name, t.last_name AS teacher_last_name
FROM registration r
JOIN students s ON r.student_id = s.student_id
JOIN classes c ON r.class_id = c.class_id
JOIN teachers t ON r.teacher_id = t.teacher_id;
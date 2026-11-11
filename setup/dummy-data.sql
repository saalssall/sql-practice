DROP TABLE IF EXISTS scores, students CASCADE;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name       TEXT NOT NULL,
    major      TEXT NOT NULL,
    age        INT NOT NULL
);

CREATE TABLE scores (
    score_id   INT PRIMARY KEY,
    student_id INT NOT NULL REFERENCES students(student_id),
    subject    TEXT NOT NULL,
    score      INT NOT NULL
);

INSERT INTO students VALUES
    (1, 'Ava',   'IT',      19),
    (2, 'Ben',   'IT',      21),
    (3, 'Chloe', 'Maths',   20),
    (4, 'Dan',   'Maths',   22),
    (5, 'Eva',   'Biology', 19),
    (6, 'Finn',  'IT',      23);

INSERT INTO scores VALUES
    (1, 1, 'SQL',     85),
    (2, 1, 'Python',  90),
    (3, 2, 'SQL',     70),
    (4, 2, 'Python',  65),
    (5, 3, 'SQL',     95),
    (6, 3, 'Python',  88),
    (7, 4, 'SQL',     60),
    (8, 5, 'Python',  78);
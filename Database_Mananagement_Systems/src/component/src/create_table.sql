CREATE TABLE students (
    id       SERIAL PRIMARY KEY,
    fullname VARCHAR(50) NOT NULL,
    age      INTEGER,
    stage    INTEGER
);
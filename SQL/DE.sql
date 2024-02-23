-- Create the pet_adoption database
CREATE DATABASE pet_adoption;

-- Use the pet_adoption database
USE pet_adoption;

-- Create the 'animals' table
CREATE TABLE animals (
    id VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    breed VARCHAR(255),
    color VARCHAR(255),
    gender VARCHAR(255),
    status INT
);
DROP TABLE animals;
-- Create the 'adoptions' table
CREATE TABLE adoptions (
    animal_id INT NOT NULL,
    name VARCHAR(255),
    contact VARCHAR(255),
    date TIMESTAMP
);



-- Insert dogs into the 'animals' table
INSERT INTO animals  VALUES
    ('89354034-20d9-4c3d-8195-3294bfd9dbc5', 'Bellyflop', 'Beagle', 'Brown', 'Male', 0),
    ('ae91cf1c-f972-42f3-8160-6c04d935699c', 'Snowy', 'Husky', 'White', 'Female', 0),
    ('37df3388-b0f4-4f0d-b6ef-0d840923a4d8', 'Princess', 'Pomeranian', 'Black', 'Female', 0),
    ('94545432-d27a-4ac8-ab7c-38270d7535f3', 'Cricket', 'Chihuahua', 'Brown', 'Male', 0),
    ('a1e7a7fc-b429-41ec-9924-8bb39dd397c8', 'Princess', 'Poodle', 'Purple', 'Female', 0),
    ('5138ed53-2ab2-400b-973c-91186f8c673d', 'Spot', 'Dalmation', 'Black and White', 'Male', 0);

SET SQL_SAFE_UPDATES = 0;

SHOW TABLES;
SHOW COLUMNS FROM animals;
SHOW COLUMNS FROM adoptions;

-- UPDATE
UPDATE animals SET color = 'Brown' WHERE id = 'a1e7a7fc-b429-41ec-9924-8bb39dd397c8';

-- DELETE 
DELETE FROM animals WHERE id = '89354034-20d9-4c3d-8195-3294bfd9dbc5';

-- Record the adoption 
UPDATE animals SET status = 1 WHERE id = '94545432-d27a-4ac8-ab7c-38270d7535f3';
INSERT INTO adoptions (animal_id, name, contact, date) VALUES
    ('94545432-d27a-4ac8-ab7c-38270d7535f3', 'Pinocchio', 'realboy@cockroachlabs.com', NOW());


SELECT * FROM animals;


SELECT * FROM animals
WHERE breed IN ('Husky','Pomeranian');

SELECT DISTINCT breed FROM animals;

SELECT * FROM animals
WHERE color = 'Brown' AND gender = 'Female';

SELECT * FROM animals
WHERE status BETWEEN 1 AND 3;
SELECT breed FROM animals;

SELECT * FROM animals
WHERE name LIKE 'P%';

SELECT name FROM animals WHERE gender = 'Female';


SELECT id FROM animals WHERE status = 0;


UPDATE animals SET status = 1 WHERE id = 'a1e7a7fc-b429-41ec-9924-8bb39dd397c8';
INSERT INTO adoptions (animal_id, name, contact, date) VALUES ('a1e7a7fc-b429-41ec-9924-8bb39dd397c8', 'Patalie', 'poodlequeen@cockroachlabs.com', NOW());
UPDATE animals SET status = 1 WHERE id = '5138ed53-2ab2-400b-973c-91186f8c673d';
INSERT INTO adoptions (animal_id, name, contact, date) VALUES ('5138ed53-2ab2-400b-973c-91186f8c673d', 'Ella', 'ellacrew@cockroachlabs.com', NOW());

SELECT * FROM adoptions;


SELECT * FROM adoptions ORDER BY date DESC;

SELECT * FROM animals WHERE status = 1;

-- ALTER TABLE 
ALTER TABLE animals ADD COLUMN species varchar(255);

UPDATE animals SET species = 'Dog';

SELECT * FROM animals;


INSERT INTO animals (id, name, species, breed, color, gender, status) VALUES ('11d6fa07-449f-4053-a7cb-ae4ec8570f3f', 'Meowmix', 'Cat', 'Munchkin', 'Yellow', 'Female', 0);
INSERT INTO animals (id, name, species, breed, color, gender, status) VALUES ('4e55860a-ec39-494b-845a-2e0a6496bf9b', 'Ash', 'Cat', 'Persian', 'Gray', 'Female', 0);
INSERT INTO animals (id, name, species, breed, color, gender, status) VALUES ('e80b92e5-98ed-458d-885d-b9e05d0d123e', 'Tiger', 'Cat', 'Bengal', 'Brown', 'Male', 0);

SELECT * FROM animals;



--
CREATE TABLE shelters (
id INTEGER,
 name VARCHAR(255),
 location VARCHAR(255)
 );


INSERT INTO shelters (id, name, location) VALUES (1, 'Animals 4 Homes', 'Red City');
ALTER TABLE animals ADD COLUMN shelter INTEGER;
UPDATE animals SET shelter = 1;

INSERT INTO shelters (id, name, location) VALUES (2, 'Adopt A Buddy', 'Green Town');
INSERT INTO shelters (id, name, location) VALUES (3, 'Fluffy Animals', 'Blue Hills');


INSERT INTO animals (id, name, shelter, species, breed, color, gender, status) VALUES ('ac1a773d-6912-45cc-b296-1b58d13dbd32', 'Snoops', 2, 'Dog', 'Beagle', 'Brown', 'Male', 0);
INSERT INTO animals (id, name, shelter, species, breed, color, gender, status) VALUES ('56e9be70-ed24-4949-bb54-70329c2caf82', 'Salt', 2, 'Cat', 'Turkish Angora', 'White', 'Female', 0);
INSERT INTO animals (id, name, shelter, species, breed, color, gender, status) VALUES ('b91df9f1-8e3d-4cce-a4ba-9d1a3ad6a12b', 'Fuzz', 3, 'Dog', 'Papillon', 'Gray', 'Male', 0);

-- 5
SELECT * FROM adoptions JOIN animals ON adoptions.animal_id = animals.id WHERE animals.shelter = 1;


CREATE TABLE dept (
    deptno INT,
    dname VARCHAR(14),
    loc VARCHAR(13)
);

CREATE VIEW salvu50 AS
    SELECT employee_id AS ID_NUMBER, last_name AS NAME, salary*12 AS ANN_SALARY
    FROM employees
    WHERE department_id = 50;

CREATE SEQUENCE dept_deptid_seq
    INCREMENT BY 10
    START WITH 120
    MAXVALUE 9999
    NOCACHE
    NOCYCLE;

SELECT sequence_name, min_value, max_value, increment_by, last_number
FROM user_sequences;

CREATE INDEX emp_last_name_idx
    ON employees(last_name);

CREATE SYNONYM d_sum FOR dept_sum_vu;

SELECT * FROM employee WHERE emp_city = 'Allahabad' AND emp_country = 'India';

SELECT * FROM employee WHERE emp_city IN ('Allahabad', 'Patna');

SELECT * FROM employee WHERE emp_city NOT LIKE 'A%';

SELECT * FROM employee WHERE emp_city = 'Varanasi' OR emp_country = 'India';

SELECT * FROM employee WHERE emp_city LIKE 'P%';

SELECT * FROM employee WHERE emp_id BETWEEN 101 AND 104;

SELECT * FROM employee WHERE emp_id = ALL (SELECT emp_id FROM employee WHERE emp_city = 'Varanasi');

SELECT * FROM employee WHERE emp_id = ANY (SELECT emp_id FROM employee WHERE emp_city = 'Varanasi');

SELECT emp_name FROM employee WHERE EXISTS (SELECT emp_id FROM employee WHERE emp_city = 'Patna');

SELECT * FROM employee WHERE emp_id < SOME (SELECT emp_id FROM employee WHERE emp_city = 'Patna');

SELECT DISTINCT NAME FROM student;

SELECT DISTINCT * FROM students;

SELECT DISTINCT ROLL_NO FROM students ORDER BY AGE;

SELECT COUNT(DISTINCT ROLL_NO) FROM students;

SELECT DISTINCT AGE FROM students;



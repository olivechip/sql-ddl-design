DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO doctors (name) 
VALUES ('Wang'), ('Smith');

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

INSERT INTO patients (first_name, last_name) 
VALUES ('Keanu', 'Reeves'), ('Ash', 'Ketchum'), ('Oliver', 'Chang');

CREATE TABLE dp_relationships (
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctors,
    patient_id INT REFERENCES patients
);

INSERT INTO dp_relationships (doctor_id, patient_id)
VALUES (1, 1), (1, 2), (2, 3);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL
);

INSERT INTO diseases (disease_name)
VALUES ('Depression'), ('Anxiety'), ('ADHD');

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients,
    disease_id INT REFERENCES diseases
);

INSERT INTO diagnosis (patient_id, disease_id)
VALUES (1, 1),(1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2);
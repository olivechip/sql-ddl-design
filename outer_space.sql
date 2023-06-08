-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO planets
  (name)
VALUES
  ('Earth'),
  ('Mars'),
  ('Venus'),
  ('Neptune'),
  ('Proxima Centauri b'),
  ('Gliese 876 b');

CREATE TABLE orbits_around (
  id SERIAL PRIMARY KEY,
  orbits_around TEXT NOT NULL
);

INSERT INTO orbits_around (orbits_around)
VALUES 
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

CREATE TABLE planet_orbits_around (
  id SERIAL PRIMARY KEY,
  planet_id INT REFERENCES planets,
  orbits_around_id INT REFERENCES orbits_around,
  orbital_period_in_years FLOAT NOT NULL
);

INSERT INTO planet_orbits_around (planet_id, orbits_around_id, orbital_period_in_years)
VALUES
  (1, 1, 1.00), (2, 1, 1.88), (3, 1, 0.62), (4, 1, 164.8), (5, 2, 0.03), (6, 3, 0.23);

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

INSERT INTO galaxies (galaxy_name)
VALUES ('Milky Way');

CREATE TABLE planet_galaxy (
  id SERIAL PRIMARY KEY,
  planet_id INT REFERENCES planets,
  galaxy_id INT REFERENCES galaxies
);

INSERT INTO planet_galaxy (planet_id, galaxy_id)
VALUES
  (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1);

CREATE TABLE moons (
   id SERIAL PRIMARY KEY,
   moon_name TEXT NOT NULL
);

INSERT INTO moons (moon_name)
VALUES 
  ('The Moon'), 
  ('Phobos'), 
  ('Deimos'), 
  ('Naiad'), 
  ('Thalassa'), 
  ('Despina'), 
  ('Galatea'), 
  ('Larissa'), 
  ('S/2004 N 1'), 
  ('Proteus'), 
  ('Triton'), 
  ('Nereid'), 
  ('Halimede'), 
  ('Sao'), 
  ('Laomedeia'), 
  ('Psamathe'), 
  ('Neso');

CREATE TABLE planet_moons (
  id SERIAL PRIMARY KEY,
  planet_id INT REFERENCES planets,
  moon_id INT REFERENCES moons
);

INSERT INTO planet_moons (planet_id, moon_id)
VALUES 
  (1, 1), 
  (2, 2), 
  (2, 3), 
  (3, NULL), 
  (4, 4), 
  (4, 5), 
  (4, 6), 
  (4, 7), 
  (4, 8), 
  (4, 9), 
  (4, 10), 
  (4, 11), 
  (4, 12), 
  (4, 13), 
  (4, 14),
  (4, 15),
  (4, 16),
  (4, 17),
  (5, NULL),
  (6, NULL);
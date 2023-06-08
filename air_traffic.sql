-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY, 
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

INSERT INTO passengers (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'), ('Sonja', 'Pauley'), ('Waneta', 'Skeleton'), ('Thadeus', 'Gathercoal'), 
  ('Berkie', 'Wycliff'), ('Alvin', 'Leathes'), ('Cory', 'Squibbes');

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY, 
  name TEXT NOT NULL
);

INSERT INTO airlines (name)
VALUES 
  ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), 
  ('Air China'), ('American Airlines'), ('Avianca Brasil');

CREATE TABLE locations (
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL,
  city TEXT NOT NULL
);

INSERT INTO locations (city, country)
VALUES
  ('Seattle', 'United States'), ('Washington DC', 'United States'), ('Tokyo', 'Japan'), 
  ('London', 'United Kingdom'), ('Los Angeles', 'United States'), ('Las Vegas', 'United States'), 
  ('Mexico City', 'Mexico'), ('Paris', 'France'), ('Casablanca', 'Morocco'), ('Dubai', 'UAE'), 
  ('Beijing', 'China'), ('New York', 'United States'), ('Charlotte', 'United States'), 
  ('Cedar Rapids', 'United States'), ('Chicago', 'United States'), ('New Orleans', 'United States'), 
  ('Sao Paolo', 'Brazil'), ('Santiago', 'Chile');

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger INT REFERENCES passengers,
  airline INT REFERENCES airlines,
  seat TEXT NOT NULL,
  departure_loc INT REFERENCES locations,
  arrival_loc INT REFERENCES locations,
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL
);

INSERT INTO tickets (passenger, airline, seat, departure_loc, arrival_loc, departure_time, arrival_time)
VALUES
  (1, 1, '33B', 2, 1, '2018-04-08 09:00:00', '2018-04-08 12:00:00'), 
  (4, 2, '8A', 3, 4, '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  (2, 3, '12F', 5, 6, '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  (1, 3, '20A', 1, 7, '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  (3, 4, '23D', 8, 9, '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  (4, 5, '18C', 10, 11, '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  (5, 1, '9E', 12, 13, '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  (5, 6, '32B', 13, 16, '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  (6, 6, '1A', 14, 15, '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  (7, 7, '10D', 17, 18, '2019-01-20 19:30:00', '2019-01-20 22:45:00');


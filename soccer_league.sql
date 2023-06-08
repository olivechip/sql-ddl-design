DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;
\c soccer_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(30) UNIQUE NOT NULL
);

INSERT INTO teams (team_name)
VALUES
    ('AFC Bournemouth'), ('Arsenal'), ('Aston Villa'), ('Manchester United'), ('Liverpool'), ('Crystal Palace');

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team INT REFERENCES teams
);

INSERT INTO players (first_name, last_name, team)
VALUES
    ('Emma', 'Wilson', 1),
    ('Liam', 'Smith', 1),
    ('Olivia', 'Johnson', 1),
    ('Noah', 'Brown', 1),
    ('Ava', 'Davis', 1),
    ('Isabella', 'Miller', 1),
    ('Sophia', 'Anderson', 1),
    ('Mia', 'Taylor', 1),
    ('Charlotte', 'Thomas', 1),
    ('Amelia', 'Martinez', 2),
    ('Harper', 'Clark', 2),
    ('Evelyn', 'Harris', 2),
    ('Abigail', 'Martin', 2),
    ('Emily', 'Jones', 2),
    ('Elizabeth', 'Jackson', 2),
    ('Michael', 'Williams', 2),
    ('Ethan', 'Wilson', 2),
    ('James', 'Davis', 3),
    ('Benjamin', 'Anderson', 3),
    ('Daniel', 'Moore', 3),
    ('Henry', 'Taylor', 3),
    ('Jacob', 'Brown', 3),
    ('Mason', 'Thomas', 3),
    ('William', 'Martinez', 3),
    ('Alexander', 'Garcia', 3),
    ('Sebastian', 'Lee', 4),
    ('Joseph', 'Lopez', 4),
    ('David', 'Gonzalez', 4),
    ('Samuel', 'Rodriguez', 4),
    ('Matthew', 'Perez', 4),
    ('Logan', 'Sanchez', 4),
    ('Lucas', 'Rivera', 4),
    ('Jackson', 'Hernandez', 4),
    ('Carter', 'Clark',5),
    ('John', 'Gomez',5),
    ('Owen', 'Campbell',5),
    ('Gabriel', 'Mendoza',5),
    ('Anthony', 'Ortiz',5),
    ('Dylan', 'Flores',5),
    ('Christopher', 'Torres',5),
    ('Andrew', 'Ramirez',5),
    ('Luke', 'Reyes', 6),
    ('Joshua', 'Valdez', 6),
    ('Isaac', 'Russell', 6),
    ('Ryan', 'Santiago', 6),
    ('Nathan', 'Vargas', 6),
    ('Samuel', 'Castillo', 6),
    ('Daniel', 'Wheeler', 6);
    
CREATE TABLE matches (
    match SERIAL PRIMARY KEY,
    first_team INT REFERENCES teams,
    second_team INT REFERENCES teams
);

INSERT INTO matches (first_team, second_team)
VALUES 
    (1, 2), (3, 4), (5, 6);

CREATE TABLE scored_goals (
    id SERIAL PRIMARY KEY,
    match_id INT REFERENCES matches,
    player_id INT REFERENCES players,
    scored_goals INT DEFAULT 0
);

INSERT INTO scored_goals (match_id, player_id)
VALUES
    (1, 2), (2, 4), (3, 1); 

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

INSERT INTO referees (first_name, last_name)
VALUES
    ('Nicolas', 'Lamolina'), ('Patricio', 'Loustau'), ('Alexander', 'King');

CREATE TABLE referee_games (
    id SERIAL PRIMARY KEY,
    ref_id INT REFERENCES referees,
    match_id INT REFERENCES matches
);

INSERT INTO referee_games (ref_id, match_id)
VALUES (1, 1), (2, 1), (3, 3), (1, 3), (2, 2), (3,2);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

INSERT INTO season(start_date, end_date)
VALUES ('2020-08-01', '2021-05-01'), ('2021-08-01', '2022-05-01'), ('2022-08-01', '2023-05-01');

CREATE TABLE rankings (
    id SERIAL PRIMARY KEY,
    ranking INT UNIQUE, 
    team_id INT UNIQUE NOT NULL REFERENCES teams
);

INSERT INTO rankings (ranking, team_id)
VALUES (1, 2), (2, 3), (4, 6), (5, 1), (3, 4), (6, 5);
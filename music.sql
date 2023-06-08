-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE artists_albums (
  id SERIAL PRIMARY KEY,
  artist_id INT REFERENCES artists,
  album_id INT REFERENCES albums
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers_albums (
  id SERIAL PRIMARY KEY,
  producer_id INT REFERENCES producers,
  album_id INT REFERENCES albums
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INT NOT NULL,
  album INT REFERENCES albums
);
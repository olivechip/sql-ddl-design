DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    state TEXT NOT NULL,
    city TEXT NOT NULL
);

INSERT INTO region (state, city)
VALUES 
    ('CA', 'Los Angeles'), ('CA', 'San Francisco'),
    ('WA', 'Seattle'), ('GA', 'Atlanta'), ('FL', 'Miami'),
    ('TX', 'Houston'), ('TX', 'Austin'), ('TX', 'Dallas'), ('NY', 'New York City');

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT,
    username VARCHAR(15) UNIQUE NOT NULL
);

INSERT INTO users (first_name, last_name, username)
VALUES
    ('Oliver', 'Chang', 'oliverstudent'),
    ('Bob', 'Smith', 'bobbyboi'),
    ('Karen', 'Smith', 'karengirl'),
    ('Taylor', 'Swift', 'taytay89'),
    ('Anabel', 'Zhang', 'ronlife'),
    ('Viviana', 'Andalon', 'therealviv');

CREATE TABLE region_preferences( 
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users,
    region_id INT REFERENCES region
);

INSERT INTO region_preferences (user_id, region_id)
VALUES
    (1, 1), (2, 6), (3, 6), (4, 8), (5, 3);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(15) UNIQUE NOT NULL
);

INSERT INTO categories (category_name)
VALUES
    ('Jobs'), ('Housing'), ('For Sale'), ('Events');

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    post_contents VARCHAR(200) NOT NULL,
    poster INT REFERENCES users,
    region INT REFERENCES region,
    category INT REFERENCES categories
);

INSERT INTO posts (title, post_contents, poster, region, category)
VALUES
    ('looking for entry level jobs', 'i need a job', 1, 1, 1),
    ('any fun events near me?', 'i want fun stuff to do', 2, 3, 4),
    ('selling this chair', '$10 or BO', 4, 8, 3);
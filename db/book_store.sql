DROP TABLE IF EXISTS publishers CASCADE;
DROP TABLE IF EXISTS authors CASCADE;
DROP TABLE IF EXISTS books CASCADE;

CREATE TABLE publishers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE books (
  id SERIAL,
  title VARCHAR(255),
  year INT,
  author_id INT REFERENCES authors(id) ON DELETE CASCADE,
  publisher_id INT REFERENCES publishers(id) ON DELETE CASCADE,
  genre VARCHAR(255)
);

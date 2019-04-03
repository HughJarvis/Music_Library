DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  genre VARCHAR,
  artist_id INT REFERENCES albums(id)
);

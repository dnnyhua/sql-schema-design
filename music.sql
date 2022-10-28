-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );


-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
  -- ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
  -- ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
  -- ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
  -- ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
  -- ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
  -- ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
  -- ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
  -- ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  -- ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
  -- ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');


CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  song_title TEXT NOT NULL,
  duration_in_seconds INT NOT NULL,
  release_date DATE NOT NULL,
  artists_id INT NOT NULL REFERENCES artists,
  album TEXT NOT NULL,
  producers_id INT NOT NULL REFERENCES producers
);


INSERT INTO artists
  (name)
VALUES
  ('{"Hanson"}'),
  ('{"Queen"}'),
  ('{"Mariah Cary", "Boyz II Men"}'),
  ('{"Lady Gaga", "Bradley Cooper"}'),
  ('{"Nickelback"}'),
  ('{"Jay Z", "Alicia Keys"}'),
  ('{"Katy Perry", "Juicy J"}'),
  ('{"Maroon 5", "Christina Aguilera"}'),
  ('{"Avril Lavigne"}'),
  ('{"Destiny''s Child"}');

INSERT INTO producers
  (name)
VALUES
  ('{"Dust Brothers", "Stephen Lironi"}'),
  ('{"Roy Thomas Baker"}'),
  ('{"Walter Afanasieff"}'),
  ('{"Benjamin Rice"}'),
  ('{"Rick Parashar"}'),
  ('{"Al Shux"}'),
  ('{"Max Martin", "Cirkut"}'),
  ('{"Shellback", "Benny Blanco"}'),
  ('{"The Matrix"}'),
  ('{"Darkchild"}');

INSERT INTO songs
  (song_title, duration_in_seconds, release_date, artists_id, album, producers_id)
VALUES  
  ('MMMBop', 238, '04-15-1997', 1, 'Middle of Nowhere', 1 ),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 'A Night at the Opera', 2 ),
  ('One Sweet Day', 282, '11-14-1995', 3, 'Daydream', 3 ),
  ('Shallow', 216, '09-27-2018', 4, 'A Star Is Born', 4 ),
  ('How You Remind Me', 223, '08-21-2001', 5, 'Silver Side Up', 5 ),
  ('New York State of Mind', 276, '10-20-2009', 6, 'The Blueprint 3', 6 ),
  ('Dark Horse', 215, '12-17-2013', 7, 'Prism', 7 ),
  ('Moves Like Jagger', 201, '06-21-2011', 8, 'Hands All Over', 8 ),
  ('Complicated', 244, '05-14-2002', 9, 'Let Go', 9 ),
  ('Say My Name', 240, '11-07-1999', 10, 'The Writing''s on the Wall', 10 );


-- Sample Queries
SELECT song_title, duration_in_seconds, artists.name, album, producers.name
FROM songs
JOIN artists ON songs.artists_id = artists.id
JOIN producers ON songs.producers_id = producers.id 
ORDER BY duration_in_seconds DESC







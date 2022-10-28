-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;
\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INT NOT NULL,
  moons TEXT[]
);

CREATE TABLE orbital_data
(
  id SERIAL PRIMARY KEY,
  planet_id INT NOT NULL,
  orbits_around TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL
);


CREATE TABLE galaxy
(    
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);


INSERT INTO planets
  (name, galaxy_id, moons)
VALUES
  ('Earth', 1, '{"The Moon"}'),
  ('Mars', 1, '{"Phobos", "Deimos"}'),
  ('Venus', 1, '{}'),
  ('Neptune', 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 1, '{}'),
  ('Gliese 876 b', 1, '{}');


INSERT INTO galaxy
  (name)
VALUES
  ('Milky Way');


INSERT INTO orbital_data (planet_id, orbits_around, orbital_period_in_years)
VALUES
  (1, 'The Sun', 1.00),
  (2, 'The Sun', 1.88),
  (3, 'The Sun', 0.62),
  (4, 'The Sun', 164.8),
  (5, 'Proxima Centauri', 0.03),
  (6, 'Gliese 876', 0.23);




-- CREATE TABLE moons
-- ( 
--   id SERIAL PRIMARY KEY,
--   name TEXT[],
--   planet_id INT NOT NULL REFERENCES planets,
-- );



-- INSERT INTO moons
--   (name, planet_id)
-- VALUES
--   ('{"The Moon"}', 1 ),
--   ('{"Phobos", "Deimos"}', 2 ),
--   ('{}', 3 ),
--   ('{"Naiad"}',  4 ),
--   ('{"Thalassa"}', 4 ),
--   ('{"Despina"}', 4 ),
--   ('{"Galatea"}', 4 ),
--   ('{"Larissa"}', 4 ),
--   ('{"S/2004 N 1"}', 4 ),
--   ('{"Proteus"}', 4 ),
--   ('{"Triton"}', 4 ),
--   ('{"Nereid"}', 4 ),
--   ('{"Halimede"}', 4 ),
--   ('{"Sao"}', 4 ),
--   ('{"Laomedeia"}', 4 ),
--   ('{"Psamathe"}', 4 ),
--   ('{"Neso"}', 4 ),
--   ('{}', 5 ),
--   ('{}', 6 );



-- Sample queries
SELECT planets.name AS planets, galaxy.name AS galaxy, orbital_period_in_years 
FROM planets
JOIN galaxy ON planets.galaxy_id = galaxy.id
JOIN orbital_data ON planets.id = orbital_data.planet_id
WHERE orbital_period_in_years >  1
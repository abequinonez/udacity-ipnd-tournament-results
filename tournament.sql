-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- For testing, drop the tournament database if it already exists
DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

-- Connect to the newly created tournament database
\c tournament

CREATE TABLE players (id SERIAL PRIMARY KEY, name TEXT);

CREATE TABLE matches (id SERIAL PRIMARY KEY, winner INTEGER REFERENCES players (id), 
	loser INTEGER REFERENCES players (id));

-- Get total_wins by first joining the players and matches tables, then count winner rows
CREATE VIEW total_wins AS SELECT players.id, players.name, COUNT(matches.id) as wins FROM players 
	LEFT JOIN matches ON players.id = matches.winner GROUP By players.id;

-- Get total_matches by first joining the players and matches tables, then count both winner and loser rows
CREATE VIEW total_matches AS SELECT players.id, COUNT(matches.id) AS matches FROM players 
	LEFT JOIN matches ON players.id = matches.winner OR players.id = matches.loser GROUP BY players.id;

-- Get standings by joining the total_wins and total_matches views
CREATE VIEW standings AS SELECT total_wins.*, total_matches.matches FROM total_wins, total_matches 
	WHERE total_wins.id = total_matches.id ORDER BY total_wins.wins DESC;


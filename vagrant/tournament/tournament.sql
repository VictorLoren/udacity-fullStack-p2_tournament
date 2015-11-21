-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Once registered into a tournament, player keeps the same ID
CREATE TABLE registeredPlayers (
    id SERIAL primary key,
    name TEXT
 );

-- Needed for multiple tournaments
CREATE TABLE tournaments (
    id SERIAL primary key,
    name TEXT
);

-- Possibly not needed; could be combined into "tournaments" table
CREATE TABLE playersInTournament (
    player INTEGER references registeredPlayers (id),
    tournament INTEGER references tournaments (id),
    primary key (player, tournament)
);

-- Could be determined programmatically
CREATE TABLE standings (
    player INTEGER references registeredPlayers (id),
    tournament INTEGER references tournaments (id),
    points INTEGER DEFAULT 0,
    standing INTEGER DEFAULT 0,
    primary key (player, tournament)
);

-- Same number of matches for each round
CREATE TABLE matches (
    tournamentId INTEGER references tournaments,
    roundNum INTEGER,
    matchNum INTEGER,
    winner INTEGER references registeredPlayers (id),
    loser INTEGER references registeredPlayers (id),
    primary key (tournamentId, roundNum, matchNum)
);

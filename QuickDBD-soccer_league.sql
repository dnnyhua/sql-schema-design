-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/7hwN2W
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "teams" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "ranking" int   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "players" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "goals" (
    "id" int   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "num_goals" int   NOT NULL,
    CONSTRAINT "pk_goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "referees" (
    "id" int   NOT NULL,
    "name" int   NOT NULL,
    "match_id" int   NOT NULL,
    CONSTRAINT "pk_referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "match" (
    "id" int   NOT NULL,
    "home_team_id" int   NOT NULL,
    "away_team_id" int   NOT NULL,
    "date" date   NOT NULL,
    "match_result(win/loss/draw)" text   NOT NULL,
    "referee_1_id" int   NOT NULL,
    "referee_2_id" int   NOT NULL,
    "referee_3_id" int   NOT NULL,
    "referee_4_id" int   NOT NULL,
    "season_id" int   NOT NULL,
    CONSTRAINT "pk_match" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "season" (
    "id" int   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_season" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "players" ADD CONSTRAINT "fk_players_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_match_id" FOREIGN KEY("match_id")
REFERENCES "match" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "teams" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "teams" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_referee_1_id" FOREIGN KEY("referee_1_id")
REFERENCES "referees" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_referee_2_id" FOREIGN KEY("referee_2_id")
REFERENCES "referees" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_referee_3_id" FOREIGN KEY("referee_3_id")
REFERENCES "referees" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_referee_4_id" FOREIGN KEY("referee_4_id")
REFERENCES "referees" ("id");

ALTER TABLE "season" ADD CONSTRAINT "fk_season_id" FOREIGN KEY("id")
REFERENCES "match" ("season_id");


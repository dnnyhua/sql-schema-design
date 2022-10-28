﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/7hwN2W
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Regions" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Users" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "email" text   NOT NULL,
    "preferred_region_id" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Posts" (
    "id" int   NOT NULL,
    "title" text   NOT NULL,
    "text" text   NOT NULL,
    "user_id" int   NOT NULL,
    "location" text   NOT NULL,
    "region_id" text   NOT NULL,
    "category_id" text   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Categories" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_user_id" FOREIGN KEY("user_id")
REFERENCES "Users" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_region_id" FOREIGN KEY("region_id")
REFERENCES "Regions" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_category_id" FOREIGN KEY("category_id")
REFERENCES "Categories" ("id");


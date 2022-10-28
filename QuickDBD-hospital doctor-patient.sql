-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/7hwN2W
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Doctor" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patient" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "date_of_birth" date   NOT NULL,
    "assigned_doctor_id" int   NOT NULL,
    "diagnoses_id" int   NOT NULL,
    CONSTRAINT "pk_Patient" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Illness_List" (
    "id" int   NOT NULL,
    "name" text   NOT NULL,
    "details" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Illness_List" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnoses" (
    "id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "illness_id" int   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Patient" ADD CONSTRAINT "fk_Patient_assigned_doctor_id" FOREIGN KEY("assigned_doctor_id")
REFERENCES "Doctor" ("id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_id_patient_id" FOREIGN KEY("id", "patient_id")
REFERENCES "Patient" ("diagnoses_id", "id");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_illness_id" FOREIGN KEY("illness_id")
REFERENCES "Illness_List" ("id");


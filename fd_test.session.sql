--delete table
DROP TABLE IF EXISTS "users";
--create table
CREATE TABLE "users"(
  "firstName" VARCHAR(32) NOT NULL CHECK("firstName" != ''),
  "lastName" VARCHAR(32) NOT NULL CHECK("lastName" != ''),
  "email" VARCHAR(56) NOT NULL CHECK("email" != '') UNIQUE,
  "isMale" BOOLEAN NOT NULL,
  "birthday" DATE NOT NULL CHECK("birthday" <= current_date),
  "height" NUMERIC(3, 2) NOT NULL CHECK(
    "height" > 0
    AND "height" < 2.30
  )
);
--insert data
INSERT INTO "users"
VALUES (
    'Eduard',
    'Tiutiunnyk',
    'ediktyutyunnik@gmail.com',
    true,
    '1996-05-27',
    1.76
  ),
  (
    'Ivan',
    'Sobol',
    'ivansobol@gmail.com',
    true,
    '1996-03-25',
    1.70
  ),
  (
    'Tim',
    'Pashkov',
    'timpashkov@gmail.com',
    true,
    '1997-08-23',
    1.74
  );
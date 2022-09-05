-- ADD new column for table users
ALTER TABLE "users"
ADD COLUMN "weight" INT NOT NULL DEFAULT 10 CHECK("weight" BETWEEN 10 AND 250);

-- Show table users
SELECT *
FROM "users"

-- DROP new column for table users
ALTER TABLE "users"
DROP COLUMN "weight"

-- UPDATE all users weight
UPDATE "users"
SET "weight" = "height" * 100 - 100

-- UPDATE weight users where id = 4
UPDATE "users"
SET "weight" = 50
WHERE "id" = 4

-- Установить вес 200 всем мужчинам у которых рост больше 2
UPDATE "users"
SET "weight" = 200
WHERE "height" > 2 AND "isMale" = true

-- Установить вес 40 всем женщинам у которых рост меньше 1.5
UPDATE "users"
SET "weight" = 40
WHERE "height" < 1.5 AND "isMale" = false

-- Delete user - id
DELETE FROM "users"
WHERE "id" = 83

-- Выбрать всех пользователей, у которых в имени 7 символов или родились 07.07
SELECT *
FROM "users"
WHERE length("firstName") = 7 OR (extract("month" from "birthday") = 7 AND extract("day" from "birthday") = 7)

--
SELECT *
  FROM (SELECT concat("firstName", ' ', "lastName") AS "fullName", length(concat("firstName", "lastName")) AS "length"
FROM "users") AS "lengthFullName"
WHERE "lengthFullName"."length" = 15

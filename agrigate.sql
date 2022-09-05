--min max
SELECT max("height")
FROM "users"

SELECT max("weight")
FROM "users"

SELECT min("height")
FROM "users"

SELECT min("weight")
FROM "users"

-- avg
SELECT avg("height")
FROM "users"

SELECT avg("weight")
FROM "users"

-- sum
SELECT sum("weight")
FROM "users"

-- count
SELECT count(*)
FROM "users"

----
SELECT sum("weight")
FROM "users"
WHERE "isMale" = true

-- Посчитать количество мужчик и женщин
SELECT count("isMale")
FROM "users"
GROUP BY ("isMale")

--средний рост мужчин и женщин
SELECT avg("height")
FROM "users"
GROUP BY ("isMale")

--количество людей которые родились 01.01
SELECT count(*)
FROM "users"
WHERE extract("month" from "birthday") = 1 AND extract("day" from "birthday") = 1
GROUP BY extract("month" from "birthday"), extract("day" from "birthday")

--
SELECT count(*), "firstName"
FROM "users"
WHERE "firstName" = 'Alex'
GROUP BY "firstName"

--
SELECT "firstName", sum("weight")
FROM "users"
WHERE "firstName" = 'Alex'
GROUP BY "firstName"

--
SELECT count(*), "isMale"
FROM "users"
WHERE "height" > 1.89 AND "isMale" = true
GROUP BY "isMale"

--
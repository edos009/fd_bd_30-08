-- 1 Вывести имя и фамилию пользователя с четным id
SELECT "id",
  "firstName",
  "lastName"
FROM "users"
WHERE "id" % 2 = 0

--2 Вывести имена всех мужчин
SELECT "firstName"
FROM "users"
WHERE "isMale" = true

--3 Вывести всю информацию о пользователях , которые больше 2м
SELECT *
FROM "users"
WHERE "height" > 2

--4 Вывести всю информацию о мужчинах , которые ростом 1.6м
SELECT *
FROM "users"
WHERE "isMale" = true AND "height" = 1.6

--5 Вывести всю информацию о Аlex, David, Sam
SELECT *
FROM "users"
WHERE "firstName" IN ('Alex', 'David', 'Sam')

--6 Вывести всю информацию о пользователей у которых рост от 1.6 - 2
SELECT *
FROM "users"
WHERE "height" > 1.6 AND "height" < 2

--7 Вывести всю информацию о пользователей у которых рост от 1.6 - 2 включительно
SELECT *
FROM "users"
WHERE "height" BETWEEN 1.6 AND 2

--8 Вывести почту, рост и пол всех женщин у которых рост от 1.6 до 1.7 включительно
SELECT "email", "height", "isMale"
FROM "users"
WHERE "isMale" = false AND "height" BETWEEN 1.6 AND 1.7

--9 Вывести почту, день рождение и имя всех у кого имена: (Dennis, Ava, Eva, Lucas)
SELECT "firstName", "email", "birthday"
FROM "users"
WHERE "firstName" IN ('Dennis', 'Ava', 'Eva', 'Lucas')

--10 Вывести всю инормацию о пользователях младше 30 лет
SELECT *, age("birthday")
FROM "users"
WHERE age("birthday") < make_interval(30)

--11 Вывести всю информацию о мужчинах от 20 до 30 включительно, с ростом 1.76
SELECT *
FROM "users"
WHERE "isMale" = true AND age("birthday") BETWEEN make_interval(20) AND make_interval(30) AND "height" = 1.76

--12 Вывести всю информацию о пользователях, которые родились в 2000 году
SELECT *
FROM "users"
WHERE extract("year" from "birthday") = 2000

--13 Вывести всю информацию о пользователях, которым 38 лет
SELECT *
FROM "users"
WHERE extract("year" from age("birthday")) = 38

--14 Вывести всю информацию о пользователях, которым родились в мае
SELECT *
FROM "users"
WHERE extract("month" from "birthday") = 5

--15 Вывести всю информацию о пользователях, которые старше 40 и день рождение 13 числв
SELECT *
FROM "users"
WHERE extract("year" from age("birthday")) > 40 AND extract("day" from "birthday") = 13

--16 Вывести всю информацию о первых 10 пользователях
SELECT *
FROM "users"
LIMIT 10
OFFSET 0

--17 Вывести всю информацию о втором 10-ке пользователях
SELECT *
FROM "users"
LIMIT 10
OFFSET 10

--18 Вывести полное имя пользователей в одной строке
SELECT "firstName" || ' ' || "lastName" AS "fullName"
FROM "users"

--19 Вывести полное имя пользователей в одной строке
SELECT concat("firstName", ' ',"lastName") AS "fullName"
FROM "users"

--20 Вывести всю информацию о пользователях, у которых в почте 15 символов
SELECT *
FROM "users"
WHERE length("email") = 15

--21 Вывести всю информацию о пользователях, у которых в почте 15 символов
SELECT concat("firstName", ' ',"lastName") AS "fullName"
FROM "users"
WHERE length(concat("firstName",' ',"lastName")) <= 12

--22 Вывести всю информацию о пользователях, у которых в почте 15 символов
SELECT *
FROM (SELECT concat("firstName", ' ',"lastName") AS "fullName"
FROM "users") AS "fn"
WHERE length("fn"."fullName") <= 12

--23 Вывести колонки Имя, Почта и Полный возраст только женщин с возрастом от 28 до 30 включительно
SELECT "firstName" AS "Имя", "email" AS "Почта", extract("year" from age("birthday")) AS "Полный возраст"
FROM "users"
WHERE "isMale" = false AND extract("year" from age("birthday")) BETWEEN 28 AND 30

--24 Вывести колонки Полное имя, Дата рождения и Рост и вывести всех кто родился летом, с ростом не менее 1.6
SELECT concat("firstName", ' ', "lastName") AS "Полное имя", "birthday" AS "Дата рождения", "height" AS "Рост"
FROM "users"
WHERE extract("month" from "birthday") IN (6,7,8) AND "height" >= 1.6







-- SELECT "email",
  --   "isMale",
  --   "height"
  -- FROM "users"
  -- WHERE "isMale" = false
  --   AND "height" BETWEEN 1.7 AND 1.8
  -- SELECT "firstName",
  --   "email",
  --   "birthday"
  -- FROM "users"
  -- WHERE "firstName" IN ('Dennis', 'Ava', 'Eva', 'Lucas')
  -- SELECT *
  -- FROM "users"
  -- WHERE "isMale" = true
  --   AND age("birthday") BETWEEN make_interval(20) AND make_interval(25)
  --   AND "height" = 1.88
  -- SELECT *
  -- FROM "users"
  -- WHERE extract(
  --     "years"
  --     from "birthday"
  --   ) = 2000
  -- SELECT *
  -- FROM "users"
  -- WHERE extract("month" from "birthday") = 5
  -- SELECT *
  -- FROM "users"
-- WHERE extract(
--     "year"
--     from age("birthday")
--   ) > 40
--   AND extract(
--     "days"
--     from "birthday"
--   ) = 13
   -- SELECT *
  -- FROM "users"
  -- LIMIT 5
  -- OFFSET 0
  -- SELECT *
  -- FROM (SELECT concat("firstName", ' ', "lastName") AS "fullName"
  -- FROM "users") AS "fn"
  -- WHERE length("fn"."fullName") <= 7
  -- SELECT * 
  -- FROM (
  --   SELECT "email" AS "Почта", extract("years" from age("birthday")) AS "Полный возраст", "isMale" AS "Пол"
  --   FROM "users"
  -- ) AS "tb"
  -- WHERE "tb"."Пол" = false AND ("tb"."Полный возраст") BETWEEN 28 AND 30
--delete table
DROP TABLE IF EXISTS "products";
--create table
CREATE TABLE "products"(
  "name" VARCHAR(32) NOT NULL UNIQUE CHECK("name" != ''),
  "price" NUMERIC(5, 2) NOT NULL CHECK("price" >= 0),
  "currency" VARCHAR(32) NOT NULL CHECK("currency" != ''),
  "productionDate" DATE NOT NULL CHECK("productionDate" <= current_date),
  "amount" INTEGER CHECK(
    "amount" >= 0
    AND "amount" <= 1000
  ),
  "helfLife" VARCHAR(32)
);
--insert data
INSERT INTO "products"
VALUES (
    'Milk',
    30.50,
    'ua',
    '2022-08-28',
    5,
    'one week'
  ),
  (
    'Chocolade',
    25.75,
    'ua',
    '2022-06-20',
    1,
    'three month'
  ),
  (
    'Solt',
    15.65,
    'ua',
    '2021-08-28',
    1,
    'three years'
  ),
  (
    'Bread',
    22.55,
    'ua',
    '2022-08-25',
    2,
    'five days'
  ),
  (
    'Chesse',
    33.00,
    'ua',
    '2022-08-10',
    1,
    'two week'
  );
  
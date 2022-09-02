DROP TABLE IF EXISTS "produts_in_order";
DROP TABLE IF EXISTS "orders";
DROP TABLE IF EXISTS "users";
DROP TABLE IF EXISTS "producs";
CREATE TABLE "users"(
  "id" SERIAL PRIMARY KEY,
  "firstName" VARCHAR(64) NOT NULL CHECK ("firstName" != ''),
  "lastName" VARCHAR(64) NOT NULL CHECK ("lastName" != ''),
  "email" VARCHAR(128) NOT NULL CHECK ("email" != '') CONSTRAINT "uniqueEmail" UNIQUE,
  "isMale" BOOLEAN NOT NULL,
  "birthday" DATE NOT NULL CHECK ("birthday" <= current_date)
);
INSERT INTO "users"(
    "firstName",
    "lastName",
    "email",
    "isMale",
    "birthday"
  )
VALUES (
    'Ed',
    'Tiutiunnik',
    'ed@gmail.com',
    true,
    '1996-05-27'
  ),
  (
    'Ivan',
    'Sobol',
    'ivan@gmail.com',
    true,
    '1996-03-25'
  ),
  (
    'Valeria',
    'Pashkova',
    'lera@gmail.com',
    false,
    '1997-09-25'
  ),
  (
    'Tim',
    'Pashkova',
    'tim@gmail.com',
    true,
    '1997-08-23'
  );
CREATE TABLE "products"(
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(64) NOT NULL CHECK ("name" != ''),
  "price" NUMERIC(5, 2) NOT NULL CHECK ("price" > 0),
  "amount" INTEGER NOT NULL CHECK (
    "amount" >= 0
    AND "amount" <= 1000
  )
);
INSERT INTO "products"("name", "price", "amount")
VALUES ('Milk', 40, 100),
  ('Cheese', 77, 30),
  ('Bread', 22.50, 50),
  ('Cookie', 18, 120),
  ('Gum', 9.90, 35),
  ('Bag', 2.10, 200);
CREATE TABLE "orders"(
  "id" BIGSERIAL PRIMARY KEY,
  "userId" INT REFERENCES "users"("id"),
  "createdAt" TIMESTAMP NOT NULL CHECK("createdAt" <= current_date) DEFAULT current_date
);
INSERT INTO "orders"("userId")
VALUES (1),
  (2),
  (4),
  (1),
  (3);
CREATE TABLE "produts_in_order"(
  "orderId" INT REFERENCES "orders"("id"),
  "productId" INT REFERENCES "products"("id"),
  "amount" INT CHECK ("amount" > 0),
  PRIMARY KEY ("orderId", "productId")
)
INSERT INTO "produts_in_order"("orderId", "productId", "amount")
VALUES (1, 1, 2),
  (1, 3, 1),
  (1, 4, 2),
  (2, 3, 3),
  (3, 5, 1),
  (4, 6, 1),
  (5, 2, 2),
  (5, 3, 1),
  (5, 4, 2),
  (5, 6, 1);
DROP TABLE IF EXISTS "a";
CREATE TABLE "a"(
  "b" INTEGER,
  "c" INTEGER,
  CONSTRAINT unique_couple UNIQUE("b", "c")
);

INSERT INTO "a"
VALUES (1,1), (3,1), (2,1), (2,2)
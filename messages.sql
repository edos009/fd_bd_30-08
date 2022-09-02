DROP TABLE IF EXISTS "messages";
CREATE TABLE "messages"(
  "id" SERIAL PRIMARY KEY,
  "body" VARCHAR(2048) NOT NULL CHECK("body" != ''),
  "auther" VARCHAR(256) NOT NULL CHECK("auther" != '') DEFAULT 'Anonim',
  "isReady" BOOLEAN NOT NULL DEFAULT FALSE,
  "createdAt" TIMESTAMP NOT NULL CHECK("createdAt" <= current_timestamp) DEFAULT current_timestamp
);
INSERT INTO "messages"("body", "auther")
VALUES('Hello guys!', 'Eduard');
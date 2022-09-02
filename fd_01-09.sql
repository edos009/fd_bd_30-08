DROP TABLE IF EXISTS "messages";
DROP TABLE IF EXISTS "users_to_chats";
DROP TABLE IF EXISTS "chats";

CREATE TABLE "chats"(
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(128) NOT NULL CHECK("name" != ''),
  "ownerID" INT REFERENCES "users"("id"),
  "createdAt" TIMESTAMP NOT NULL DEFAULT current_timestamp
)
INSERT INTO "chats"("name", "ownerID")
VALUES('js', 2),('html', 1),('css', 1);

CREATE TABLE "users_to_chats"(
  "userId" INT REFERENCES "users"("id"),
  "chatId" BIGINT REFERENCES "chats"("id"),
  PRIMARY KEY("userId", "chatId")
);
INSERT INTO "users_to_chats"("userId", "chatId")
VALUES(1, 1),(2, 1),(1, 2),(2, 3);

CREATE TABLE "messages"(
  "id" BIGSERIAL PRIMARY KEY,
  "body" VARCHAR(512) NOT NULL CHECK("body" != ''),
  "userId" INT ,
  "chatId" BIGINT ,
  FOREIGN KEY ("userId", "chatId") REFERENCES "users_to_chats"("userId", "chatId")
);
INSERT INTO "messages"("body", "userId", "chatId")
VALUES('Hello', 1, 1),('Hi', 2, 1),('Yes, I am first!', 1, 2),('Yes, I am first!', 2, 3);

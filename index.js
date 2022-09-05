const { Client } = require("pg");
const axios = require("axios");

const http = axios.create({
  baseURL: "https://randomuser.me/api/",
});
const loadUser = async () => {
  const {
    data: { results },
  } = await http.get("?results=100&nat=gb&seed=bca&page=5");
  return results;
};

const config = {
  user: "postgres",
  password: "postgres",
  host: "localhost",
  database: "fd_test",
  port: 5432,
};

const mapUsers = (users) => {
  return users
    .map(
      ({ name: { first, last }, email, gender, dob: { date } }) => `(
    '${first}',
    '${last}',
    '${email}',
    '${gender === "male"}',
    '${date}',
    '${(Math.random() + 1.3).toFixed(2)}'
  )`
    )
    .join(",");
};

const client = new Client(config);

const start = async () => {
  await client.connect();
  const res = await client.query(`INSERT INTO "users"(
    "firstName",
    "lastName",
    "email",
    "isMale",
    "birthday",
    "height"
  )
VALUES ${mapUsers(await loadUser())}`);
  await client.end();
};

start();

const { Client } = require("pg");
const axios = require("axios");

const http = axios.create({
  baseURL: "https://randomuser.me/api/",
});
const loadUser = async () => {
  const {data: {results}} = await http.get('?results=100&nat=gb&seed=abc&page=3');
  return results;
}

const config = {
  user: "postgres",
  password: "postgres",
  host: "localhost",
  database: "fd_test",
  port: 5432,
};

const apUsers = (users) => {
  return users
    .map(
      ({ name: { first, last }, email, gender, dob: { date } }) => `(
    '${first}',
    '${last}',
    '${email}',
    '${gender === "male"}',
    '${date}'
  )`
    )
    .join(",");
}

const client = new Client(config);

const start = async () => {
  await client.connect();
  const res = await client.query(`INSERT INTO "users"(
    "firstName",
    "lastName",
    "email",
    "isMale",
    "birthday"
  )
VALUES ${apUsers(await loadUser())}`);
  await client.end();
};

start();

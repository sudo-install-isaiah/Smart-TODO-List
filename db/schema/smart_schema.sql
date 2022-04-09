DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS categories CASCADE;
CREATE TABLE categories (
id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(255) NOT NULL
);


DROP TABLE IF EXISTS tasks CASCADE;
CREATE TABLE tasks (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE;
  category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE;
  name VARCHAR(255) NOT NULL,
  is_completed BOOLEAN NOT NULL DEFAULT FALSE,
  priority SMALLINT NOT NULL DEFAULT 0,
  description TEXT
  start_date DATE,
  end_date DATE
);

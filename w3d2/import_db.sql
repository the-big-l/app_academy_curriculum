DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE if exists questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE if EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE if EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

DROP TABLE if EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Leo', 'Salat'),
  ('Ryley', 'Sill');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('What''s atom?', 'See title...', 1),
  ('What''s the meaning of life?', 'I heard the answer was 42 but I''m not too sure', 2),
  ('how are you?', 'i''m fine', 2);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Leo' AND lname = 'Salat'), 1),
  ((SELECT id FROM users WHERE fname = 'Ryley' AND lname = 'Sill'), 2);

INSERT INTO
  replies (body, question_id, parent_id, user_id)
VALUES
  ('google it', 1, NULL, 2),
  ('bing it', 2, NULL, 1),
  ('that doesn''t help', 1, 1, 1);

INSERT INTO
    question_likes (user_id, question_id)
VALUES
  (1, 2),
  (2, 1),
  (1, 3),
  (1, 3),
  (1, 3),
  (2, 3),
  (2,3);

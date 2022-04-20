-- Creates a user database table:

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  hobbies TEXT,
  active BOOLEAN NOT NULL DEFAULT 1
);

INSERT INTO user (
  first_name,
  last_name,
  hobbies
) VALUES (
  "Mark",
  "Omer",
  "art"
);

INSERT INTO user (
  first_name,
  last_name,
  hobbies
) VALUES (
  "Todd",
  "Smith",
  "baseball"
);

INSERT INTO user (
  first_name,
  last_name,
  hobbies
) VALUES (
  "Jane",
  "Doe",
  "bouldering"
);


--
-- with 'last_naem' as last names:
"""
CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  hobbies TEXT,
  active BOOLEAN NOT NULL DEFAULT 1
);

INSERT INTO user (
  first_name,
  last_naem,
  hobbies
) VALUES (
  "Mark",
  "Omer",
  "art"
);

INSERT INTO user (
  first_name,
  last_naem,
  hobbies
) VALUES (
  "Todd",
  "Smith",
  "baseball"
);

INSERT INTO user (
  first_name,
  last_naem,
  hobbies
) VALUES (
  "Jane",
  "Doe",
  "bouldering"
);

"""
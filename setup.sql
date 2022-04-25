-- Creates a user database table:

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  hobbies TEXT,
  active BOOLEAN NOT NULL DEFAULT 1
);


-- Creates a vehicle-type table

CREATE TABLE vehicle_type (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  description VARCHAR(64)
);

-- Creates a vehicle table:

CREATE TABLE vehicle (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  color VARCHAR(45) NOT NULL,
  license_plate VARCHAR(45) NOT NULL,
  v_type INTEGER NOT NULL,
  owner_id INTEGER NOT NULL,
  activate BOOLEAN DEFAULT 1,
  FOREIGN KEY (v_type) REFERENCES vehicle_type(id),
  FOREIGN KEY (owner_id) REFERENCES user(id)
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

-- Create some dummy data for vehicle types:

INSERT INTO vehicle_type (description) VALUES ("Car");
INSERT INTO vehicle_type (description) VALUES ("Truck");
INSERT INTO vehicle_type (description) VALUES ("SUV");
INSERT INTO vehicle_type (description) VALUES ("Motorcycle");
INSERT INTO vehicle_type (description) VALUES ("Bicycle");



-- Join two tables: user and vehicle:

SELECT  user.last_name,
        user.first_name,
        user.hobbies,
        user.active,
        vehicle.license_plate,
        vehicle.color,
        vehicle.v_type AS vehicle_type
FROM user INNER JOIN vehicle
ON user.id = vehicle.owner_id;


-- Join three tables: uer, vehicle and vehicle_type:

SELECT  user.last_name,
        user.first_name,
        user.hobbies,
        user.active,
        vehicle.license_plate,
        vehicle.color,
        vehicle_type.description
FROM user
INNER JOIN vehicle ON user.id = vehicle.owner_id
INNER JOIN vehicle_type ON vehicle.v_type = vehicle_type.id;




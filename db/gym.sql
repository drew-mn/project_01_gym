DROP TABLE bookings;
DROP TABLE members;
DROP TABLE gym_classes;



CREATE TABLE members (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE gym_classes (
  id SERIAL4 PRIMARY KEY,
  class_name VARCHAR(255),
  class_description VARCHAR(255),
  class_time VARCHAR(255),
  class_instructor VARCHAR(255),
  class_spaces INT4
);

CREATE TABLE bookings (
  id SERIAL8 PRIMARY KEY,
  members_id INT8 REFERENCES members(id) ON DELETE CASCADE,
  gym_classes_id INT8 REFERENCES gym_classes(id) ON DELETE CASCADE
);

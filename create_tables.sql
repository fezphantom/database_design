CREATE TABLE donor (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15),
    address VARCHAR(100),
    email VARCHAR(50)
);

CREATE TABLE location (
    id INTEGER PRIMARY KEY,
    location_label VARCHAR(50),
    room VARCHAR(50),
    section VARCHAR(50),
    climate_controlled BOOLEAN,
    note TEXT
);

CREATE TABLE artifact(
    id INTEGER PRIMARY KEY,
    name VARCHAR(20),
    description VARCHAR(50),
    date_estimated DATE,
    material VARCHAR(20),
    condition VARCHAR(10),
    donor_id INTEGER REFERENCES donor(id),
    location_id INTEGER REFERENCES location(id)
);

CREATE TABLE exhibition(
    id INTEGER PRIMARY KEY,
    title VARCHAR(50),
    start_date DATE,
    end_date DATE
);

CREATE TABLE artifact_exhibition(
    artifact_id INTEGER REFERENCES artifact(id),
    exhibition_id INTEGER REFERENCES exhibition(id),
    PRIMARY KEY (artifact_id, exhibition_id)

);

SELECT
  constraint_name, column_name, table_name
FROM
  information_schema.key_column_usage
WHERE 
  table_name = 'artifact_exhibition';
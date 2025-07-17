-- SCHEMA: museum
CREATE SCHEMA IF NOT EXISTS museum;
SET search_path TO museum;

-- Donor table
CREATE TABLE donor (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(100),
    email VARCHAR(50) NOT NULL
);

-- Location table
CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    location_label VARCHAR(50) NOT NULL,
    room VARCHAR(50) NOT NULL,
    section VARCHAR(50),
    climate_controlled BOOLEAN NOT NULL DEFAULT FALSE,
    note TEXT
);

-- Artifact table
CREATE TABLE artifact (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(50) NOT NULL,
    date_estimated DATE,
    material VARCHAR(20),
    condition VARCHAR(10),
    donor_id INTEGER REFERENCES donor(id) ON DELETE SET NULL,
    location_id INTEGER REFERENCES location(id) ON DELETE SET NULL
);

-- Exhibition table
CREATE TABLE exhibition (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);

-- Many-to-many relationship between artifacts and exhibitions
CREATE TABLE artifact_exhibition (
    artifact_id INTEGER REFERENCES artifact(id) ON DELETE CASCADE,
    exhibition_id INTEGER REFERENCES exhibition(id) ON DELETE CASCADE,
    PRIMARY KEY (artifact_id, exhibition_id)
);


SELECT
  constraint_name, column_name, table_name
FROM
  information_schema.key_column_usage
WHERE 
  table_name = 'artifact_exhibition';
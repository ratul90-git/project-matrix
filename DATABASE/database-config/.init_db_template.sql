-- Create the schema (if it doesn't exist)
CREATE SCHEMA IF NOT EXISTS ${SCHEMA_NAME} AUTHORIZATION ${POSTGRES_USER};

-- Set the search path (so subsequent commands operate on the correct schema)
ALTER DATABASE ${POSTGRES_DB} SET search_path TO ${SCHEMA_NAME}, public;

-- Required DDLs
CREATE TABLE IF NOT EXISTS ${SCHEMA_NAME}.USER_DETAILS (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) UNIQUE NOT NULL
);

-- Insert initial data
INSERT INTO ${SCHEMA_NAME}.USER_DETAILS (NAME, EMAIL) VALUES ('Ratul', 'ratul12345@domain.com');
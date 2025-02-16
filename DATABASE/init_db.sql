-- Create the schema (if it doesn't exist)
CREATE SCHEMA IF NOT EXISTS matrix_schema AUTHORIZATION dreamer;

-- Set the search path (so subsequent commands operate on the correct schema)
ALTER DATABASE matrix_db SET search_path TO matrix_schema, public;

-- Required DDLs
CREATE TABLE IF NOT EXISTS matrix_schema.USER_DETAILS (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) UNIQUE NOT NULL
);

-- Insert initial data
INSERT INTO matrix_schema.USER_DETAILS (NAME, EMAIL) VALUES ('Ratul', 'ratul12345@domain.com');
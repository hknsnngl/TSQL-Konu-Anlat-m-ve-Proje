/* UNIQUE */

-- Tabloda Unique tan�mlama
CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);

-- Sornadan Unique tan�mlama  
ALTER TABLE Persons ADD UNIQUE (ID);
ALTER TABLE Persons ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);

-- Tablodan Unique silme
ALTER TABLE Persons DROP CONSTRAINT UC_Person;
/* CHECK*/

-- Tabloda Check tanýmlama
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
);
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

-- Sonradan Check Tanýmlama
ALTER TABLE Persons ADD CHECK (Age>=18);
ALTER TABLE Persons ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');

-- Check Silme
ALTER TABLE Persons DROP CONSTRAINT CHK_PersonAge;
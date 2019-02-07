/* DEFAULT */

-- Tabloda Default tanýmlama
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);
CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
);

--Sonradan Default tanýmlama
ALTER TABLE Persons ADD CONSTRAINT df_City  DEFAULT 'Sandnes' FOR City;

--Default silme
ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;
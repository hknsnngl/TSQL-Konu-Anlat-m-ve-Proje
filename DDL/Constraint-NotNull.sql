/* NOT NULL */

-- Tabloda Not Null tan�mlama
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

-- Sornadan Not Null tan�mlama  
--ALTER TABLE Persons MODIFY Age int NOT NULL; !! HATA
ALTER TABLE Persons ALTER COLUMN Age int NOT NULL;
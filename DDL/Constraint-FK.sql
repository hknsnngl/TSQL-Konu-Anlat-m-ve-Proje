/* FORGEIN KEY */

-- Foreign tanýmý
CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);

-- Sonradan Foreign tanýmý
ALTER TABLE Orders ADD CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)... ;
ALTER TABLE Orders ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)...;
--! ... olan yerlere
--On Delete Cascade => getirmek PK tablodan kayýt silinirse otamatik FK tablodanda kayýt silinmesi
--On Delete Set Null => getirmek PK tablodan kayýt silinirse otamatik FK tablodaki kaydý null yapar.

-- Forgein Key silme
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;
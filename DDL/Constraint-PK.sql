/* PRIMARY KEY */

CREATE TABLE Person_1 (			-- ID int NOT NULL CONSTRAINT test_id PRIMARY KEY, " Bir PK g�sterimi ve Constaint ile adland�rma"
    ID int NOT NULL,			-- ID int NOT NULL PRIMARY KEY, "Bir tek PK g�sterimi ve Constraint otamatik adland�r�r." 
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
	CONSTRAINT PK_Person PRIMARY KEY (ID,LastName) -- "B�ylede tan�mlanabilir ve birden �ok PK tan�m� yap�lm��t�r."
);

-- Sonradan PK eklemek i�in
ALTER TABLE Persons ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);	
ALTER TABLE Persons ADD PRIMARY KEY (ID,LastName); -- Yukardakiden fark� otamatik adland�rma yap�lm��t�r.

-- PK silme i�lemi i�in
ALTER TABLE Persons DROP CONSTRAINT PK_Person;

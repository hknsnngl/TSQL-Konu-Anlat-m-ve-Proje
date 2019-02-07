/* PRIMARY KEY */

CREATE TABLE Person_1 (			-- ID int NOT NULL CONSTRAINT test_id PRIMARY KEY, " Bir PK gösterimi ve Constaint ile adlandýrma"
    ID int NOT NULL,			-- ID int NOT NULL PRIMARY KEY, "Bir tek PK gösterimi ve Constraint otamatik adlandýrýr." 
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
	CONSTRAINT PK_Person PRIMARY KEY (ID,LastName) -- "Böylede tanýmlanabilir ve birden çok PK tanýmý yapýlmýþtýr."
);

-- Sonradan PK eklemek için
ALTER TABLE Persons ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);	
ALTER TABLE Persons ADD PRIMARY KEY (ID,LastName); -- Yukardakiden farký otamatik adlandýrma yapýlmýþtýr.

-- PK silme iþlemi için
ALTER TABLE Persons DROP CONSTRAINT PK_Person;

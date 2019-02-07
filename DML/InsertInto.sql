/* (2) INSERT INTO */

--Insert Into => Tabloya kayýt ekler.Aþaðýda syntaxý verdik.
/*
INSERT INTO  table  VALUES (val1, val2, ...)

yada

INSERT INTO  table  (col1, col2, col3) VALUES (val1, val2, val3)
*/

Select * From Northwind.dbo.Shippers;
Insert Into Northwind.dbo.Shippers(CompanyName,Phone) Values ('DENEME','123456789');
--ID otomatik arttýrmada olduðundan eklemedik. Ekleseydik bu hata ile karþýlaþýrdýk.
--Cannot insert explicit value for identity column in table 'Shippers' when IDENTITY_INSERT is set to OFF.
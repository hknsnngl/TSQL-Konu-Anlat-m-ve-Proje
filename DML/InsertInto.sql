/* (2) INSERT INTO */

--Insert Into => Tabloya kay�t ekler.A�a��da syntax� verdik.
/*
INSERT INTO  table  VALUES (val1, val2, ...)

yada

INSERT INTO  table  (col1, col2, col3) VALUES (val1, val2, val3)
*/

Select * From Northwind.dbo.Shippers;
Insert Into Northwind.dbo.Shippers(CompanyName,Phone) Values ('DENEME','123456789');
--ID otomatik artt�rmada oldu�undan eklemedik. Ekleseydik bu hata ile kar��la��rd�k.
--Cannot insert explicit value for identity column in table 'Shippers' when IDENTITY_INSERT is set to OFF.
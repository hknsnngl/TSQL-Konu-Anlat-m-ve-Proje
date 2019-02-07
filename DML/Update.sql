/* (3) UPDATE */

-- Update => Tablodaki kayýtlarý güncelleme iþlemi yapar. Aþaðýda syntaxý vardýr.
/*
UPDATE  table SET col1=val1, col2=val2, col3=val3, ... WHERE colx=valx;
*/
 
Select * From Northwind.dbo.Shippers;
Update Northwind.dbo.Shippers Set CompanyName = ' DEGISTI' Where ShipperID = 4;
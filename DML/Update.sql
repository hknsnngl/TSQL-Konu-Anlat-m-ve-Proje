/* (3) UPDATE */

-- Update => Tablodaki kay�tlar� g�ncelleme i�lemi yapar. A�a��da syntax� vard�r.
/*
UPDATE  table SET col1=val1, col2=val2, col3=val3, ... WHERE colx=valx;
*/
 
Select * From Northwind.dbo.Shippers;
Update Northwind.dbo.Shippers Set CompanyName = ' DEGISTI' Where ShipperID = 4;
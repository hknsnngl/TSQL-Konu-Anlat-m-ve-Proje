/* (4) DELETE ve  TRUNCATE */

-- Delete => Tablodaki kayýtlarý silme iþlemi yapar. Aþaðýda syntaxý vardýr.
/*
DELETE  FROM table  WHERE colx=valx;
*/
 
Select * From Northwind.dbo.Shippers;
Delete From Northwind.dbo.Shippers Where ShipperID = 4; --> 4 numaralý ýd ye sahip kayýt tablodan silindi.

/*
TRUNCATE TABLE Kullaným Biçimi : tablomuzun içini boþaltmak istiyorsak aþaðýdaki kodu kullanabiliriz:

Syntax : TRUNCATE TABLE tablo_adi

Bu yapýyý DELETE ile benzerlik gösterir. Aralarýndaki farklar þunlardýr:
- Delete ile vereceðimiz parametrelere göre silme yapabiliriz.Ancak Truncate yapýsýnda direk olarak bütün kayýtlar silinir. 
-Yani parametre veremeyiz.
- Delete ile bütün kayýtlarý sildiðimiz zaman otomatik numara sýrasý baþtan baþlamaz.
Ancak Truncate ile silip yeni kayýt eklersek otomatik numara 1 'den itibaren baþlar.
*/
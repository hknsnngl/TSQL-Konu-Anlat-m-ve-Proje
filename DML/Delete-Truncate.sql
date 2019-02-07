/* (4) DELETE ve  TRUNCATE */

-- Delete => Tablodaki kay�tlar� silme i�lemi yapar. A�a��da syntax� vard�r.
/*
DELETE  FROM table  WHERE colx=valx;
*/
 
Select * From Northwind.dbo.Shippers;
Delete From Northwind.dbo.Shippers Where ShipperID = 4; --> 4 numaral� �d ye sahip kay�t tablodan silindi.

/*
TRUNCATE TABLE Kullan�m Bi�imi : tablomuzun i�ini bo�altmak istiyorsak a�a��daki kodu kullanabiliriz:

Syntax : TRUNCATE TABLE tablo_adi

Bu yap�y� DELETE ile benzerlik g�sterir. Aralar�ndaki farklar �unlard�r:
- Delete ile verece�imiz parametrelere g�re silme yapabiliriz.Ancak Truncate yap�s�nda direk olarak b�t�n kay�tlar silinir. 
-Yani parametre veremeyiz.
- Delete ile b�t�n kay�tlar� sildi�imiz zaman otomatik numara s�ras� ba�tan ba�lamaz.
Ancak Truncate ile silip yeni kay�t eklersek otomatik numara 1 'den itibaren ba�lar.
*/
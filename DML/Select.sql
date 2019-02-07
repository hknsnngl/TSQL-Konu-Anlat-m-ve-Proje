/*(1)SELECT*/

-- Select * From Table => Tabloda bulunan t�m sat�rlar� listeler.
Select * From Northwind.dbo.Products;

--Select col1,col2 From Table => Tablodaki col1 ve col2 sutunlar�n� listeler.
Select ProductName,UnitPrice From Northwind.dbo.Products;

--Distinct => tekrar eden kay�tlardan bir tane al�r, bunun yan�na da tekrar etmeyen kay�tlar� koyarak bir veri k�mesi olu�turur. 
--Birden fazla alan �zerinde Distinct yap�lacaksa alanlar�n ba��na tek tek yaz�lmaz. Ayr�ca Distinct komutu tek ba��na kullan�lamaz. 
--Distinct ile birden fazla alan kullan�ld���nda sanki alan�ifti olarak gibi de�erlendirilir tekrar eden mi de�il mi diye?
Select  Distinct SupplierID,CategoryID From Northwind.dbo.Products;
Select Distinct SupplierID,CategoryID,ProductName From Northwind.dbo.Products;

/*WHERE*/

--Where => Sorguda ko�ul belirtir. SELECT  col1,col2 FROM table WHERE col1=value1;
Select * From Northwind.dbo.Customers Where Country='Germany';

--Operat�rlerle ko�ullar�n de�erlendirilmesi(=,<>(!=),<,<=,>,>=,Between,Like,In)
/*
=	Belirtilen de�eri belirtilen adanda arar.	Where Bolum='Bilgisayar' 	
<>	Belirtilen de�er d���ndaki kay�tlar� arar.	Where Bolum<>'Bilgisayar' => bir di�er e�iti != dir.
>	Belirtilen de�erden b�y�k kay�tlar� arar.	Where Maas>1000
>=	Belirtilen de�ere e�it ve b�y�k olanlar� arar.	Where Maas>=1000	
<	Belitilen de�erden k���k olanlar� arar.	Where Maas<750	
<=	Belirtilen de�ere e�it ve k���k olanlar� arar.	Where Maas<=750
Between	Belli bir aral�kta olan de�erleri arar.	Where Maas Between 750 and 1000	
Like	Birka� karakteri bilinen kay�tlar� arar.	Where Sehir Like 'S%'		=> Sehir alan�nda S ile ba�layan kay�tlar� se�er.
In	Birden fazla de�erleri tek alanda arar.	Where Sehir in ('�stanbul','Ankara')	=>	Sehir alan�nda �stanbul ve Ankara yazan kay�tlar� se�er.
*/
Select * From Northwind.dbo.Customers Where Country <> 'Germany'

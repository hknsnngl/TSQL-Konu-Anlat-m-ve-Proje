/*(1)SELECT*/

-- Select * From Table => Tabloda bulunan tüm satýrlarý listeler.
Select * From Northwind.dbo.Products;

--Select col1,col2 From Table => Tablodaki col1 ve col2 sutunlarýný listeler.
Select ProductName,UnitPrice From Northwind.dbo.Products;

--Distinct => tekrar eden kayýtlardan bir tane alýr, bunun yanýna da tekrar etmeyen kayýtlarý koyarak bir veri kümesi oluþturur. 
--Birden fazla alan üzerinde Distinct yapýlacaksa alanlarýn baþýna tek tek yazýlmaz. Ayrýca Distinct komutu tek baþýna kullanýlamaz. 
--Distinct ile birden fazla alan kullanýldýðýnda sanki alançifti olarak gibi deðerlendirilir tekrar eden mi deðil mi diye?
Select  Distinct SupplierID,CategoryID From Northwind.dbo.Products;
Select Distinct SupplierID,CategoryID,ProductName From Northwind.dbo.Products;

/*WHERE*/

--Where => Sorguda koþul belirtir. SELECT  col1,col2 FROM table WHERE col1=value1;
Select * From Northwind.dbo.Customers Where Country='Germany';

--Operatörlerle koþullarýn deðerlendirilmesi(=,<>(!=),<,<=,>,>=,Between,Like,In)
/*
=	Belirtilen deðeri belirtilen adanda arar.	Where Bolum='Bilgisayar' 	
<>	Belirtilen deðer dýþýndaki kayýtlarý arar.	Where Bolum<>'Bilgisayar' => bir diðer eþiti != dir.
>	Belirtilen deðerden büyük kayýtlarý arar.	Where Maas>1000
>=	Belirtilen deðere eþit ve büyük olanlarý arar.	Where Maas>=1000	
<	Belitilen deðerden küçük olanlarý arar.	Where Maas<750	
<=	Belirtilen deðere eþit ve küçük olanlarý arar.	Where Maas<=750
Between	Belli bir aralýkta olan deðerleri arar.	Where Maas Between 750 and 1000	
Like	Birkaç karakteri bilinen kayýtlarý arar.	Where Sehir Like 'S%'		=> Sehir alanýnda S ile baþlayan kayýtlarý seçer.
In	Birden fazla deðerleri tek alanda arar.	Where Sehir in ('Ýstanbul','Ankara')	=>	Sehir alanýnda Ýstanbul ve Ankara yazan kayýtlarý seçer.
*/
Select * From Northwind.dbo.Customers Where Country <> 'Germany'

/* Stored Procedure */

--SP belirli bir iþlevi, görevi yerine getirmek için özellikle yapýlandýrýlmýþ bir veya daha fazla tablo, sp vs. ile iliþki kod parçacýklarýdýr. 
--Kýsaca Derlenmiþ SQL cümleciði diyebiliriz.
--SP’ler veritabanýnda saklanan SQL ifadeleridir. Programlama dillerinde olduðu gibi parametreler içerir. Bu parametrelere göre çalýþýp sonuçlarý listeler.
--Bir SP içinde baþka SP’leri çaðýrýp çalýþtýrabiliriz. Veritabanlarýnda saklandýðýndan dolayý daha hýzlý çalýþýrlar.
--SP’ler ilk çalýþtýklarýnda derlenirler. Tekrar çalýþtýklarýnda derlenmezler. Bu iþlemde performans açýsýndan güzel bir olaydýr.
--Geriye döndürmeyen metot gibi.
/*
SP’lerin Genel Yapýsý
Bir SP’nin yapýsý aþaðýdaki biçimdedir.
*/
CREATE  PROCEDURE or CREATE PROC  prosedür_adý
[ WITH Seçenekleri ]
AS
  SQL ifadeleri
GO
--GO ifadesiyse prosedür tamamlanmýþ olur.
--Oluþturulan bir SP’ye tekrar çalýþtýrmak için aþaðýdaki komutu kullanýrýz.
EXEC prosedür_adi

--ALTER -- ile deðiþtirilir.
Create Procedure ogrenciEkle
@ogrenciNo nvarchar(8),
@tc bigint,
@ad nvarchar (25),
@soyad nvarchar(25),
@memleket nvarchar(25),
@cins nvarchar(5),
@tel char(16),
@mail nvarchar(255),
@kayýttarih datetime,
@bolum_id int

As
Insert Into DB_SCHOOL.dbo.tbl_ogrenci values(@ogrenciNo,@tc,@ad,@soyad,@memleket,@cins,@tel,@mail,@kayýttarih,@bolum_id)
go

Select* From DB_SCHOOL.dbo.tbl_ogrenci
exec ogrenciEkle '279888',54879865216,'hasan','Ali','Trabzon','Bay','0(555)999 00 04','279888@ordu.edu.tr','2019-02-07' ,21;
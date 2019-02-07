/* Stored Procedure */

--SP belirli bir i�levi, g�revi yerine getirmek i�in �zellikle yap�land�r�lm�� bir veya daha fazla tablo, sp vs. ile ili�ki kod par�ac�klar�d�r. 
--K�saca Derlenmi� SQL c�mleci�i diyebiliriz.
--SP�ler veritaban�nda saklanan SQL ifadeleridir. Programlama dillerinde oldu�u gibi parametreler i�erir. Bu parametrelere g�re �al���p sonu�lar� listeler.
--Bir SP i�inde ba�ka SP�leri �a��r�p �al��t�rabiliriz. Veritabanlar�nda sakland���ndan dolay� daha h�zl� �al���rlar.
--SP�ler ilk �al��t�klar�nda derlenirler. Tekrar �al��t�klar�nda derlenmezler. Bu i�lemde performans a��s�ndan g�zel bir olayd�r.
--Geriye d�nd�rmeyen metot gibi.
/*
SP�lerin Genel Yap�s�
Bir SP�nin yap�s� a�a��daki bi�imdedir.
*/
CREATE  PROCEDURE or CREATE PROC  prosed�r_ad�
[ WITH Se�enekleri ]
AS
  SQL ifadeleri
GO
--GO ifadesiyse prosed�r tamamlanm�� olur.
--Olu�turulan bir SP�ye tekrar �al��t�rmak i�in a�a��daki komutu kullan�r�z.
EXEC prosed�r_adi

--ALTER -- ile de�i�tirilir.
Create Procedure ogrenciEkle
@ogrenciNo nvarchar(8),
@tc bigint,
@ad nvarchar (25),
@soyad nvarchar(25),
@memleket nvarchar(25),
@cins nvarchar(5),
@tel char(16),
@mail nvarchar(255),
@kay�ttarih datetime,
@bolum_id int

As
Insert Into DB_SCHOOL.dbo.tbl_ogrenci values(@ogrenciNo,@tc,@ad,@soyad,@memleket,@cins,@tel,@mail,@kay�ttarih,@bolum_id)
go

Select* From DB_SCHOOL.dbo.tbl_ogrenci
exec ogrenciEkle '279888',54879865216,'hasan','Ali','Trabzon','Bay','0(555)999 00 04','279888@ordu.edu.tr','2019-02-07' ,21;
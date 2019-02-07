/* Fonksiyon */

--sql serverda tanýmlý olan fonksiyonlar gibi  aldýðý parametreleri iþleyerek geriye bir deðer döndüren sql ifadeleridir.  
--Özellikle procedurelerden en büyük farký sorgularýn içinde direk kullanýlabilmeleridir.

-->Fonksiyon Çeþitleri
--1.Geriye sabit deðer döndüren fonksiyonlar
--2.Geriye Sorgu döndüren fonksiyonlar
--3.Geriye tablo deðiþkeni döndüren fonksiyonlar

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-->>Geriye sabit deðer döndüren fonksiyon oluþturma
CREATE FUNCTION fonksiyon_adi
( 
  -- Parametrelerin eklendiði yer
  @param1 veritürü,
  @param2 veritürü
)
RETURNS geri_dönecek_deðerin_veritürü
AS
BEGIN
  -- Önce Geri dönecek deðer tanýmlanýr.
  DECLARE @donen veritürü
  -- Sql ifadeleri dönen parametreye deðer aktarýmý gibi iþlemler
  RETURN @donen
END

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-->>Geriye Sorgu döndüren fonksiyon oluþturma
CREATE FUNCTION fonksiyon_adi
( 
  -- Parametrelerin eklendiði yer
  @param1 veritürü,
  @param2 veritürü
)
RETURNS TABLE
AS
RETURN
(
  -- Geriye dönecek select ile yazýlan sorgu
)

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-->>Geriye tablo deðiþkeni döndüren fonksiyon oluþturma
--Geriye tablo döndüðü için select ile kullanýrken from ifadesinden sonra fonksiyonun kullanýlmasý gerekir.
CREATE FUNCTION fonksiyon_adi
(
  -- Parametrelerin eklendiði yer
  @param1 veritürü,
  @param2 veritürü
)
RETURNS
@tablo TABLE
(
  -- colonlarý buraya yazýyoruz
  colon1 veritürü,
  colon2 veritürü
)
AS
BEGIN
  -- Tablo deðiþkenin içini girilen parametreler ile doldur.
  RETURN
END 

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-->Fonksiyon Üzerinde Deðiþiklik Yapma
--Create  function.. yerine Alter function…. yaparak fonksiyon üzerinde deðiþiklik yapmak mümkündür.

-->Kullanýcý Tanýmlý Fonksiyonlarý Silme
Drop function function_adi


--Örnek :  iki metni birleþtirip geriye tek metin döndüren fonksiyonu yazýnýz.Geriye deðer döndürür.

Create function fn_birlestir(@kelime1 nvarchar(20),@kelime2 nvarchar(20))
returns nvarchar(50)
as Begin
return rtrim(@kelime1)+space(1)+ rtrim(@kelime2)
End
Select dbo.fn_birlestir(ograd,ogrsoyad) AS AdSoyad from kutuphane.dbo.ogrenci

--Ornek : Öðrencinin numarasýnda göre okuduðu kitaplarý listeleyen.Geriye tablo döndürür. Table valued Func

Creat function  HangisiniOkudu
(
@ogrenciNo int
)
Returns Table
As
Begin
Return
(	--Declare deg_ismi degtipi --> deg tanýmý
	Select * From kutuphane.dbo.kitap k Where k.kitapno In (	 
	Select i.kitapno From kutuphane.dbo.islem i Where i.ogrno=(
	Select o.ogrno From kutuphane.dbo.ogrenci o Where o.ogrno=1)
	)
)
End
go

Select * From dbo.HangisiniOkudu(1);


--MultiLine Table Fonksiyonu
Create Function Fn_TabloDondur()
Returns
@MyTable Table
(
    ID int Not Null,
    AdSoyad Nvarchar(30) Not Null,
    Unvan Nvarchar(20) Not Null
)
As
Begin
    Insert @MyTable Select CalisanID, Ad+' '+Soyad, ISNULL(Unvan,'Yok') From kutuphane.dbo.ogrenci
 
    Return   
End
 
Select * From dbo.Fn_TabloDondur('urun')


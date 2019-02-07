/* Fonksiyon */

--sql serverda tan�ml� olan fonksiyonlar gibi  ald��� parametreleri i�leyerek geriye bir de�er d�nd�ren sql ifadeleridir.  
--�zellikle procedurelerden en b�y�k fark� sorgular�n i�inde direk kullan�labilmeleridir.

-->Fonksiyon �e�itleri
--1.Geriye sabit de�er d�nd�ren fonksiyonlar
--2.Geriye Sorgu d�nd�ren fonksiyonlar
--3.Geriye tablo de�i�keni d�nd�ren fonksiyonlar

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-->>Geriye sabit de�er d�nd�ren fonksiyon olu�turma
CREATE FUNCTION fonksiyon_adi
( 
  -- Parametrelerin eklendi�i yer
  @param1 verit�r�,
  @param2 verit�r�
)
RETURNS geri_d�necek_de�erin_verit�r�
AS
BEGIN
  -- �nce Geri d�necek de�er tan�mlan�r.
  DECLARE @donen verit�r�
  -- Sql ifadeleri d�nen parametreye de�er aktar�m� gibi i�lemler
  RETURN @donen
END

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-->>Geriye Sorgu d�nd�ren fonksiyon olu�turma
CREATE FUNCTION fonksiyon_adi
( 
  -- Parametrelerin eklendi�i yer
  @param1 verit�r�,
  @param2 verit�r�
)
RETURNS TABLE
AS
RETURN
(
  -- Geriye d�necek select ile yaz�lan sorgu
)

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-->>Geriye tablo de�i�keni d�nd�ren fonksiyon olu�turma
--Geriye tablo d�nd��� i�in select ile kullan�rken from ifadesinden sonra fonksiyonun kullan�lmas� gerekir.
CREATE FUNCTION fonksiyon_adi
(
  -- Parametrelerin eklendi�i yer
  @param1 verit�r�,
  @param2 verit�r�
)
RETURNS
@tablo TABLE
(
  -- colonlar� buraya yaz�yoruz
  colon1 verit�r�,
  colon2 verit�r�
)
AS
BEGIN
  -- Tablo de�i�kenin i�ini girilen parametreler ile doldur.
  RETURN
END 

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-->Fonksiyon �zerinde De�i�iklik Yapma
--Create  function.. yerine Alter function�. yaparak fonksiyon �zerinde de�i�iklik yapmak m�mk�nd�r.

-->Kullan�c� Tan�ml� Fonksiyonlar� Silme
Drop function function_adi


--�rnek :  iki metni birle�tirip geriye tek metin d�nd�ren fonksiyonu yaz�n�z.Geriye de�er d�nd�r�r.

Create function fn_birlestir(@kelime1 nvarchar(20),@kelime2 nvarchar(20))
returns nvarchar(50)
as Begin
return rtrim(@kelime1)+space(1)+ rtrim(@kelime2)
End
Select dbo.fn_birlestir(ograd,ogrsoyad) AS AdSoyad from kutuphane.dbo.ogrenci

--Ornek : ��rencinin numaras�nda g�re okudu�u kitaplar� listeleyen.Geriye tablo d�nd�r�r. Table valued Func

Creat function  HangisiniOkudu
(
@ogrenciNo int
)
Returns Table
As
Begin
Return
(	--Declare deg_ismi degtipi --> deg tan�m�
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


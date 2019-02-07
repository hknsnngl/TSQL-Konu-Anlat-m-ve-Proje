/* Alt sorgu
-- Alt sorgular parantez i�inde yaz�l�r ve sutun say�s� birden fazla olmamal�d�r
--Alt sorguda = ifadesi ile kar��la�t�r�lm��sa alt sorgudan gelen de�er tek olmal�d�r.
E�er birden fazla de�er d�n�yorsa in veya not in kullan�lmal�d�r.
*/

--Orn: ��renci nosu 279985 lan�n b�l�m�n� listeleyelim
Select b.bolumAdi From tbl_bolumler b Where  b.bolum_id=(
	Select o.bolum_id From tbl_ogrenci o Where o.ogrNo='279885');

--B�l�m� Bilgisayar m�hendisli�i olan ��rencileri �ktisat b�l�m� yapma. Bolum idleri bilsek hemen yapard�k.
Update tbl_ogrenci
Set bolum_id=(Select bolum_id From tbl_bolumler Where bolumAdi='�ktisat')
Where bolum_id=(Select bolum_id From tbl_bolumler b Where b.bolumAdi= 'Bilgisayar M�hendisli�i')


--�rn: ��renci tablosunda b�l�m� �ktisat olanlar� silme
Delete From tbl_ogrenci 
Where bolum_id=(
					Select b.bolum_id 
					From tbl_bolumler b
					Where b.bolumAdi= '�ktisat'
				)
--Ders ad� T�rk Dili - I dersini alan ��rencilerin ��rencileri listele
Select * From tbl_ogrenci o 
	Where o.ogr_id IN (Select n.ogr_id				--Not �n
					   From tbl_notlar n
					   Where n.ders_id IN(Select d.ders_id
										  From tbl_ders d
										  Where d.dersAd= 'T�rk Dili - I'
										  )
					  )
--Orn: ders id 3 olan�n ��rencileri mevcutsa listele 
Select * From tbl_ogrenci o
Where Exists(Select n.ogr_id					--Not Existst
			 From tbl_notlar n
			 Where o.ogr_id=n.ogr_id And n.ders_id=3)

--��renci nin no,ad,soyad,b�l�m�n� listele. Sutunda alt sorgu
Select  o.ogrNo, o.ad,o.soyad,(Select b.bolumAdi 
							   From tbl_bolumler b 
							   Where b.bolum_id=o.bolum_id) 
From tbl_ogrenci o

--��r id si 3 olan�n final notunun toplam� ve nosu ad� tc sini listeleme--From ifadesinde alt sorgu
Select o.ogrNo,o.ad,o.tcNo,k.toplam From tbl_ogrenci o 
Join(Select n.ogr_id,Sum(n.final) AS toplam From tbl_notlar n Group By n.ogr_id) k  On k.ogr_id=o.ogr_id

--All , <,>,>=,<=,<> ile birlikte kullan�l�r. katt��� anlam hepsi i�in �al���r.
--Ornek Northwind vt da category �d si 1 olanlardan �r�n fiyat�n ortalamas�ndan fazla olanlar�  hepsini getir.
Select * From Northwind.dbo.Products p1 Where p1.UnitPrice > ALL
(Select AVG(p.UnitPrice) From Northwind.dbo.Products p Where p.CategoryID=1) -- AVG yazmasayd�m �al��mazd� ��nk� hepsi i�in oldu�udan bir dek cok kay�ttan b�r� sa�lamazsa olmuyor.


--ANY  <,>,>=,<= ,le birlikte kullan�l�r. Hatt��� anlam Herhangi biri anlamda .En az biri i�in �al���r.
Select * From Northwind.dbo.Products p1 Where p1.UnitPrice > ANY
(Select AVG(p.UnitPrice) From Northwind.dbo.Products p Where p.CategoryID=1)
/* Alt sorgu
-- Alt sorgular parantez içinde yazýlýr ve sutun sayýsý birden fazla olmamalýdýr
--Alt sorguda = ifadesi ile karþýlaþtýrýlmýþsa alt sorgudan gelen deðer tek olmalýdýr.
Eðer birden fazla deðer dönüyorsa in veya not in kullanýlmalýdýr.
*/

--Orn: Öðrenci nosu 279985 lanýn bölümünü listeleyelim
Select b.bolumAdi From tbl_bolumler b Where  b.bolum_id=(
	Select o.bolum_id From tbl_ogrenci o Where o.ogrNo='279885');

--Bölümü Bilgisayar mühendisliði olan öðrencileri Ýktisat bölümü yapma. Bolum idleri bilsek hemen yapardýk.
Update tbl_ogrenci
Set bolum_id=(Select bolum_id From tbl_bolumler Where bolumAdi='Ýktisat')
Where bolum_id=(Select bolum_id From tbl_bolumler b Where b.bolumAdi= 'Bilgisayar Mühendisliði')


--Örn: Öðrenci tablosunda bölümü Ýktisat olanlarý silme
Delete From tbl_ogrenci 
Where bolum_id=(
					Select b.bolum_id 
					From tbl_bolumler b
					Where b.bolumAdi= 'Ýktisat'
				)
--Ders adý Türk Dili - I dersini alan öðrencilerin öðrencileri listele
Select * From tbl_ogrenci o 
	Where o.ogr_id IN (Select n.ogr_id				--Not ýn
					   From tbl_notlar n
					   Where n.ders_id IN(Select d.ders_id
										  From tbl_ders d
										  Where d.dersAd= 'Türk Dili - I'
										  )
					  )
--Orn: ders id 3 olanýn öðrencileri mevcutsa listele 
Select * From tbl_ogrenci o
Where Exists(Select n.ogr_id					--Not Existst
			 From tbl_notlar n
			 Where o.ogr_id=n.ogr_id And n.ders_id=3)

--Öðrenci nin no,ad,soyad,bölümünü listele. Sutunda alt sorgu
Select  o.ogrNo, o.ad,o.soyad,(Select b.bolumAdi 
							   From tbl_bolumler b 
							   Where b.bolum_id=o.bolum_id) 
From tbl_ogrenci o

--öðr id si 3 olanýn final notunun toplamý ve nosu adý tc sini listeleme--From ifadesinde alt sorgu
Select o.ogrNo,o.ad,o.tcNo,k.toplam From tbl_ogrenci o 
Join(Select n.ogr_id,Sum(n.final) AS toplam From tbl_notlar n Group By n.ogr_id) k  On k.ogr_id=o.ogr_id

--All , <,>,>=,<=,<> ile birlikte kullanýlýr. kattýðý anlam hepsi için çalýþýr.
--Ornek Northwind vt da category ýd si 1 olanlardan ürün fiyatýn ortalamasýndan fazla olanlarý  hepsini getir.
Select * From Northwind.dbo.Products p1 Where p1.UnitPrice > ALL
(Select AVG(p.UnitPrice) From Northwind.dbo.Products p Where p.CategoryID=1) -- AVG yazmasaydým çalýþmazdý çünkü hepsi için olduðudan bir dek cok kayýttan býrý saðlamazsa olmuyor.


--ANY  <,>,>=,<= ,le birlikte kullanýlýr. Hattýðý anlam Herhangi biri anlamda .En az biri için çalýþýr.
Select * From Northwind.dbo.Products p1 Where p1.UnitPrice > ANY
(Select AVG(p.UnitPrice) From Northwind.dbo.Products p Where p.CategoryID=1)
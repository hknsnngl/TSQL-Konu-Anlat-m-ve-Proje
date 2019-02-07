Select * From tbl_notlar;
-->Group By göre gruplar, Having e göre koþullar,select'e göre listeler.
Select durum,Sum(final) As FinalToplamý From tbl_notlar	
Group By durum Having durum= 'CB';


Select * From tbl_notlar AS N ,tbl_ders AS D Where N.ders_id=D.ders_id;
--inner join yada join
Select * From tbl_notlar AS N join tbl_ders AS D ON N.ders_id=D.ders_id;
--left outer join yada left join
--tbl_notlarýn idsi ne eþit olan tbl_ders yazýlýr olmayanlarýn alanlar null deðer olur.
Select * From tbl_notlar AS N left join tbl_ders AS D ON N.ders_id=D.ders_id;
--right outer join yada right join
-- bu seferde 2.yazýlan tablo idsiyle ayný olan 1. tablo yazýlýr ayný olmayanlara null eklenir
Select * From tbl_notlar AS N Right join tbl_ders AS D ON N.ders_id=D.ders_id; 
--full outer join yada full join
--1.  tablo ve 2. tablo ayný alanlar yazýlýr ayný olmayanlar her iki tarafta null yazýlýr.
Select * From tbl_notlar AS N Full join tbl_ders AS D ON N.ders_id=D.ders_id; 
--Ortak sutun olmasýna gerek yok ve satýr sayýlarý çarpýmý kadar sonuc doner.
Select * From tbl_notlar AS N Cross Join tbl_ders AS D 
-->1: A,B,C 2.F,E 1&2:D,K
--> 1. Sorgu intersect 2. Sorgu => D,K
--> 1. Sorgu except 2. Sorgu	=>  A,B,C
--> 1. Sorgu union 2. Sorgu	=> A,B,C,F,E,D,K
--> 1. Sorgu union all 2. Sorgu =>A,B,C,D,K,F,E,D,K

--Exists : mevcutsa listele , Not Exists: mevcut deðilse listele
Select * From DB_SCHOOL.dbo.tbl_ogrenci As o Where Exists( 
Select * From DB_SCHOOL.dbo.tbl_bolumler AS  b  Where o.bolum_id=b.bolum_id)









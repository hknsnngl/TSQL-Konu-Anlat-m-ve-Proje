Select * From tbl_notlar;
-->Group By g�re gruplar, Having e g�re ko�ullar,select'e g�re listeler.
Select durum,Sum(final) As FinalToplam� From tbl_notlar	
Group By durum Having durum= 'CB';


Select * From tbl_notlar AS N ,tbl_ders AS D Where N.ders_id=D.ders_id;
--inner join yada join
Select * From tbl_notlar AS N join tbl_ders AS D ON N.ders_id=D.ders_id;
--left outer join yada left join
--tbl_notlar�n idsi ne e�it olan tbl_ders yaz�l�r olmayanlar�n alanlar null de�er olur.
Select * From tbl_notlar AS N left join tbl_ders AS D ON N.ders_id=D.ders_id;
--right outer join yada right join
-- bu seferde 2.yaz�lan tablo idsiyle ayn� olan 1. tablo yaz�l�r ayn� olmayanlara null eklenir
Select * From tbl_notlar AS N Right join tbl_ders AS D ON N.ders_id=D.ders_id; 
--full outer join yada full join
--1.  tablo ve 2. tablo ayn� alanlar yaz�l�r ayn� olmayanlar her iki tarafta null yaz�l�r.
Select * From tbl_notlar AS N Full join tbl_ders AS D ON N.ders_id=D.ders_id; 
--Ortak sutun olmas�na gerek yok ve sat�r say�lar� �arp�m� kadar sonuc doner.
Select * From tbl_notlar AS N Cross Join tbl_ders AS D 
-->1: A,B,C 2.F,E 1&2:D,K
--> 1. Sorgu intersect 2. Sorgu => D,K
--> 1. Sorgu except 2. Sorgu	=>  A,B,C
--> 1. Sorgu union 2. Sorgu	=> A,B,C,F,E,D,K
--> 1. Sorgu union all 2. Sorgu =>A,B,C,D,K,F,E,D,K

--Exists : mevcutsa listele , Not Exists: mevcut de�ilse listele
Select * From DB_SCHOOL.dbo.tbl_ogrenci As o Where Exists( 
Select * From DB_SCHOOL.dbo.tbl_bolumler AS  b  Where o.bolum_id=b.bolum_id)









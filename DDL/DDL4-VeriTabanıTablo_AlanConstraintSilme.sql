--Datebase ve tablo silmek
--DROP TABLE ogrenci
--DROP DATABASE okul

--Tablo i�indeki kay�tlar� siler sadece
--TRUNCATE TABLE tbl_ogrenci



--Constraint silme 
ALTER TABLE tbl_ogrenci DROP Constraint test_mail;
ALTER TABLE tbl_ogrenci DROP  Constraint test_dogumTarihi;
ALTER TABLE tbl_ogrenci DROP Constraint  test_ogrNo;
-- ALTER TABLE tbl_ogrenci ALTER COLUMN ogrNo DROP DEFAULT; | Hata ald�m.
--Alter Table TabloAd�1 Drop Constraint pk_test ; | Cascade yazarsak devam� ili�kili olanlalar�da siler.
--Alter Table TabloAd�2 Drop Constraint fk_test ;

-- Alan silmek i�in
ALTER TABLE  tbl_ogrenci DROP COLUMN Email ;


/*INDEX

DROP INDEX table_name.index_name;

*/

--K�s�tlamay�  Pasif hale getirme
ALTER TABLE tablo_adi NOCHECK CONSTRAINT ALL;
ALTER TABLE tablo_adi NOCHECK CONSTRAINT kisitlama_adi;
--K�s�tlamay� aktif hale getirme
ALTER TABLE tablo_adi CHECK CONSTRAINT ALL;
ALTER TABLE tablo_adi CHECK CONSTRAINT kisitlama_adi;
--Tablo ad� de�i�tirme
EXEC  SP_RENAME 'tablo_adi','yeni_tablo_adi';
		
--Datebase ve tablo silmek
--DROP TABLE ogrenci
--DROP DATABASE okul

--Tablo içindeki kayýtlarý siler sadece
--TRUNCATE TABLE tbl_ogrenci



--Constraint silme 
ALTER TABLE tbl_ogrenci DROP Constraint test_mail;
ALTER TABLE tbl_ogrenci DROP  Constraint test_dogumTarihi;
ALTER TABLE tbl_ogrenci DROP Constraint  test_ogrNo;
-- ALTER TABLE tbl_ogrenci ALTER COLUMN ogrNo DROP DEFAULT; | Hata aldým.
--Alter Table TabloAdý1 Drop Constraint pk_test ; | Cascade yazarsak devamý iliþkili olanlalarýda siler.
--Alter Table TabloAdý2 Drop Constraint fk_test ;

-- Alan silmek için
ALTER TABLE  tbl_ogrenci DROP COLUMN Email ;


/*INDEX

DROP INDEX table_name.index_name;

*/

--Kýsýtlamayý  Pasif hale getirme
ALTER TABLE tablo_adi NOCHECK CONSTRAINT ALL;
ALTER TABLE tablo_adi NOCHECK CONSTRAINT kisitlama_adi;
--Kýsýtlamayý aktif hale getirme
ALTER TABLE tablo_adi CHECK CONSTRAINT ALL;
ALTER TABLE tablo_adi CHECK CONSTRAINT kisitlama_adi;
--Tablo adý deðiþtirme
EXEC  SP_RENAME 'tablo_adi','yeni_tablo_adi';
		
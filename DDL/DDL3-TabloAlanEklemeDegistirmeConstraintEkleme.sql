-- Alan eklemek için
ALTER TABLE  tbl_ogrenci ADD Email nvarchar(255) Not Null;

--Alan tipini deðiþtirmek için
ALTER TABLE tbl_ogrenci ALTER COLUMN  dogumYeri  nchar(25) Not null;

--Constraint ekleme || Constraint test yazmazsam otamatik adlandýrýr.
ALTER TABLE tbl_ogrenci Add Constraint test_mail Unique (email);
ALTER TABLE tbl_ogrenci Add Constraint test_dogumTarihi Check (dogumtarihi<getdate()); --|| AND koþul devam edebilir.
ALTER TABLE tbl_ogrenci Add Constraint test_ogrNo Default 0 for ogrNo;
--Alter Table TabloAdý1 Add Constraint pk_test Primary Key(PK1) //PK1,PK2,..
--Alter Table TabloAdý2 Add Constraint fk_test Foreign Key(PK1) References TabloAdý1(PK1)
		--On Delete Cascade | Set Default | Set Null 
		--On Update Cascade | Set Default | Set Null 


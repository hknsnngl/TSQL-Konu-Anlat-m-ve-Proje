--DCL = Data Control Language

-- Login oluþturma
CREATE LOGIN ornek  WITH PASSWORD='123456' --DEFAULT_DATABASE=master
--Login üzerinden bir kullanýcý oluþturma
CREATE USER ornek FOR LOGIN ornek

--Login silme
Drop Login ornek

--GRANT : Kullanýcýlara veritabaný nesneleri üzerinde güvenlik ayrýcalýklarý vermek için kullanýlan komuttur
--ornek kullanýcýsýna tablo oluþturma yetkisi veriyoruz.
--kullanýcýsýna güncelleme, silme ve ekleme yetkisi veriyoruz.
--kullanýcýmýzýn "tbl_bolumler" tablosundan select çekebilmesine izin verelim
--WITH GRANT OPTION: Dereceli yetkilendirme iþleminde kullanýlýr. Yetki verilmiþ kullanýcýnýn kendisinde bulunan yetkileri baþka kullanýcýlara verebilmesini saðlar.
GRANT CREATE TABLE TO ornek
GRANT INSERT,UPDATE,DELETE TO ornek
GRANT Select ON DB_SCHOOL.dbo.tbl_bolumler TO  ornek 
GRANT SELECT,INSERT ON Bilimkurgu TO BAYRAKTAR WITH GRANT OPTION
--BAYRAKTAR kullanýcýsýna bilimkurgu tablosu üzerinde select ve insert hakký veriyoruz. Ama with grant option ifadesinden dolayý, BAYRAKTAR kullanýcýsý da, baþkasýna da bu yetkiyi verebilir.



--DENY: GRANT komutunun tersidir. Yetkileri engeller.
--kullanýcýsýna tablo yapmayý yasakladýk.
--kullanýcýsýnýn bilimkurgu tablosunda INSERT ve SELECT kullanmasýný engelledik.
DENY CREATE TABLE TO Rornek
DENY INSERT, SELECT ON DB_SCHOOL.dbo.tbl_bolumler TO ornek



--REVOKE: GRANT ile deðiþtirdiðimiz haklarý eski haline döndürmek için kullanýlýr. Bir nesneyi oluþturan kullanýcýnýn REVOKE ile nesne üzerindeki yetkilendirme ve kullanma hakký yok edilemez. 
--BAYRAKTAR kullanýcýsýna verilen tüm yetkileri kaldýrýr.
REVOKE ALL ON DB_SCHOOL.dbo.tbl_bolumler  TO  ornek


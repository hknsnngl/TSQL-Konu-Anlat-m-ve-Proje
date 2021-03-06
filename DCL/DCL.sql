--DCL = Data Control Language

-- Login oluşturma
CREATE LOGIN ornek  WITH PASSWORD='123456' --DEFAULT_DATABASE=master
--Login üzerinden bir kullanıcı oluşturma
CREATE USER ornek FOR LOGIN ornek

--Login silme
Drop Login ornek

--GRANT : Kullanıcılara veritabanı nesneleri üzerinde güvenlik ayrıcalıkları vermek için kullanılan komuttur
--ornek kullanıcısına tablo oluşturma yetkisi veriyoruz.
--kullanıcısına güncelleme, silme ve ekleme yetkisi veriyoruz.
--kullanıcımızın "tbl_bolumler" tablosundan select çekebilmesine izin verelim
--WITH GRANT OPTION: Dereceli yetkilendirme işleminde kullanılır. Yetki verilmiş kullanıcının kendisinde bulunan yetkileri başka kullanıcılara verebilmesini sağlar.
GRANT CREATE TABLE TO ornek
GRANT INSERT,UPDATE,DELETE TO ornek
GRANT Select ON DB_SCHOOL.dbo.tbl_bolumler TO  ornek 
GRANT SELECT,INSERT ON Bilimkurgu TO BAYRAKTAR WITH GRANT OPTION
--BAYRAKTAR kullanıcısına bilimkurgu tablosu üzerinde select ve insert hakkı veriyoruz. Ama with grant option ifadesinden dolayı, BAYRAKTAR kullanıcısı da, başkasına da bu yetkiyi verebilir.



--DENY: GRANT komutunun tersidir. Yetkileri engeller.
--kullanıcısına tablo yapmayı yasakladık.
--kullanıcısının bilimkurgu tablosunda INSERT ve SELECT kullanmasını engelledik.
DENY CREATE TABLE TO Rornek
DENY INSERT, SELECT ON DB_SCHOOL.dbo.tbl_bolumler TO ornek



--REVOKE: GRANT ile değiştirdiğimiz hakları eski haline döndürmek için kullanılır. Bir nesneyi oluşturan kullanıcının REVOKE ile nesne üzerindeki yetkilendirme ve kullanma hakkı yok edilemez. 
--BAYRAKTAR kullanıcısına verilen tüm yetkileri kaldırır.
REVOKE ALL ON DB_SCHOOL.dbo.tbl_bolumler  TO  ornek


--DCL = Data Control Language

-- Login olu�turma
CREATE LOGIN ornek  WITH PASSWORD='123456' --DEFAULT_DATABASE=master
--Login �zerinden bir kullan�c� olu�turma
CREATE USER ornek FOR LOGIN ornek

--Login silme
Drop Login ornek

--GRANT : Kullan�c�lara veritaban� nesneleri �zerinde g�venlik ayr�cal�klar� vermek i�in kullan�lan komuttur
--ornek kullan�c�s�na tablo olu�turma yetkisi veriyoruz.
--kullan�c�s�na g�ncelleme, silme ve ekleme yetkisi veriyoruz.
--kullan�c�m�z�n "tbl_bolumler" tablosundan select �ekebilmesine izin verelim
--WITH GRANT OPTION: Dereceli yetkilendirme i�leminde kullan�l�r. Yetki verilmi� kullan�c�n�n kendisinde bulunan yetkileri ba�ka kullan�c�lara verebilmesini sa�lar.
GRANT CREATE TABLE TO ornek
GRANT INSERT,UPDATE,DELETE TO ornek
GRANT Select ON DB_SCHOOL.dbo.tbl_bolumler TO  ornek 
GRANT SELECT,INSERT ON Bilimkurgu TO BAYRAKTAR WITH GRANT OPTION
--BAYRAKTAR kullan�c�s�na bilimkurgu tablosu �zerinde select ve insert hakk� veriyoruz. Ama with grant option ifadesinden dolay�, BAYRAKTAR kullan�c�s� da, ba�kas�na da bu yetkiyi verebilir.



--DENY: GRANT komutunun tersidir. Yetkileri engeller.
--kullan�c�s�na tablo yapmay� yasaklad�k.
--kullan�c�s�n�n bilimkurgu tablosunda INSERT ve SELECT kullanmas�n� engelledik.
DENY CREATE TABLE TO Rornek
DENY INSERT, SELECT ON DB_SCHOOL.dbo.tbl_bolumler TO ornek



--REVOKE: GRANT ile de�i�tirdi�imiz haklar� eski haline d�nd�rmek i�in kullan�l�r. Bir nesneyi olu�turan kullan�c�n�n REVOKE ile nesne �zerindeki yetkilendirme ve kullanma hakk� yok edilemez. 
--BAYRAKTAR kullan�c�s�na verilen t�m yetkileri kald�r�r.
REVOKE ALL ON DB_SCHOOL.dbo.tbl_bolumler  TO  ornek


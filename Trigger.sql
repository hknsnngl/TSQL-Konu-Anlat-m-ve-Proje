/* Tetikleyiciler (TRIGGER) Nedir,Nasil Kullanilir..*/ 


--ORN : Kullan�c� bir kay�t ekledikten sonra ogrenci tablosunu listeleyen trigger olu�turunuz. --Sart varsa
--10A s�n�f�na cinsiyeti k�z olan ��renciler kaydedilebilsin

--trigger kodu
create trigger trg_Listele on kutuphane.dbo.ogrenci
after insert
as
--�art varsa if(exists(Select * from inserted where sinif = '10A' and cinsiyet = 'E'))
begin
select * from ogrenci
end
--Kay�t ekleme �rne�i  
Select * From kutuphane.dbo.ogrenci
insert into ogrenci(ograd,ogrsoyad,cinsiyet,dtarih,sinif,puan)values('Ali','Veli','E',GETDATE(),'10A',0) 


--Orn : 10A�n�n k�z ��rencileri silinemesin
 
Create trigger trg_10AKizOgrenciSilme on kutuphane.dbo.ogrenci
after delete
as
begin
   if(exists(select * from deleted where cinsiyet='K' and sinif='10A'))
    begin
     raiserror('10A s�n�f�ndaki k�z ��rencileri silemezsiniz!!',0,0)
     rollback transaction
    end
end
go
delete from ogrenci where cinsiyet='K' and sinif='10A' 



-- �rnek: Silinen ��renciler ba�ka bir tabloya kaydedilsin
-- silinen ��rencinin ad�n� soyad�n� mezun tablosuna kaydediyoruz.
create table kutuphane.dbo.mezun(ograd varchar(50),ogrsoyad varchar(50))

create trigger trg_SilineniEkle on kutuphane.dbo.ogrenci
after delete
as begin
insert into kutuphane.dbo.mezun select ograd,ogrsoyad from deleted
end


delete from kutuphane.dbo.ogrenci where ogrno=3 --trigger� test ediyoruz
select * from kutuphane.dbo.mezun


--�rnek: ��rencilerin cinsiyet alan� g�ncellenmesin

create trigger trg_Guncelle on kutuphane.dbo.ogrenci
after update
as begin
--if(update(cinsiyet))
if(exists(select * from inserted,deleted where inserted.ogrno=deleted.ogrno and inserted.cinsiyet!=deleted.cinsiyet)) 
--Exists i�indeki de�erin olup olmad���na bakar.
begin
raiserror('Cinsiyet G�ncellenemez.',1,1)
rollback transaction
end
end

--trigger test edilmesi
select * from ogrenci where ogrno = 5
update ogrenci set cinsiyet = 'E' where ogrno=5

 

--�rnek: Kitap tablosu g�ncellenirken eski sayfa say�s� yeni sayfa say�s�ndan fazla olmak zorunda

create trigger kitapguncelle on kutuphane.dbo.kitap
after update
as
begin
if(exists(select * from inserted,deleted where inserted.sayfasayisi=deleted.sayfasayisi or  inserted.sayfasayisi > deleted.sayfasayisi))
begin
raiserror('Eski sayfa say�s� yeni sayfa say�s�ndan fazla olmak zorunda',1,1)
rollback transaction
end
end

--Birinci Kontrol
update kitap set puan=20, sayfasayisi=150 where kitapno=1
select * from kitap where kitapno=1


--�kinci Kontrol
update kitap set puan=20, sayfasayisi=170 where kitapno=1
select * from kitap where kitapno=1

 

--�rnek: T�r tablosundan hi�bir kay�t silinmesin

Create Trigger trg_TurSilinmez on kutuphane.dbo.tur
after delete
as
begin
raiserror('tur Tablosu �zerinde kay�t silinmez',1,1)
rollback transaction
end


delete from tur

select * from tur

--After yerine Instead of kullan�larak delete i�lemi yapmak yerine hata vermesi sa�lanabilir.



Create Trigger trg_TurSilinmez on kutuphane.dbo.tur
instead of delete
as
begin
raiserror('tur Tablosu �zerinde kay�t silinmez',1,1)
rollback transaction
end


--�rnek:  Ogrenci tablosuna silindi isminde bir alan ekleyiniz. Ogrenci silinmesin silindi alan�n�n de�eri 1 olsun �instead of kullan�lacak after yerine

Alter Table kutuphane.dbo.ogrenci add silindi bit null

Create trigger ogrenciSil on kutuphane.dbo.ogrenci
instead of delete
as
begin
update kutuphane.dbo.ogrenci set silindi=1 where ogrno in (select ogrno from deleted)
end

delete from ogrenci where ogrno in(8,9)
select * from ogrenci where ogrno in (8,9)



--�rnek: Tur tablosuna gTarih ad�nda bi alan ekleyin tur tablosunda guncelleme yap�ld���nda gtarih alan�na g�ncelleme tarihini kaydediniz.

Alter Table kutuphane.dbo.tur add gTarih datetime null

Create Trigger turGuncelle on kutuphane.dbo.tur
after update
as
begin
--if(not update(guncellendi))--recursive trigger a��ksa hata verememesi i�in
  update kutuphane.dbo.tur set gTarih=GETDATE() where turno in (select turno from deleted)
end

update kutuphane.dbo.tur set turadi='Ba�ka Bir T�r'where turno=3
select * from kutuphane.dbo.tur where turno=3


--�rnek: 500 sayfadan daha az roman t�r�nde kitap eklenemesin
Create trigger kitap1 on kutuphane.dbo.kitap
after insert
as
if(exists(Select * from inserted,kutuphane.dbo.tur where inserted.turno = kutuphane.dbo.tur.turno and
turadi='roman' and sayfasayisi<500))
begin
  raiserror('500 sayfadan az roman t�r�nde kitap kaydedilemez',1,1);
  rollback transaction
End


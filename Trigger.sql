/* Tetikleyiciler (TRIGGER) Nedir,Nasil Kullanilir..*/ 


--ORN : Kullanýcý bir kayýt ekledikten sonra ogrenci tablosunu listeleyen trigger oluþturunuz. --Sart varsa
--10A sýnýfýna cinsiyeti kýz olan öðrenciler kaydedilebilsin

--trigger kodu
create trigger trg_Listele on kutuphane.dbo.ogrenci
after insert
as
--Þart varsa if(exists(Select * from inserted where sinif = '10A' and cinsiyet = 'E'))
begin
select * from ogrenci
end
--Kayýt ekleme örneði  
Select * From kutuphane.dbo.ogrenci
insert into ogrenci(ograd,ogrsoyad,cinsiyet,dtarih,sinif,puan)values('Ali','Veli','E',GETDATE(),'10A',0) 


--Orn : 10A’nýn kýz öðrencileri silinemesin
 
Create trigger trg_10AKizOgrenciSilme on kutuphane.dbo.ogrenci
after delete
as
begin
   if(exists(select * from deleted where cinsiyet='K' and sinif='10A'))
    begin
     raiserror('10A sýnýfýndaki kýz öðrencileri silemezsiniz!!',0,0)
     rollback transaction
    end
end
go
delete from ogrenci where cinsiyet='K' and sinif='10A' 



-- Örnek: Silinen öðrenciler baþka bir tabloya kaydedilsin
-- silinen öðrencinin adýný soyadýný mezun tablosuna kaydediyoruz.
create table kutuphane.dbo.mezun(ograd varchar(50),ogrsoyad varchar(50))

create trigger trg_SilineniEkle on kutuphane.dbo.ogrenci
after delete
as begin
insert into kutuphane.dbo.mezun select ograd,ogrsoyad from deleted
end


delete from kutuphane.dbo.ogrenci where ogrno=3 --triggerý test ediyoruz
select * from kutuphane.dbo.mezun


--Örnek: Öðrencilerin cinsiyet alaný güncellenmesin

create trigger trg_Guncelle on kutuphane.dbo.ogrenci
after update
as begin
--if(update(cinsiyet))
if(exists(select * from inserted,deleted where inserted.ogrno=deleted.ogrno and inserted.cinsiyet!=deleted.cinsiyet)) 
--Exists içindeki deðerin olup olmadýðýna bakar.
begin
raiserror('Cinsiyet Güncellenemez.',1,1)
rollback transaction
end
end

--trigger test edilmesi
select * from ogrenci where ogrno = 5
update ogrenci set cinsiyet = 'E' where ogrno=5

 

--Örnek: Kitap tablosu güncellenirken eski sayfa sayýsý yeni sayfa sayýsýndan fazla olmak zorunda

create trigger kitapguncelle on kutuphane.dbo.kitap
after update
as
begin
if(exists(select * from inserted,deleted where inserted.sayfasayisi=deleted.sayfasayisi or  inserted.sayfasayisi > deleted.sayfasayisi))
begin
raiserror('Eski sayfa sayýsý yeni sayfa sayýsýndan fazla olmak zorunda',1,1)
rollback transaction
end
end

--Birinci Kontrol
update kitap set puan=20, sayfasayisi=150 where kitapno=1
select * from kitap where kitapno=1


--Ýkinci Kontrol
update kitap set puan=20, sayfasayisi=170 where kitapno=1
select * from kitap where kitapno=1

 

--Örnek: Tür tablosundan hiçbir kayýt silinmesin

Create Trigger trg_TurSilinmez on kutuphane.dbo.tur
after delete
as
begin
raiserror('tur Tablosu üzerinde kayýt silinmez',1,1)
rollback transaction
end


delete from tur

select * from tur

--After yerine Instead of kullanýlarak delete iþlemi yapmak yerine hata vermesi saðlanabilir.



Create Trigger trg_TurSilinmez on kutuphane.dbo.tur
instead of delete
as
begin
raiserror('tur Tablosu üzerinde kayýt silinmez',1,1)
rollback transaction
end


--Örnek:  Ogrenci tablosuna silindi isminde bir alan ekleyiniz. Ogrenci silinmesin silindi alanýnýn deðeri 1 olsun –instead of kullanýlacak after yerine

Alter Table kutuphane.dbo.ogrenci add silindi bit null

Create trigger ogrenciSil on kutuphane.dbo.ogrenci
instead of delete
as
begin
update kutuphane.dbo.ogrenci set silindi=1 where ogrno in (select ogrno from deleted)
end

delete from ogrenci where ogrno in(8,9)
select * from ogrenci where ogrno in (8,9)



--Örnek: Tur tablosuna gTarih adýnda bi alan ekleyin tur tablosunda guncelleme yapýldýðýnda gtarih alanýna güncelleme tarihini kaydediniz.

Alter Table kutuphane.dbo.tur add gTarih datetime null

Create Trigger turGuncelle on kutuphane.dbo.tur
after update
as
begin
--if(not update(guncellendi))--recursive trigger açýksa hata verememesi için
  update kutuphane.dbo.tur set gTarih=GETDATE() where turno in (select turno from deleted)
end

update kutuphane.dbo.tur set turadi='Baþka Bir Tür'where turno=3
select * from kutuphane.dbo.tur where turno=3


--Örnek: 500 sayfadan daha az roman türünde kitap eklenemesin
Create trigger kitap1 on kutuphane.dbo.kitap
after insert
as
if(exists(Select * from inserted,kutuphane.dbo.tur where inserted.turno = kutuphane.dbo.tur.turno and
turadi='roman' and sayfasayisi<500))
begin
  raiserror('500 sayfadan az roman türünde kitap kaydedilemez',1,1);
  rollback transaction
End


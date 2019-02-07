Select * From tbl_ders;								-->Tabloda bulunan tüm satırları listeler.
Select dersKodu,dersAd From tbl_ders;				-->Sorguda belirtilen  sutunlarını listeler
Select Distinct kredi From tbl_ders;				-->tekrar eden kayıtlardan bir tane alır ve tekrar etmeyen kayıtlarıda alır.
Select Distinct kredi,dersAd From tbl_ders;			-->Sorguya göre 2 sutun için tekrarlı kayıtlardan bir tane al ve tekrar etmeyenide.

Select * From tbl_notlar;
Select * From tbl_notlar Order By ortalama;					--> Order By : Sıralama yapar Default A->Z veya 0->9 
Select * From tbl_notlar Order By vize ASC,Final DESC;		--> ASC : A->Z iken DESC : Z<-A ilk önce vizeye göre sıralama sonra final.

Select ortalama AS DönemSonuNotu From tbl_notlar As N;		--> ALIAS : AS takma isim verir tablo ve alanlara.

Select ortalama/100 AS YüzdeNotu From tbl_notlar;			--> Alanlarda +,-,*,/ işlemleri yapılabilir.

Select vize+' '+final+' '+ortalama As ToplamNotlar From tbl_notlar; --> Alanları birleştirir numeric oldugundan toplayarak birleşti
Select ad+' '+Soyad As adSoyad From tbl_ogrenci;				    --> String  oldugundan ad soyad seklinde oldu.

Select * From tbl_ders Where kredi = 3;			--> Where : Koşul belirtir.
Select * From tbl_ders Where kredi <> 3;		--> 3 e eşit olamayanları
Select * From tbl_notlar where ortalama>50;		--> >=,<,<=, içinde geçerli

Select * From tbl_ogrenci Where Cinsiyet = 'Bay' And bolum_id=21;   --> And : ve anlamı taşır. 
Select * From tbl_notlar Where final > 45 Or durum = 'AA';			--> Or : veya anlamı vardır.
Select * From tbl_notlar Where not durum = 'BA';					--> not : değil anlamı vardır.

Select * From tbl_notlar WHERE ortalama In (70,75,80,85);			--> İçinde olanları listeler.
Select * From tbl_notlar WHERE ortalama Not In (70,75,80,85);		--> içinde olmayanları.

Select * From tbl_notlar Where  ortalama Between 45 And 55;			--> Arasındakileri listeler.

Select * From tbl_bolumler;
Select * From tbl_bolumler Where bolumAdi LIKE 'e%';		--> e ile başlayan.
Select * From tbl_bolumler Where bolumAdi LIKE '%i';		--> i ile biten.
Select * From tbl_bolumler Where bolumAdi LIKE '%a%';		--> içinde a geçen.
/*
% 0 veya daha fazla karakter
_ Sadece tek bir karakter
[ ] Belirtilen karakterler arasında sadece tek bir karakter
[^a] Belirtilen karakterler arasında olmayan tek bir karakter
Örnekler;
LIKE ‘A%’ A ile başlayan tüm isimler 
LIKE ‘%n’ n ile biten tüm isimler 
LIKE ‘%y%’ y karakterlerini içeren tüm isimler 
LIKE ‘____n’ n ile biten tüm 5 karakterli isimler 
LIKE ‘[FH]%’ F veya H ile başlayan tüm isimler
LIKE ‘[A-K]%’ A ve K arasındaki harfler ile başlayan tüm isimler
LIKE ‘[^M-Z]%’ M ve Z arasındaki harfler ile başlamayan tüm isimler LIKE ‘[^U]%’ Baş harfi U olmayan tüm isimler
*/

Select * From tbl_notlar Where ortalama IS NOT NULL; --> NULL değer olmayan. IS NULL boş değer olanları listeler.

--Case değer değiştirme.
Select ad,soyad, Case Cinsiyet
When 'Bay' Then 'E'
When 'Bayan' Then 'K' End AS cinsiyet From tbl_ogrenci;

--with ties aynı değere sahip olanlarıda alır 9 u geçebilir. Farkı

Select Top 9 with ties * From Northwind.dbo.Products p Order By  p.UnitPrice;

Select Top 9 * From Northwind.dbo.Products p Order By  p.UnitPrice;

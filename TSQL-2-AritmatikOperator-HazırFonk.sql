Select * From tbl_bolumler;
Select adres+' '+bolumAdi From tbl_bolumler;
Select SUBSTRING(bolumAdi,1,3) AS IlkUcHarf From tbl_bolumler; --> Kolondaki  1.indexten 3 tane al ve listele
Select RIGHT(bolumAdi,3) As Sagdan From tbl_bolumler;		--> kolondaki saðdan baþla 3 tane al ve listele
Select LEFT(bolumAdi,3) As Sagdan From tbl_bolumler;		--> kolondaki soldan baþla 3 tane al ve listele
Select LOWER(bolumAdi) From tbl_bolumler;		-->Kolondaki harfleri küçük yap
Select UPPER(bolumAdi) From tbl_bolumler;		-->kolondaki harfleri buyuk yap
Select LTRIM(adres) From tbl_bolumler;			-->sol boþluklarý ihmal eder.
Select RTRIM(adres) From tbl_bolumler;			--> sað boþluklarý ihmal eder.
Select LEN(bolumAdi) From tbl_bolumler;
Select REPLACE(bolumAdi,'Ýngiliz Dili','ÝD') AS BolumAdý From tbl_bolumler;
Select CHARINDEX('i',bolumAdi) FRom tbl_bolumler;
Select REVERSE(bolumAdi) From tbl_bolumler;


Select * From tbl_notlar;
Select ABS(-10); --> mutlak degerini alma
Select POWER(2,3); -->üst alma
Select SQRT(4); -->karekök alma
Select 50%3;	-->mod iþlemi
Select ROUND(2.4,0); -->yuvarlama yapar.
Select ROUND(2.47,1);
Select FLOOR(2.7);	--> Her koþulda alta yuvarlar
Select CEILING(2.7); -->Her koþulda üste yuvarlar

Select Sum(final) From tbl_notlar Where durum = 'AA';-->toplam
Select AVG(ortalama) From tbl_notlar;	-->ortalama
Select MAX(final),MIN(vize) From tbl_notlar; -->en fazla en az
Select COUNT(ders_id) From tbl_notlar; --> kaç tane var

Select GETDATE(); --suan ki tarih bilgisini verir.
Select DATEPART(YEAR,GETDATE());  --sayýsal olarak verir
--> MONTH, DAY, HOUR, MINUTE, SECOND, WEEK, QUARTER
Select DATENAME(MONTH,GETDATE()); --WEEKDAY isim olarak verir.
Select DATEDIFF(Year,'12.08.1993',GETDATE());--MONTH,DAY sayýsal fark
Select DATEADD(Year,2,GETDATE());--MONTH,DAY Ekleme yapar sayýsal olarak.

Select CAST(bolumKodu AS nvarchar(10))+' '+bolumAdi AS Sonuc From tbl_bolumler;  --> tip dönüþümü
Select CONVERT(nvarchar(10), bolumKodu)+' '+bolumAdi AS Sonuc From tbl_bolumler; ; -->tip dönüþümü





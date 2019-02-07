Select * From tbl_bolumler;
Select adres+' '+bolumAdi From tbl_bolumler;
Select SUBSTRING(bolumAdi,1,3) AS IlkUcHarf From tbl_bolumler; --> Kolondaki  1.indexten 3 tane al ve listele
Select RIGHT(bolumAdi,3) As Sagdan From tbl_bolumler;		--> kolondaki sa�dan ba�la 3 tane al ve listele
Select LEFT(bolumAdi,3) As Sagdan From tbl_bolumler;		--> kolondaki soldan ba�la 3 tane al ve listele
Select LOWER(bolumAdi) From tbl_bolumler;		-->Kolondaki harfleri k���k yap
Select UPPER(bolumAdi) From tbl_bolumler;		-->kolondaki harfleri buyuk yap
Select LTRIM(adres) From tbl_bolumler;			-->sol bo�luklar� ihmal eder.
Select RTRIM(adres) From tbl_bolumler;			--> sa� bo�luklar� ihmal eder.
Select LEN(bolumAdi) From tbl_bolumler;
Select REPLACE(bolumAdi,'�ngiliz Dili','�D') AS BolumAd� From tbl_bolumler;
Select CHARINDEX('i',bolumAdi) FRom tbl_bolumler;
Select REVERSE(bolumAdi) From tbl_bolumler;


Select * From tbl_notlar;
Select ABS(-10); --> mutlak degerini alma
Select POWER(2,3); -->�st alma
Select SQRT(4); -->karek�k alma
Select 50%3;	-->mod i�lemi
Select ROUND(2.4,0); -->yuvarlama yapar.
Select ROUND(2.47,1);
Select FLOOR(2.7);	--> Her ko�ulda alta yuvarlar
Select CEILING(2.7); -->Her ko�ulda �ste yuvarlar

Select Sum(final) From tbl_notlar Where durum = 'AA';-->toplam
Select AVG(ortalama) From tbl_notlar;	-->ortalama
Select MAX(final),MIN(vize) From tbl_notlar; -->en fazla en az
Select COUNT(ders_id) From tbl_notlar; --> ka� tane var

Select GETDATE(); --suan ki tarih bilgisini verir.
Select DATEPART(YEAR,GETDATE());  --say�sal olarak verir
--> MONTH, DAY, HOUR, MINUTE, SECOND, WEEK, QUARTER
Select DATENAME(MONTH,GETDATE()); --WEEKDAY isim olarak verir.
Select DATEDIFF(Year,'12.08.1993',GETDATE());--MONTH,DAY say�sal fark
Select DATEADD(Year,2,GETDATE());--MONTH,DAY Ekleme yapar say�sal olarak.

Select CAST(bolumKodu AS nvarchar(10))+' '+bolumAdi AS Sonuc From tbl_bolumler;  --> tip d�n���m�
Select CONVERT(nvarchar(10), bolumKodu)+' '+bolumAdi AS Sonuc From tbl_bolumler; ; -->tip d�n���m�





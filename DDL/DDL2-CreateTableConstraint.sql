CREATE TABLE tbl_ogrenci
(
ogr_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
ogrNo NVARCHAR(8) NOT NULL,
tcNo BIGINT NOT NULL UNIQUE,
ad NVARCHAR(100) NOT NULL,
soyad NVARCHAR(100) NOT NULL,
dogumTarihi DATETIME NULL,
dogumYeri NVARCHAR(50)
)

CREATE TABLE tbl_ogrenciNot(
ogrNot_id INT IDENTITY(1,1) NOT NULL,
ogr_id INT NOT NULL,
notu TINYINT DEFAULT 0,
notGirisTarihi DATETIME NOT NULL DEFAULT GETDATE()
CONSTRAINT pk_key PRIMARY KEY (ogrNot_id),			 -- PRIMARY KEY (a,b,c,...)
CONSTRAINT ck_not CHECK (notu>=0 AND notu <=100),
CONSTRAINT uk_ogr_id_ders_id UNIQUE (ogr_id),		 -- UNIQUE(a,b,c,...)
CONSTRAINT fk_key_ogr_id FOREIGN KEY (ogr_id) REFERENCES tbl_ogrenci(ogr_id) 
)
/* Baþka Tablodan sorgu ile oluþturulabilir.
	
	CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;

*/

/* INDEX 


CREATE INDEX index_name
ON table_name (column1, column2, ...);

CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);

*/

CREATE DATABASE DB_LECTURES
ON
(NAME = DB_LECTURES_MDF																				--(Dosya Ad�)
, FILENAME= 'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\LECTURES.mdf'		--(Fiziksel Dosya Ad�)
, SIZE = 5120KB																						--(Dosya Boyutu)
, MAXSIZE = UNLIMITED																				--(Maksimum Dosya Boyutu)
, FILEGROWTH =1024)																				    --(Art�m Miktar�)
LOG
ON
(NAME = DB_LECTURES_LOG
, FILENAME= 'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\LECTURES.ldf'
, SIZE = 1024KB
, MAXSIZE = 2048KB
, FILEGROWTH =10%)
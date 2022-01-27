-----------------------NDF y MDF datos, ldf Log----------------------------------------------
CREATE DATABASE NBL_Refugio2
ON
PRIMARY 
 (NAME = Refugio1,
	  FILENAME='C:\BLN\files\refugio1.mdf',
	  SIZE = 100MB,
	  MAXSIZE = 200,
	  FILEGROWTH = 20 ),

 (NAME = Refugio2,
	  FILENAME='C:\BLN\files\refugio2.ndf',
	  SIZE = 100MB,
	  MAXSIZE = 200,
	  FILEGROWTH = 20 ),

 (NAME = Refugio3,
	  FILENAME='C:\BLN\files\refugio3.ndf',
	  SIZE = 100MB,
	  MAXSIZE = 200,
	  FILEGROWTH = 20 ),

FILEGROUP EspeciesGroup1
 (NAME = EGrp1Fi1_dat,
	  FILENAME='C:\BLN\files\EGrp1Fi1_dat.ndf',
	  SIZE = 100MB,
	  MAXSIZE = 200,
	  FILEGROWTH = 20 )

 LOG ON
(NAME = Refugio_log,
	FILENAME = 'C:\BLN\files\refugiolog.ldf',
	SIZE = 5MB,
	MAXSIZE = 25MB,
	FILEGROWTH = 5MB ) ;
GO


---------------Añade un archivo----------------------
ALTER DATABASE NBL_Refugio2
ADD FILE
(NAME = Refugio5,
	  FILENAME='C:\BLN\files\refugio5.ndf',
	  SIZE = 100MB,
	  MAXSIZE = 200,
	  FILEGROWTH = 20 )
GO

--------------------------Elimina un archivo----------------------
ALTER DATABASE NBL_Refugio2
REMOVE FILE Refugio5;
GO

---------------------Añade un filegroup-----------------------------
ALTER DATABASE NBL_Refugio2
ADD FILEGROUP EspeciesGroup2;
GO

------------------Añade ficheros al filegroup---------------------------
ALTER DATABASE NBL_Refugio2
ADD FILE
(NAME = Refugio8,
	  FILENAME='C:\BLN\files\refugio8.ndf',
	  SIZE = 100MB,
	  MAXSIZE = 200,
	  FILEGROWTH = 20 )
TO FILEGROUP EspeciesGroup1
GO

----------Eliminamos primero los datos para poder eliminar el grupo-----------------
ALTER DATABASE NBL_Refugio2
REMOVE FILE Refugio8;
GO

ALTER DATABASE NBL_Refugio2
REMOVE FILE EGrp1Fi1_dat;
GO

ALTER DATABASE NBL_Refugio2
REMOVE FILEGROUP EspeciesGroup1
GO


------------------Modifica el nombre----------------------------------
Alter Database NBL_Refugio2
Modify Name = Refugio
Go


----------------------Modificar tamaño-----------------------------
ALTER DATABASE NBL_Refugio2
Modify File 
	(NAME = Refugio1,
	SIZE = 10MB);
Go
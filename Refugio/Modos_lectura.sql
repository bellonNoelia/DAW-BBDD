USE BLN_Refugio
 GO

-------Desconecta la BD-------
ALTER DATABASE BLN_Refugio
	SET OFFLINE
GO

-------Fuerza la desconexi�n-------
Alter Database  BLN_Refugio
	SET OFFLINE
	WITH ROLLBACK	IMMEDIATE
Go

------Conecta la BD---------
ALTER DATABASE BLN_Refugio
	SET ONLINE
GO

---------Establece el modo lectura-------
ALTER DATABASE BLN_Refugio
	SET READ_ONLY
GO


---------Quita el modo lectura -------
ALTER DATABASE BLN_Refugio
	SET READ_WRITE
GO

----------Conexi�n para mi------------
Alter database BLN_Refugio
	Set Single_User
	With Rollback Immediate;
Go

------------Conexi�n para aquien tenga acceso---------------
Alter Database BLN_Refugio
	Set Multi_user;
Go
---------------Conexi�n para administradores y/o propietarios-----------
ALTER DATABASE BLN_Refugio  
	SET RESTRICTED_USER
	WITH ROLLBACK IMMEDIATE
GO


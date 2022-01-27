
---------------Creación Login--------------
 USE BLN_Refugio
 GO

CREATE LOGIN [paula]
WITH PASSWORD='paula',
DEFAULT_DATABASE=[master],
DEFAULT_LANGUAGE=[us_english],
CHECK_EXPIRATION=OFF,
CHECK_POLICY=OFF
GO

ALTER LOGIN paula
DISABLE;
GO

ALTER LOGIN paula
ENABLE;
GO


---------------Crear Usuario Para un Login-------------------
CREATE USER paula 
 FOR LOGIN paula
 WITH DEFAULT_SCHEMA=[dbo]
 GO

 USE BLN_Refugio
 GO

 DROP USER paula
 GO

 DROP USER IF EXISTS David
 GO


CREATE USER David
WITHOUT LOGIN
GO

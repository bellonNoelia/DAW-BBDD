USE master;
GO
--------Eliminar BD---------------
DROP DATABASE BLN_Refugio
GO

DROP DATABASE IF EXISTS BLN_Refugio
GO

CREATE DATABASE BLN_Refugio
GO

USE BLN_Refugio
GO

--------------Información sobre procedimientos---------------
Exec sp_helpdb BLN_Refugio

GO
Execute sp_helpdb BLN_Refugio

GO
sp_helpdb BLN_Refugio
GO

SELECT *
FROM sys.database_files
GO

----------------------------------------Tablas-------------------------------------------
CREATE TABLE Especie (
    ID_especie       INT IDENTITY (1,1) NOT NULL,
    Nombre_especie   VARCHAR(20)
)

GO
--------------------Añadir PK--------------------------
ALTER TABLE Especie 
	ADD CONSTRAINT PK_especie PRIMARY KEY  (ID_especie)
 GO

 CREATE TABLE Raza (
    ID_raza              INT IDENTITY (1,1) NOT NULL,
    Nombre_raza          VARCHAR(20),
    Especie_id_especie   INTEGER NOT NULL
)
GO

ALTER TABLE Raza 
	ADD CONSTRAINT PK_Raza PRIMARY KEY (ID_raza)
GO


CREATE TABLE Animal (
	CHIP						VARCHAR(20) NOT NULL,
	Nombre						VARCHAR(20)NOT NULL,
	Edad						INT NOT NULL,
	Potencialmente_peligroso	VARCHAR(2) NOT NULL,
	Sexo						VARCHAR (6) NOT NULL,
	Descripción					VARCHAR(100) NOT NULL,
	Raza_id_raza				INTEGER NOT NULL
)
GO
-------------------Añadir PK-------------------------
ALTER TABLE Animal
	ADD CONSTRAINT PK_Animal PRIMARY KEY(CHIP);
GO

CREATE TABLE Estado (
	Acogida_id_acogida   INT IDENTITY (1,1) NOT NULL,
    Animal_chip          VARCHAR(20) NOT NULL,
    Fecha_acogida        DATE,
    Fecha_fin            DATE,
    Descripcion          VARCHAR(100)
)
GO

ALTER TABLE Estado 
	ADD CONSTRAINT PK_Estado PRIMARY KEY  (Acogida_ID_acogida, Animal_Chip)
GO


CREATE TABLE Acogida (
    ID_acogida                    INT NOT NULL,
    Tipo_acogida_id_tipoacogida   INT NOT NULL
)
GO

ALTER TABLE Acogida
	ADD CONSTRAINT PK_acogida PRIMARY KEY CLUSTERED (ID_acogida)
GO

CREATE TABLE Historial (
    Acogida_id_acogida                   INT NOT NULL,
    Responsable_acogida_id_responsable   INT NOT NULL
)

GO

ALTER TABLE Historial 
	ADD constraint PK_historial PRIMARY KEY  (Acogida_ID_acogida, Responsable_acogida_ID_responsable)
GO

CREATE TABLE Responsable_acogida (
	ID_responsable   INT IDENTITY (1,1) NOT NULL,
    DNI				 VARCHAR(9),
    Nombre           VARCHAR(20),
    Apellido         VARCHAR(20),
    Direccion        VARCHAR(20),
    Telefono         BIGINT
)
GO

ALTER TABLE Responsable_acogida
	 ADD constraint PK_responsable_acogida PRIMARY KEY  (ID_responsable)
GO

CREATE TABLE Tipo_acogida (
    ID_tipoacogida       INT IDENTITY (1,1) NOT NULL,
    Nombre_tipoacogida   VARCHAR(20)
)
GO

ALTER TABLE Tipo_acogida 
	ADD CONSTRAINT PK_tipo_acogida PRIMARY KEY  (ID_tipoacogida)
GO

CREATE TABLE Intervencion (
    ID_intervencion                         INT IDENTITY (1,1) NOT NULL,
    Fecha                                   DATE NOT NULL,
    Descripcion                             VARCHAR(100),
    Animal_chip                             VARCHAR(20) NOT NULL,
    Tipo_intervencion_id_tipointervencion   INTEGER NOT NULL
)
GO

ALTER TABLE Intervencion 
	ADD CONSTRAINT PK_intervencion PRIMARY KEY  (ID_intervencion)
GO

CREATE TABLE Participa (
    Intervencion_id_intervencion   INT NOT NULL,
    Veterinario_id_veterinario     INT NOT NULL
)
GO

ALTER TABLE Participa 
	ADD CONSTRAINT PK_participa_ PRIMARY KEY  (Intervencion_ID_intervencion, Veterinario_ID_veterinario)
GO


CREATE TABLE Veterinario (
    ID_veterinario                   INT IDENTITY (1,1) NOT NULL,
    N_colegiado                      INTEGER,
    Nombre                           VARCHAR(20),
    Apellido                         VARCHAR(20),
    Telefono                         BIGINT,
    Clinica_veterinaria_id_clinica   INTEGER NOT NULL
)
GO

ALTER TABLE Veterinario 
	ADD CONSTRAINT PK_veterinario PRIMARY KEY (ID_veterinario)
GO

CREATE TABLE Clinica_veterinaria (
    ID_clinica   INT IDENTITY (1,1) NOT NULL,
    CIF          VARCHAR(20),
    Nombre       VARCHAR(20),
    Direccion    VARCHAR(20),
    Email        VARCHAR(20),
    Telefono     BIGINT
)
GO

ALTER TABLE Clinica_veterinaria 
	ADD constraint PK_clinica_veterinaria PRIMARY KEY  (ID_clinica)
GO

CREATE TABLE Tipo_intervencion (
    ID_tipointervencion       INT IDENTITY (1,1) NOT NULL,
    Nombre_tipointervencion   VARCHAR(20)
)
GO

ALTER TABLE tipo_intervencion
	 ADD CONSTRAINT PK_tipo_intervencion PRIMARY KEY  (ID_tipointervencion)
GO


CREATE TABLE Voluntario (
	ID_Voluntario				INT IDENTITY (1,1) NOT NULL,
	Nombre						VARCHAR(20) NOT NULL,
	Apellido					VARCHAR(30) NOT NULL,
	Telefono					BIGINT NOT NULL,
	Email						VARCHAR(50) NOT NULL,
)
GO

ALTER TABLE Voluntario
	 ADD CONSTRAINT PK_voluntario PRIMARY KEY  (ID_Voluntario)
GO

CREATE TABLE Cuida (
	CHIP						VARCHAR(20) NOT NULL,
	ID_Voluntario				INT IDENTITY (1,1) NOT NULL
)
GO

ALTER TABLE Cuida 
	ADD CONSTRAINT PK_cuida PRIMARY KEY  (CHIP, ID_Voluntario)
GO
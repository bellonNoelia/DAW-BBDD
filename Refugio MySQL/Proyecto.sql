DROP DATABASE IF EXISTS refugio_bln;

CREATE DATABASE IF NOT EXISTS refugio_bln;

USE refugio_bln;


CREATE TABLE Especie (
    ID_especie      INT auto_increment NOT NULL,
    Nombre_especie   varchar(20),
    PRIMARY KEY (ID_especie)
);

 CREATE TABLE Raza (
    ID_raza              INT auto_increment NOT NULL,
    Nombre_raza          VARCHAR(20),
    PRIMARY KEY (ID_raza)
);




CREATE TABLE IF NOT EXISTS animal (
	CHIP 						varchar(20) NOT NULL,
    Nombre						varchar(20) NOT NULL,
    Edad						INT NOT NULL,
	Potencialmente_peligroso	varchar(2) NOT NULL,
	Sexo						varchar (6) NOT NULL,
	Descripción					varchar(100) NOT NULL,
	Raza_id_raza				INT NOT NULL,
    primary key  (CHIP )
);


ALTER TABLE Animal ADD CONSTRAINT animal_raza_fk FOREIGN KEY ( raza_id_raza ) 
REFERENCES raza ( id_raza );

ALTER TABLE Animal
	ADD Esterilizado VARCHAR(2) NOT NULL;
    
    ALTER TABLE Animal
	DROP COLUMN Esterilizado;
    
    ALTER TABLE Animal rename mascota;
INSERT INTO raza
VALUES (1,'Bengalí'),
	   (2,'Azul Ruso '),
       (3,'Golden Retriever'),
       (4,'Border Collie');

SHOW FULL TABLES FROM refugio_bln;

Select * From raza;
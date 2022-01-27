USE BLN_Refugio
GO

--------A�adir FK------------------
ALTER TABLE Raza
    ADD CONSTRAINT raza_especie_fk FOREIGN KEY ( especie_id_especie )
        REFERENCES especie ( id_especie )
GO

ALTER TABLE Animal
    ADD CONSTRAINT animal_raza_fk FOREIGN KEY ( raza_id_raza )
        REFERENCES raza ( id_raza )
GO

ALTER TABLE Estado
    ADD CONSTRAINT estado_acogida_fk FOREIGN KEY ( acogida_id_acogida )
        REFERENCES acogida ( id_acogida )
GO

ALTER TABLE Estado
    ADD CONSTRAINT estado_animal_fk FOREIGN KEY ( animal_chip )
        REFERENCES animal ( chip )
GO

ALTER TABLE Acogida
    ADD CONSTRAINT acogida_tipo_acogida_fk FOREIGN KEY ( tipo_acogida_id_tipoacogida )
        REFERENCES tipo_acogida ( id_tipoacogida )
GO

ALTER TABLE historial
    ADD CONSTRAINT historial_acogida_fk FOREIGN KEY ( acogida_id_acogida )
        REFERENCES acogida ( id_acogida )
GO

ALTER TABLE historial
    ADD CONSTRAINT historial_responsable_acogida_fk FOREIGN KEY ( responsable_acogida_id_responsable )
        REFERENCES responsable_acogida ( id_responsable )
GO

ALTER TABLE Intervencion
    ADD CONSTRAINT intervencion_animal_fk FOREIGN KEY ( animal_chip )
        REFERENCES animal ( chip )
GO

ALTER TABLE Intervencion
    ADD CONSTRAINT intervencion_tipo_intervencion_fk FOREIGN KEY ( tipo_intervencion_id_tipointervencion )
        REFERENCES tipo_intervencion ( id_tipointervencion )
GO

ALTER TABLE Participa
    ADD CONSTRAINT participa_intervencion_fk FOREIGN KEY ( intervencion_id_intervencion )
        REFERENCES intervencion ( id_intervencion )
GO

ALTER TABLE Participa
    ADD CONSTRAINT participa_veterinario_fk FOREIGN KEY ( veterinario_id_veterinario )
        REFERENCES veterinario ( id_veterinario )
GO

ALTER TABLE Veterinario
    ADD CONSTRAINT veterinario_clinica_veterinaria_fk FOREIGN KEY ( clinica_veterinaria_id_clinica )
        REFERENCES clinica_veterinaria ( id_clinica )
GO

ALTER TABLE Cuida
    ADD CONSTRAINT FK_animal FOREIGN KEY ( CHIP )
        REFERENCES Animal ( CHIP )
GO

ALTER TABLE Cuida
    ADD CONSTRAINT FK_voluntario FOREIGN KEY ( ID_voluntario )
        REFERENCES Voluntario ( ID_voluntario )
GO

--------------------------A�adir columna---------------
ALTER TABLE Animal
	ADD Esterilizado VARCHAR(2) NOT NULL;
GO


---------Informaci�n de las tablas---------
sp_help ANIMAL
GO

sp_helpconstraint ANIMAL
GO

-------------------Borrar columna--------------------
-----debemos borrar primero la restricci�n con 
--ALTER TABLE  (NOMBRE TABLA) DROP CONSTRAINT (RESTRICCI�N) GO.
ALTER TABLE Animal
	DROP COLUMN Esterilizado;
GO

-------Modificar Columna-------------
ALTER TABLE Animal
	ALTER COLUMN Potencialmente_peligroso	VARCHAR(2) NULL,
GO
----------Expandir carecteres columna------------
ALTER TABLE Animal
ALTER COLUMN Nombre VARCHAR(50) NOT NULL;
GO

-----------------INSERTAR DATOS-----------------
INSERT INTO Animal
VALUES ('014SA', 'Luna', 5, 'No', 'Hembra', 'Desconfiada',4),
	   ('54DV68','Thor' ,1, 'No', 'Macho', 'Hiperactivo',1),
       ('1456SR','Nala',2,'No','Hembra','Cari�osa',2),
       ('589S2E','Karma',1,'Si','Macho','Tranquilo',3);
GO

INSERT INTO Voluntario
VALUES ('Cayetana','Garc�a Jim�nez', 6666666661, 'example1@mail.com'),
	   ('David','Montero Gonz�lez',6666666662, 'example2@mail.com'),
       ('Susana','P�rez P�rez',6666666663,'example3@mail.com'),
       ('Paula','Bra�as L�pez',6666666664,'example4@mail.com');
GO


--------Consultar datos tablas......
SELECT * FROM[dbo].[Animal]
GO

SELECT * FROM Voluntario
GO

------------Crear tabla "temporal" para crear modificaciones sin que se realicen cambios en la real------
SELECT * 
INTO Mascotas
FROM Animal
GO

SELECT * FROM Mascotas
GO

---------Eeliminar tabla------------
DROP TABLE IF EXISTS Voluntario
GO

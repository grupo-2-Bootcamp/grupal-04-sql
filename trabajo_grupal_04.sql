-- Crea y usa el schema appdata

CREATE SCHEMA appdata;
USE appdata;



-- Crea la base de datos de usuarios

CREATE TABLE users (
	id_usuario VARCHAR(15) NOT NULL PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	password VARCHAR(20) NOT NULL,
	zona_horaria VARCHAR(8) NULL DEFAULT 'UTC-3',
	genero CHAR(1) NULL,
	telefono INT NOT NULL,
	UNIQUE INDEX telefono_UNIQUE (telefono ASC) VISIBLE,
	UNIQUE INDEX id_usuario_UNIQUE (id_usuario ASC) VISIBLE
);



-- Crea la base de datos de registro de ingresos

CREATE TABLE ingresos (
	id_ingreso MEDIUMINT auto_increment NOT NULL PRIMARY KEY,
	id_usuario VARCHAR(25) NOT NULL,
	registro_ingreso TIMESTAMP NOT NULL
);



-- Modifica el valor de zona_horaria

ALTER TABLE users MODIFY COLUMN zona_horaria varchar(8) DEFAULT 'UTC-2' NULL;



-- Ingresa nuevos registros en users

INSERT INTO users (id_usuario, nombre, apellido, password, zona_horaria, genero, telefono)
VALUES
    ('jperez', 'Juan', 'Perez', 'abc123', 'GMT-5', 'M', '123456789'),
    ('mlopez', 'María', 'López', 'def456', 'GMT-3', 'F', '987654310'),
    ('pgarcia', 'Pedro', 'García', 'ghi789', 'GMT+2', 'M', '567890234'),
    ('ltorres', 'Laura', 'Torres', 'jkl012', 'GMT-4', 'F', '432109765'),
    ('crodriguez', 'Carlos', 'Rodríguez', 'mno345', 'GMT-6', 'M', '891234567'),
    ('asanchez', 'Ana', 'Sánchez', 'pqr678', 'GMT+1', 'F', '678905421'),
    ('lmartinez', 'Luis', 'Martínez', 'stu901', 'GMT-2', 'M', '345679012'),
    ('mgomez', 'Marta', 'Gómez', 'vwx234', 'GMT-3', 'F', '109876532');



-- Justificación de uso de tipos
-- id_usuario: Es VARCHAR porque es el metodo por que el usuario va a entrar al sistema
-- nombre, apellido: Es VARCHAR porque son palabras
-- password: Es VARCHAR porque tiene que contener letras, números, símbolos
-- zona_horaria: Es VARCHAR porque contiene texto y cumple con la configuración de valor predeterminado que se indicó
-- genero: Es CHAR porque solo tiene que contener 1 caracter para identificar el genero del usuario
-- telefono: Es INT porque es un número teléfonico.



-- Crea tabla contactos

CREATE TABLE contactos (
    id_contacto INT NOT NULL PRIMARY KEY,
    id_usuario VARCHAR(15) NOT NULL,
    telefono INT NOT NULL,
    email VARCHAR(25)
    );



-- Crea la relación de telefono entre contactos y users

ALTER TABLE contactos
   ADD CONSTRAINT FK_telefono_contacto
   FOREIGN KEY (telefono)
   REFERENCES users(telefono);
;

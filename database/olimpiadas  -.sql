DROP DATABASE IF EXISTS OLIMPIADAS_DIS;
CREATE DATABASE OLIMPIADAS_DIS;
USE OLIMPIADAS_DIS;
-- TABLAS 

CREATE TABLE personas
(
	idpersona		INT AUTO_INCREMENT PRIMARY KEY,
	apellidos		VARCHAR(50) 	NOT NULL,
	nombres			VARCHAR(50) 	NOT NULL,
	dni			CHAR(8)		NOT NULL,
	fechanac		DATE 		NOT NULL,
	direccion 		VARCHAR(100) 	NULL,
	telefono		CHAR(9) 	NULL,
	correo			VARCHAR(100) 	NOT NULL,
	estado			CHAR(1) 	NOT NULL DEFAULT '1',
	CONSTRAINT uk_dni_correo_per UNIQUE (dni)
)ENGINE = INNODB;

		
CREATE TABLE usuarios
(
	idusuario		INT AUTO_INCREMENT PRIMARY KEY,
	idpersona		INT 		NOT NULL,
	usuario			VARCHAR(50) 	NOT NULL,
	clave			VARCHAR(200) 	NOT NULL,
	nivelacceso		CHAR(3)		NOT NULL, -- ADMI - IVTD - 
	estado			CHAR(1) 	NOT NULL DEFAULT '1',
	create_at 		DATETIME 	NOT NULL DEFAULT NOW(),
	update_at 		DATETIME 	NULL,
	CONSTRAINT uk_usuario_user UNIQUE (usuario),
	CONSTRAINT fk_idpersona_user FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)ENGINE = INNODB;

CREATE TABLE olimpiadas
(
	idolimpiadas			INT AUTO_INCREMENT PRIMARY KEY,
	nombre					VARCHAR(60)	NOT NULL,
	fechainicio				DATE 	NOT NULL,
	fechafin					DATE 	NULL,
	CONSTRAINT uk_nombre_oli UNIQUE (nombre)
)ENGINE = INNODB;

SELECT * FROM olimpiadas;

CREATE TABLE delegaciones
(
	iddelegacion 		INT AUTO_INCREMENT PRIMARY KEY,
	delegacion 		VARCHAR(60)		NOT NULL,
	CONSTRAINT uk_delegacion_del UNIQUE (delegacion)
)ENGINE = INNODB;



CREATE TABLE disciplinas
(
	iddisciplinas		INT AUTO_INCREMENT PRIMARY KEY,
	disciplina			VARCHAR(40),
	CONSTRAINT uk_disciplina_dis UNIQUE (disciplina)
)ENGINE = INNODB;


CREATE TABLE detalle_disciplinas
(
	iddetalle		INT AUTO_INCREMENT PRIMARY KEY,
	idolimpiada		INT NOT NULL,
	iddisciplina		INT NOT NULL,
	CONSTRAINT fk_olimpiada_det FOREIGN KEY (idolimpiada) REFERENCES olimpiadas(idolimpiadas),
	CONSTRAINT fk_disciplina_det FOREIGN KEY (iddisciplina) REFERENCES disciplinas(iddisciplinas),
	CONSTRAINT uk_detalle_det UNIQUE (idolimpiada,iddisciplina)
)ENGINE = INNODB;

CREATE TABLE equipos
(
	idequipo 		INT AUTO_INCREMENT PRIMARY KEY,
	iddelegacion		INT 	NOT NULL,
	idparticipante		INT 	NOT NULL,	
	CONSTRAINT fk_delegacion_equi FOREIGN KEY (iddelegacion) REFERENCES delegaciones(iddelegacion), 
	CONSTRAINT fk_participantes_equi FOREIGN KEY (idparticipante) REFERENCES personas(idpersona),
	CONSTRAINT uk_equipo_equi UNIQUE (iddelegacion, idparticipante)
)ENGINE = INNODB;



CREATE TABLE integrantes
(
	idintegrantes 		INT AUTO_INCREMENT PRIMARY KEY,
	iddetalle		INT 	NOT NULL,
	idequipo		INT 	NOT NULL,	
	CONSTRAINT fk_equipo_int FOREIGN KEY (idequipo) REFERENCES equipos(idequipo),
	CONSTRAINT fk_detalle_int FOREIGN KEY (iddetalle) REFERENCES detalle_disciplinas(iddetalle),
	CONSTRAINT uk_integrante_int UNIQUE (idequipo, iddetalle)
)ENGINE = INNODB;



CREATE TABLE ganadores
(
	idganador 		INT AUTO_INCREMENT PRIMARY KEY,
	idintegrante	INT NOT NULL,
	puesto			CHAR(1)	NOT NULL, -- 1 = primer puesto, 2 segundo puesto, 3 tercer puesto,
	CONSTRAINT fk_integrante_gana FOREIGN KEY (idintegrante) REFERENCES integrantes(idintegrantes),
	CONSTRAINT uk_ganador_gana UNIQUE (idintegrante,puesto)
)ENGINE = INNODB;

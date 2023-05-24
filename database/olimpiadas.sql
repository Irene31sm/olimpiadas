CREATE DATABASE OLIMPIADAS;
USE OLIMPIADAS;
DROP DATABASE OLIMPIADAS;

-- PERSONAS
CREATE TABLE personas
(
	idpersona		INT AUTO_INCREMENT PRIMARY KEY,
	apellidos		VARCHAR(50) 	NOT NULL,
	nombres			VARCHAR(50) 	NOT NULL,
	dni				CHAR(8)			NOT NULL,
	fechanac			DATE 				NOT NULL,
	direccion 		VARCHAR(100) 	NOT NULL,
	telefono			CHAR(9) 			NOT NULL,
	correo			VARCHAR(100) 	NOT NULL,
	estado			CHAR(1) 			NOT NULL DEFAULT '1',
	CONSTRAINT uk_dni_per UNIQUE (dni)
)ENGINE = INNODB;

INSERT INTO personas(apellidos, nombres, dni, fechanac, direccion, telefono, correo) VALUES
('Suarez Matias', 'Irene Alejandra', '76364010','2002/01/31','av. America 262','902191414','alejandramatias31@gmail.com'),
('Tasayco Pachas', 'Kiara Yanina', '12345678','2001/10/07', 'av. balconcito 152','999123456','kiaraTasayco07@gmail.com'),
('Gutierrez Felipa', 'Frank Anderson', '98765432','2001/07/17', 'av. benavides 152','999123456','frank07@gmail.com'),
('Pachas Atuncar', 'Andrea', '76364011','2002/06/23', 'av. palmas 152','999123456','andreapachas23@gmail.com'),
('Hernandez Gomez', 'Geraldine', '76364012','2002/08/05', 'av. rosales 152','999123456','geraldinehg@gmail.com'),
('Rojas llanos', 'Joseph', '76364013','2001/10/21', 'psj los rosales','999123456','jjrojasllanos@gmail.com'),
('Rojas Pachas', 'Katherine', '76364014','2003/04/18', '','999123456','pachaskaterine@gmail.com');
				
SELECT * FROM personas;

-- USUARIOS
CREATE TABLE usuarios
(
	idusuario		INT AUTO_INCREMENT PRIMARY KEY,
	idpersona		INT 				NOT NULL,
	usuario			VARCHAR(50) 	NOT NULL,
	clave				VARCHAR(200) 	NOT NULL,
	estado			CHAR(1) 			NOT NULL DEFAULT '1',
	CONSTRAINT uk_usuario_user UNIQUE (usuario),
	CONSTRAINT fk_idpersona_user FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)ENGINE = INNODB;

INSERT INTO usuarios(idpersona, usuario, clave) VALUES 
	(1,'irene31', '76364010');

SELECT * FROM usuarios;

UPDATE usuarios SET clave ='$2y$10$8uCC9LJUYQVFlrh2VRfq5ez5zbl/heRhrnbD0P4UAcO5wB6Nr4Q/S'
		WHERE idusuario = 1;

-- COMISARIOS

CREATE TABLE comisarios 
(
	idcomisario		INT AUTO_INCREMENT PRIMARY KEY,
	idpersona 		INT NOT NULL,
	cargo				VARCHAR(20) NOT NULL
)ENGINE = INNODB;

INSERT INTO comisarios (idpersona, cargo) VALUES (3, 'Juez');

-- FEDERACIONES

CREATE TABLE federaciones
(
	idfederacion 	INT AUTO_INCREMENT PRIMARY KEY,
	federacion 		VARCHAR(60)	NOT NULL,
	distrito			VARCHAR(20)	NOT NULL,
	CONSTRAINT uk_federacion_fed UNIQUE (federacion) 	
)ENGINE = INNODB;


-- COMPLEJO DEPORTIVOS
CREATE TABLE complejo_deportivo
(
	idcomplejodeportivo 	INT AUTO_INCREMENT PRIMARY KEY,
	nombre_complejo		VARCHAR(60)	NOT NULL,
	ubicacion				VARCHAR(60) NOT NULL,
	sede						VARCHAR(60)	NOT NULL,
	tipo						VARCHAR(40) NOT NULL
)ENGINE = INNODB;


-- EVENTO
CREATE TABLE evento
(
	idevento					INT AUTO_INCREMENT PRIMARY KEY,
	idcomplejodeportivo	INT 			NOT NULL,
	idcomisario				INT 			NOT NULL,
	evento					VARCHAR(60)	NOT NULL,
	fechainicio				DATETIME 	NOT NULL,
	CONSTRAINT fk_complejo_eve FOREIGN KEY (idcomplejodeportivo) REFERENCES complejo_deportivo(idcomplejodeportivo),
	CONSTRAINT fk_comisario_eve FOREIGN KEY (idcomisario) REFERENCES comisario(idcomisario)
)ENGINE = INNODB;


-- PARTICIPANTES
CREATE TABLE participantes
(
	idparticipante	INT AUTO_INCREMENT PRIMARY KEY,
	idpersona		INT NOT NULL,
	disciplina 		VARCHAR(40) NOT NULL,
	idfederacion  	INT NOT NULL,
	CONSTRAINT fk_idpersona_part FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
	CONSTRAINT fk_federacion_part FOREIGN KEY(idfederacion) REFERENCES federacion(idfederacion)
)ENGINE=INNODB;


-- DETALLE DE EVENTO
CREATE TABLE detalle_evento
(
	iddetalle	INT PRIMARY KEY AUTO_INCREMENT,
	idevento		INT NOT NULL,
	idparticipantes INT NOT NULL,
	CONSTRAINT fk_idevento_det FOREIGN KEY (idevento) REFERENCES evento(idevento),
	CONSTRAINT fk_idparticipante FOREIGN KEY (idparticipante) REFERENCES participantes(idparticipante)
)ENGINE=INNODB;


-- PROCEDIMIENTOS ALMACENADOS
-- login
DELIMITER $$
CREATE PROCEDURE spu_login_usuarios
(
	IN _usuario VARCHAR(50)
)
BEGIN
	SELECT idusuario, usuario, clave
	FROM usuarios
	WHERE usuario = _usuario;
END $$

CALL spu_login_usuarios('irene31');

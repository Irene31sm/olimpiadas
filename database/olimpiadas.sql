CREATE DATABASE OLIMPIADAS;
USE OLIMPIADAS;
DROP DATABASE OLIMPIADAS;

-- PERSONAS
CREATE TABLE personas
(
	idpersona		INT AUTO_INCREMENT PRIMARY KEY,
	apellidos		VARCHAR(50) 	NOT NULL,
	nombres			VARCHAR(50) 	NOT NULL,
	dni			CHAR(8)		NOT NULL,
	fechanac		DATE 		NOT NULL,
	direccion 		VARCHAR(100) 	NULL,
	telefono		CHAR(9) 	NOT NULL,
	correo			VARCHAR(100) 	NOT NULL,
	estado			CHAR(1) 	NOT NULL DEFAULT '1',
	CONSTRAINT uk_dni_correo_per UNIQUE (dni, correo)
)ENGINE = INNODB;

INSERT INTO personas(apellidos, nombres, dni, fechanac, direccion, telefono, correo) VALUES
('Suarez Matias', 'Irene Alejandra', '76364010','2002/01/31','av. America 262','902191414','alejandramatias31@gmail.com'),
('Tasayco Pachas', 'Kiara Yanina', '12345678','2001/10/07', 'av. balconcito 152','999123456','kiaraTasayco07@gmail.com'),
('Gutierrez Felipa', 'Frank Anderson', '98765432','2001/07/17', 'av. benavides 152','999123456','frank07@gmail.com'),
('Pachas Atuncar', 'Andrea', '76364011','2002/06/23', 'av. palmas 152','999123456','andreapachas23@gmail.com'),
('Hernandez Gomez', 'Geraldine', '76364012','2002/08/05', 'av. rosales 152','999123456','geraldinehg@gmail.com'),
('Rojas llanos', 'Joseph', '76364013','2001/10/21', 'psj los rosales','999123456','jjrojasllanos@gmail.com'),
('Rojas Pachas', 'Katherine', '76364014','2003/04/18', NULL,'999123456','pachaskaterine@gmail.com'),
('Tasayco Hernandez', 'Juan', '76364015','2002/01/31','av. America 262','902191414','juan_hb@gmail.com'),
('Vilca Magallanes', 'Maria', '12345679','2001/10/07', 'av. balconcito 152','999123456','marcia29@gmail.com'),
('Castillo perez', 'fernanda', '98765433','2001/07/17', 'av. benavides 152','999123456','fer_castillo@gmail.com'),
('Huaman Torres', 'Carlos', '76364016','2002/06/23', 'av. palmas 152','999123456','torrescarlos@gmail.com'),
('Anchante Martinez', 'Jose ', '76364017','2002/08/05', 'av. rosales 152','999123456','jose_martinez@gmail.com'),
('Levano Pachas', 'Celeste', '76364018','2001/10/21', 'psj los rosales','999123456','celeste_123@gmail.com'),
('Rojas Pachas', 'Katherine', '76364019','2003/04/18', NULL,'999123456','katy_25@gmail.com');
		
SELECT * FROM personas;

-- USUARIOS
CREATE TABLE usuarios
(
	idusuario		INT AUTO_INCREMENT PRIMARY KEY,
	idpersona		INT 		NOT NULL,
	usuario			VARCHAR(50) 	NOT NULL,
	clave			VARCHAR(200) 	NOT NULL,
	estado			CHAR(1) 	NOT NULL DEFAULT '1',
	CONSTRAINT uk_usuario_user UNIQUE (usuario),
	CONSTRAINT fk_idpersona_user FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)ENGINE = INNODB;

INSERT INTO usuarios(idpersona, usuario, clave) VALUES 
	(1,'irene31', '76364010');

UPDATE usuarios SET clave = "$2y$10$XAuSPSjRRCQRvdpMDbvMz.tA8U3jo7XF3IF1vuGYITv/ROFj9g0Kq" WHERE idusuario = 1;
UPDATE usuarios SET clave = '$2y$10$6l64SgQiLw/JChl5/LZLpunseifu/zLQYgYUeNkW.JGDgrleyAiwu' WHERE idusuario = 2;
SELECT * FROM usuarios;

-- COMISARIOS

CREATE TABLE comisarios 
(
	idcomisario		INT AUTO_INCREMENT PRIMARY KEY,
	idpersona 		INT NOT NULL,
	cargo			VARCHAR(20) NOT NULL
)ENGINE = INNODB;

INSERT INTO comisarios (idpersona, cargo) VALUES (3, 'Juez'),(4,'Juez');

SELECT * FROM comisarios;

-- COMPLEJO DEPORTIVOS
CREATE TABLE complejo_deportivo
(
	idcomplejodeportivo 	INT AUTO_INCREMENT PRIMARY KEY,
	nombre_complejo		VARCHAR(60)	NOT NULL,
	ubicacion		VARCHAR(60)	NOT NULL,
	sede			VARCHAR(60)	NOT NULL,
	tipo			VARCHAR(40) 	NOT NULL
)ENGINE = INNODB;

INSERT INTO complejo_deportivo (nombre_complejo, ubicacion, sede, tipo) VALUES
('Polideportivo municipal', 'Av. Santos Nagaro 299', 'chincha alta', 'polideportivo'),
('Bom Bom Coronado', 'Bom Bom Coronado #411', 'chincha alta', 'polideportivo'),
('Complejo Deportivo Dany', 'Av. San Idelfonso LOTE. A ', 'Sunampe', 'polideportivo');
-- EVENTO
CREATE TABLE evento
(
	idevento		INT AUTO_INCREMENT PRIMARY KEY,
	idcomplejodeportivo	INT 		NOT NULL,
	idcomisario1		INT 		NOT NULL,
	idcomisario2		INT 		NOT NULL,
	evento			VARCHAR(60)	NOT NULL,
	fechainicio		DATETIME 	NOT NULL,
	fechafin		DATETIME 	NULL,
	CONSTRAINT fk_complejo_eve FOREIGN KEY (idcomplejodeportivo) REFERENCES complejo_deportivo(idcomplejodeportivo),
	CONSTRAINT fk_comisario1_eve FOREIGN KEY (idcomisario1) REFERENCES comisarios(idcomisario),
	CONSTRAINT fk_comisario2_eve FOREIGN KEY (idcomisario2) REFERENCES comisarios(idcomisario)
)ENGINE = INNODB;

INSERT INTO evento (idcomplejodeportivo,idcomisario1, idcomisario2, evento, fechainicio) VALUES
(1,1,2,'Natacion I', '2023-06-05 13:00'),
(2,2,1,'Atletismo I', '2023-06-05 15:00');

SELECT * FROM evento;
DROP TABLE evento;

-- Disciplinas
CREATE TABLE disciplinas
(
	iddisciplina	INT AUTO_INCREMENT PRIMARY KEY,
	disciplina	VARCHAR(40),
	CONSTRAINT uk_disiplina_dis UNIQUE (disciplina)
)ENGINE=INNODB;

INSERT INTO disciplinas (disciplina) VALUES 
('Natacion'),
('Tenis'),
('Atletismo'),
('Ciclismo'),
('Gimnasia'),
('Karate'),
('Futbol'),
('Voleibol');

SELECT * FROM disciplinas;
-- PARTICIPANTES

CREATE TABLE participantes
(
	idparticipante		INT AUTO_INCREMENT PRIMARY KEY,
	idpersona		INT 		NOT NULL,
	iddisciplina 		INT 		NOT NULL,
	distrito	  	VARCHAR(40) 	NOT NULL,
	CONSTRAINT fk_idpersona_part FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
	CONSTRAINT fk_disciplina_part FOREIGN KEY(iddisciplina) REFERENCES disciplinas(iddisciplina),
	CONSTRAINT uk_partici_part UNIQUE (idpersona, iddisciplina)
)ENGINE=INNODB;

INSERT INTO participantes (idpersona,iddisciplina,distrito) VALUES
(7,3,'Sunampe'),
(8,3,'Pueblo Nuevo'),
(9,3,'Chincha alta'),
(10,3,'Chincha Baja'),
(11,3,'Grocio Prado'),
(12,3,'El Carmen'),
(13,3,'Tambo de mora'),
(14,3,'San Juan de Yanac'),
(6,3,'Chavin'),
(5,3,'San pedro de Huarcarpana'),
(4,3,'Alto Laran');


SELECT * FROM participantes;

-- DETALLE DE EVENTO
CREATE TABLE detalle_evento
(
	iddetalle	INT PRIMARY KEY AUTO_INCREMENT,
	idevento	INT NOT NULL,
	idparticipante 	INT NOT NULL,
	puesto		CHAR(2) NULL,
	CONSTRAINT fk_idevento_det FOREIGN KEY (idevento) REFERENCES evento(idevento),
	CONSTRAINT fk_idparticipante FOREIGN KEY (idparticipante) REFERENCES participantes(idparticipante)
)ENGINE=INNODB;

INSERT INTO detalle_evento (idevento, idparticipante) VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11);
SELECT * FROM detalle_evento;

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


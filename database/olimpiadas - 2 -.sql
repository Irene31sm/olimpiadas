CREATE DATABASE OLIMPIADAS_1;
USE OLIMPIADAS_1;
DROP DATABASE OLIMPIADAS_1;
-- TABLAS 
CREATE TABLE personas
(
	idpersona		INT AUTO_INCREMENT PRIMARY KEY,
	apellidos		VARCHAR(50) 	NOT NULL,
	nombres			VARCHAR(50) 	NOT NULL,
	dni				CHAR(8)			NOT NULL,
	fechanac			DATE 				NOT NULL,
	direccion 		VARCHAR(100) 	NULL,
	telefono			CHAR(9) 			NULL,
	correo			VARCHAR(100) 	NOT NULL,
	estado			CHAR(1) 			NOT NULL DEFAULT '1',
	CONSTRAINT uk_dni_correo_per UNIQUE (dni, correo)
)ENGINE = INNODB;

-- insertando datos
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
		

CREATE TABLE usuarios
(
	idusuario		INT AUTO_INCREMENT PRIMARY KEY,
	idpersona		INT 				NOT NULL,
	usuario			VARCHAR(50) 	NOT NULL,
	clave				VARCHAR(200) 	NOT NULL,
	estado			CHAR(1) 	NOT NULL DEFAULT '1',
	CONSTRAINT uk_usuario_user UNIQUE (usuario),
	CONSTRAINT fk_idpersona_user FOREIGN KEY (idpersona) REFERENCES personas(idpersona)
)ENGINE = INNODB;

-- insertando datos 
INSERT INTO usuarios(idpersona, usuario, clave) VALUES 
	(1, 'irene31', '1234'),
	(2,'kiara07', '1234');

-- Actualizando datos con encriptado
UPDATE usuarios SET clave = "$2y$10$XAuSPSjRRCQRvdpMDbvMz.tA8U3jo7XF3IF1vuGYITv/ROFj9g0Kq" WHERE idusuario = 1;
UPDATE usuarios SET clave = '$2y$10$6l64SgQiLw/JChl5/LZLpunseifu/zLQYgYUeNkW.JGDgrleyAiwu' WHERE idusuario = 2;

CREATE TABLE olimpiadas
(
	idolimpiadas			INT AUTO_INCREMENT PRIMARY KEY,
	nombre					VARCHAR(60)	NOT NULL,
	fechainicio				DATETIME 	NOT NULL,
	fechafin					DATETIME 	NULL,
	CONSTRAINT uk_nombre_oli UNIQUE (nombre)
)ENGINE = INNODB;

INSERT INTO olimpiadas (nombre, fechainicio, fechafin) VALUES
('OLIMPIADAS DISTRITALES 2022','2022-06-15','2022-06-30'),
('OLIMPIADAS DISTRITALES 2023','2023-06-12',NULL);

CREATE TABLE delegaciones
(
	iddelegacion 		INT AUTO_INCREMENT PRIMARY KEY,
	delegacion 			VARCHAR(60)		NOT NULL,
	CONSTRAINT uk_delegacion_del UNIQUE (delegacion)
)ENGINE = INNODB;

INSERT INTO delegaciones (delegacion) VALUES
('Sunampe'),
('Pueblo Nuevo'),
('Chincha Alta'),
('Chincha Baja'),
('Grocio Prado'),
('El Carmen'),
('Tambo de mora'),
('Alto Laran'),
('Chavin'),
('San Juan de Yanac'),
('San pedro de Huarcarpana');

SELECT * FROM delegacion;

CREATE TABLE disciplinas
(
	iddisciplinas		INT AUTO_INCREMENT PRIMARY KEY,
	disciplina			VARCHAR(40),
	CONSTRAINT uk_disciplina_dis UNIQUE (disciplina)
)ENGINE = INNODB;

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

CREATE TABLE detalle_disciplinas
(
	iddetalle				 	INT AUTO_INCREMENT PRIMARY KEY,
	idolimpiada					INT NOT NULL,
	iddisciplina				INT NOT NULL,
	CONSTRAINT fk_olimpiada_dis FOREIGN KEY (idolimpiada) REFERENCES olimpiadas(idolimpiadas),
	CONSTRAINT fk_disciplina_dis FOREIGN KEY (iddisciplina) REFERENCES disciplinas(iddisciplinas)
)ENGINE = INNODB;

INSERT INTO detalle_disciplinas (idolimpiada, iddisciplina) VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,3),
(2,4);
SELECT * FROM detalle_disciplinas;

SELECT detalle_disciplinas.iddetalle, olimpiadas.nombre, disciplinas.disciplina
FROM detalle_disciplinas 
INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina;

CREATE TABLE integrantes
(
	idintegrante 		INT AUTO_INCREMENT PRIMARY KEY,
	iddelegacion		INT 	NOT NULL,
	idparticipante		INT 	NOT NULL,
	iddetalle			INT 	NOT NULL,
	CONSTRAINT fk_delegacion_int FOREIGN KEY (iddelegacion) REFERENCES delegaciones(iddelegacion), 
	CONSTRAINT fk_participantes_int FOREIGN KEY (idparticipante) REFERENCES personas(idpersona),
	CONSTRAINT fk_detalle_int FOREIGN KEY (iddetalle) REFERENCES detalle_disciplinas(iddetalle)
)ENGINE = INNODB;

INSERT INTO integrantes (iddelegacion, idparticipante, iddetalle) VALUES
(1,12,1),
(2,10,1),
(3,9,1),
(4,11,1),
(5,8,2),
(6,7,2),
(6,6,2),
(1,5,2);

SELECT 	integrantes.idintegrante, 
			olimpiadas.nombre, 
			disciplinas.disciplina, 
			personas.nombres, 
			personas.apellidos,
			delegaciones.delegacion
FROM integrantes
INNER JOIN personas ON personas.idpersona = integrantes.idparticipante
INNER JOIN delegaciones ON delegaciones.iddelegacion = integrantes.iddelegacion
INNER JOIN detalle_disciplinas ON detalle_disciplinas.iddetalle = integrantes.iddetalle
INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina


CREATE TABLE ganadores
(
	idganador 		INT AUTO_INCREMENT PRIMARY KEY,
	idintegrante	INT NOT NULL,
	puesto			CHAR(1)	NOT NULL, -- 1 = primer puesto, 2 segundo puesto, 3 tercer puesto,
	CONSTRAINT fk_integrante_gana FOREIGN KEY (idintegrante) REFERENCES integrantes(idintegrante)
)ENGINE = INNODB;

INSERT INTO ganadores (idintegrante, puesto) VALUES 
(1,'1'),
(3,'2'),
(4,'3'),
(8,'1'),
(5,'2'),
(7,'3');

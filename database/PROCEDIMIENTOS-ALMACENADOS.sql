USE OLIMPIADAS;


-- INICIO DE SESION
DELIMITER $$
CREATE PROCEDURE SPU_LOGIN_USUARIOS
(
	IN _usuario VARCHAR(50)
)
BEGIN
	SELECT 	usuarios.idusuario, 
				usuarios.usuario, 
				usuarios.clave,
				personas.nombres, 
				personas.apellidos,
				personas.correo
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuario = _usuario;
END $$

-- Listar disciplinas 
DELIMITER $$
CREATE PROCEDURE SPU_LISTAR_DISCIPLINAS()
BEGIN 
	SELECT * 
	FROM disciplinas
	ORDER BY iddisciplinas;
END $$

-- Listar delegaciones
DELIMITER $$
CREATE PROCEDURE SPU_LISTAR_DELEGACIONES()
BEGIN 
	SELECT * 
	FROM delegaciones
	ORDER BY iddelegacion;
END $$

-- LISTAR OLIMPIADAS POR AÑO:
DELIMITER $$
CREATE PROCEDURE SPU_LISTA_ANUAL_OLIMPIADAS
(
	IN _fecha CHAR(4)
	-- in _iddisciplina int	
)
BEGIN
	
	SELECT 	ganadores.`puesto`,
		olimpiadas.nombre, 	
		disciplinas.disciplina, 
		personas.nombres, 
		personas.apellidos,
		delegaciones.delegacion
		
	FROM ganadores
	INNER JOIN integrantes ON integrantes.idintegrantes = ganadores.idintegrante
	INNER JOIN equipos ON equipos.`idequipo` = integrantes.`idequipo`
	INNER JOIN personas ON personas.idpersona = equipos.`idparticipante`
	INNER JOIN delegaciones ON delegaciones.iddelegacion = equipos.`iddelegacion`
	INNER JOIN detalle_disciplinas ON detalle_disciplinas.iddetalle = integrantes.iddetalle
	INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
	INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina
	WHERE olimpiadas.fechainicio LIKE CONCAT(_fecha,'%') -- and disciplinas.`iddisciplinas` = _iddisciplina
	ORDER BY ganadores.`puesto`, YEAR(olimpiadas.fechainicio);
END $$

-- listar años
DELIMITER $$
CREATE PROCEDURE SPU_LISTA_POR_OLIMPIADAS()
BEGIN
	SELECT idolimpiadas, YEAR(fechainicio) 'fecha'
	FROM olimpiadas;
END $$

DELIMITER $$
CREATE PROCEDURE SPU_LISTAR_DISCIPLINAS_ANUAL( IN _idolimpiada INT)
BEGIN 
	SELECT disciplinas.`iddisciplinas`, disciplinas.disciplina
	FROM detalle_disciplinas 
	INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
	INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina
	WHERE olimpiadas.`idolimpiadas` = _idolimpiada;
END $$

CALL SPU_LISTAR_DISCIPLINAS_ANUAL(1);



-- listar personas
DELIMITER $$
CREATE PROCEDURE SPU_LISTA_PERSONAS()
BEGIN
	SELECT *
	FROM personas;
END $$

DELIMITER $$
CREATE PROCEDURE SPU_REGISTRAR_PERSONA
(
IN _apellidos 	VARCHAR(50),
IN _nombres 	VARCHAR(50),
IN _dni 			CHAR(8),
IN _fechanac 	DATE,
IN _direccion 	VARCHAR(100),
IN _telefono 	CHAR(9),
IN _correo 		VARCHAR(100)
)
BEGIN 
	IF _direccion = '' THEN SET _direccion = NULL;END IF;
	IF _telefono = '' THEN SET _telefono = NULL;END IF;
	INSERT INTO personas(apellidos, nombres, dni, fechanac, direccion, telefono, correo) VALUES 
	(_apellidos,_nombres, _dni, _fechanac,  _direccion, _telefono, _correo);
END $$

-- RERGISTRAR INTEGRANTE
DELIMITER $$
CREATE PROCEDURE SPU_REGISTRAR_EQUIPO
(
	IN _iddelegacion INT,
	IN _idparticipante INT
)
BEGIN 
	INSERT INTO equipos (iddelegacion, idparticipante) VALUES (_iddelegacion,_idparticipante);
END $$



-- 
DELIMITER $$ 
CREATE PROCEDURE SPU_LISTAR_DETALLE()
BEGIN
	SELECT detalle_disciplinas.iddetalle, disciplinas.disciplina, YEAR(olimpiadas.fechainicio) 'fecha'
	FROM detalle_disciplinas 
	INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
	INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina
	WHERE YEAR(olimpiadas.fechainicio) LIKE YEAR(NOW()) AND YEAR(NOW()+1);
END $$

CALL SPU_LISTAR_DETALLE();
CALL SPU_REGISTRAR_EQUIPO(2,5);
CALL SPU_REGISTRAR_PERSONA('Fernandez, Tasayco', 'Jonathan', '76364020', '1999-02-15','av. manco capac 451','999555111', 'jvbdfh@gmail.com');
CALL SPU_LISTA_PERSONAS();
CALL SPU_LISTA_POR_OLIMPIADAS();


CALL SPU_LISTA_ANUAL_OLIMPIADAS('2023');
CALL SPU_LOGIN_USUARIOS('irene31');
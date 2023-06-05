USE olimpiadas_dis;


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
				personas.correo,
				usuarios.`nivelacceso`
	FROM usuarios
	INNER JOIN personas ON personas.idpersona = usuarios.idpersona
	WHERE usuario = _usuario;
END $$

-- LISTAR
-- DISCIPLINAS
DELIMITER $$
CREATE PROCEDURE SPU_LISTAR_DISCIPLINAS()
BEGIN 
	SELECT * 
	FROM disciplinas
	ORDER BY iddisciplinas;
END $$

-- DELEGACIONES
DELIMITER $$
CREATE PROCEDURE SPU_LISTAR_DELEGACIONES()
BEGIN 
	SELECT * 
	FROM delegaciones
	ORDER BY iddelegacion;
END $$

-- LISTAR PERSONAS
DELIMITER $$
CREATE PROCEDURE SPU_LISTA_PERSONAS()
BEGIN
	SELECT *
	FROM personas;
END $$


-- LISTAR OLIMPIADAS POR AÑO
DELIMITER $$
CREATE PROCEDURE SPU_LISTA_OLIMPIADAS()
BEGIN
	SELECT idolimpiadas, nombre ,YEAR(fechainicio) 'fecha', nombre, fechainicio, fechafin
	FROM olimpiadas;
END $$

-- buscar 
DELIMITER $$
CREATE PROCEDURE SPU_BUSCAR_DISCIPLINA(IN _iddisciplina INT)
BEGIN
	SELECT iddisciplinas, disciplina
	FROM disciplinas
	WHERE iddisciplinas = _iddisciplina;
END $$
-- editar
DELIMITER $$
CREATE PROCEDURE SPU_EDITAR_DISCIPLINA
(
IN _iddisciplina INT,
IN _disciplina VARCHAR(40)
)
BEGIN
	UPDATE disciplinas SET disciplina = _disciplina WHERE iddisciplinas = _iddisciplina;
END $$
-- LISTAR DETALLE_DISCIPLINAS 
DELIMITER $$ 
CREATE PROCEDURE SPU_LISTAR_DETALLE()
BEGIN
	SELECT detalle_disciplinas.iddetalle, olimpiadas.`idolimpiadas`, olimpiadas.`nombre` ,disciplinas.disciplina, YEAR(olimpiadas.fechainicio) 'fecha'
	FROM detalle_disciplinas 
	INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
	INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina
	WHERE YEAR(olimpiadas.fechainicio) LIKE YEAR(NOW()) AND YEAR(NOW()+1);
END $$

-- LISTAR GANADORES POR AÑO
DELIMITER $$
CREATE PROCEDURE SPU_LISTA_GANADORES_FECHA
(
	IN _idolimpiada INT,
	IN _iddisciplina INT	
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
	WHERE olimpiadas.`idolimpiadas` = _idolimpiada AND disciplinas.`iddisciplinas` = _iddisciplina
	ORDER BY ganadores.`puesto`, olimpiadas.`idolimpiadas`;
END $$

CALL SPU_LISTA_GANADORES_FECHA(1,1);
-- LISTAR DISCIPLINAS POR OLIMPIADA
DELIMITER $$
CREATE PROCEDURE SPU_FILTRO_DISCIPLINAS_ANUAL
( 
	IN _idolimpiada INT
)
BEGIN 
	SELECT disciplinas.`iddisciplinas`, disciplinas.disciplina
	FROM detalle_disciplinas 
	INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
	INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina
	WHERE olimpiadas.`idolimpiadas` = _idolimpiada;
END $$

CALL SPU_FILTRO_DISCIPLINAS_ANUAL(1);

-- FILTRO POR DELEGACION Y DISCIPLINA
DELIMITER $$
CREATE PROCEDURE SPU_FILTRO_DELEGACION_DISCIPLINA
(
	IN _iddelegacion INT,
	IN _iddisciplina INT
)
BEGIN
	SELECT 	integrantes.idintegrantes 'id',
	delegaciones.`delegacion`,disciplinas.`disciplina`, olimpiadas.nombre,
	personas.`nombres`, personas.`apellidos`,
	YEAR(olimpiadas.`fechainicio`) 'fecha'
	FROM integrantes
	INNER JOIN equipos ON equipos.idequipo = integrantes.idequipo
	INNER JOIN personas ON personas.idpersona = equipos.idparticipante
	INNER JOIN delegaciones ON delegaciones.iddelegacion = equipos.iddelegacion
	INNER JOIN detalle_disciplinas ON detalle_disciplinas.iddetalle = integrantes.iddetalle
	INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
	INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina
	WHERE equipos.`iddelegacion` =  _iddelegacion AND detalle_disciplinas.`iddisciplina` = _iddisciplina ;
END $$

-- FILTRO DE DISCIPLINAS POR DELEGACION EN INTEGRANTES
DELIMITER $$
CREATE PROCEDURE SPU_FILTRO_DELEGACION(IN _iddelegacion INT)
BEGIN 
	SELECT 	integrantes.idintegrantes 'id',equipos.`idequipo` ,equipos.`iddelegacion`,
	delegaciones.`delegacion`, disciplinas.`iddisciplinas`,
	disciplinas.`disciplina`, olimpiadas.nombre ,YEAR(olimpiadas.fechainicio) 'fecha',
	personas.`nombres`, personas.`apellidos`
	FROM integrantes
	INNER JOIN equipos ON equipos.idequipo = integrantes.idequipo
	INNER JOIN personas ON personas.idpersona = equipos.idparticipante
	INNER JOIN delegaciones ON delegaciones.iddelegacion = equipos.iddelegacion
	INNER JOIN detalle_disciplinas ON detalle_disciplinas.iddetalle = integrantes.iddetalle
	INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
	INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina
	WHERE equipos.`iddelegacion` = _iddelegacion AND YEAR(olimpiadas.`fechainicio`) LIKE YEAR(NOW()) AND YEAR(NOW()+1);
END $$


-- FILTRAR PARTICIPANTES DE DELEGACION POR EQUIPOS
DELIMITER $$
CREATE PROCEDURE SPU_EQUIPOS_PARTCIPANTES(IN _iddelegacion INT)
BEGIN
	SELECT equipos.`idequipo`, delegaciones.`delegacion`, personas.`nombres`,personas.`apellidos`
	FROM equipos
	INNER JOIN delegaciones ON delegaciones.`iddelegacion` = equipos.`iddelegacion`
	INNER JOIN personas ON personas.`idpersona` = equipos.`idparticipante` 
	WHERE delegaciones.`iddelegacion` = _iddelegacion;
END $$

CALL SPU_EQUIPOS_PARTCIPANTES(2);
-- REGISTRAR PERSONA
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

CALL SPU_REGISTRAR_EQUIPO(11,18);


-- REGISTRAR INTEGRANTES
DELIMITER $$
CREATE PROCEDURE SPU_REGISTRAR_INTEGRANTES
(
	IN _iddetalle INT,
	IN _idequipo INT
)
BEGIN 
	INSERT INTO integrantes (iddetalle, idequipo) VALUES (_iddetalle,_idequipo);
END $$

CALL SPU_REGISTRAR_INTEGRANTES(9,21);

-- REGISTAR GANADORES
DELIMITER $$
CREATE PROCEDURE SPU_REGISTRAR_GANADORES
(
	IN _idintegrantes INT,
	IN _puesto INT
)
BEGIN 
	INSERT INTO ganadores (idintegrante, puesto) VALUES (_idintegrantes, _puesto);
END $$


DELIMITER $$
CREATE PROCEDURE SPU_REGISTRAR_OLIMPIADA
(
	IN _nombre VARCHAR(60),
	IN _fechainicio DATE,
	IN _fechafin DATE
)
BEGIN 
	INSERT INTO olimpiadas (nombre, fechainicio, fechafin) VALUES (_nombre, _fechainicio, _fechafin);
END $$

CALL SPU_REGISTRAR_OLIMPIADA('Olimpiada 2025','2025/05/05','2025/06/05');

-- GRAFICOS
-- CANTIDAD DE PARTICIPANTES REGISTRADOS POR DICIPLINA POR AÑO0
DELIMITER $$
CREATE PROCEDURE GRAFICO_INTEGRANTES(IN _idolimpiada INT )
BEGIN 
	SELECT 	COUNT(integrantes.idintegrantes) 'Participantes', disciplinas.disciplina,YEAR(olimpiadas.`fechainicio`)
	FROM integrantes
	INNER JOIN equipos ON equipos.idequipo = integrantes.idequipo
	INNER JOIN personas ON personas.idpersona = equipos.idparticipante
	INNER JOIN delegaciones ON delegaciones.iddelegacion = equipos.iddelegacion
	INNER JOIN detalle_disciplinas ON detalle_disciplinas.iddetalle = integrantes.iddetalle
	INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
	INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina
	WHERE olimpiadas.idolimpiadas = _idolimpiada
	GROUP BY disciplinas.iddisciplinas;
END $$
	
DELIMITER $$
CREATE PROCEDURE GRAFICO_MEDALLAS(IN _idolimpiada INT )
BEGIN 
	SELECT 	COUNT(ganadores.`puesto`) 'Medallas',
		delegaciones.delegacion
	FROM ganadores
	INNER JOIN integrantes ON integrantes.idintegrantes = ganadores.idintegrante
	INNER JOIN equipos ON equipos.`idequipo` = integrantes.`idequipo`
	INNER JOIN personas ON personas.idpersona = equipos.`idparticipante`
	INNER JOIN delegaciones ON delegaciones.iddelegacion = equipos.`iddelegacion`
	INNER JOIN detalle_disciplinas ON detalle_disciplinas.iddetalle = integrantes.iddetalle
	INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
	WHERE olimpiadas.idolimpiadas = _idolimpiada AND(ganadores.puesto = 1 OR ganadores.puesto = 2 OR ganadores.puesto = 3)
	GROUP BY delegaciones.iddelegacion, olimpiadas.idolimpiadas
	ORDER BY  delegaciones.delegacion;
END $$

DELIMITER $$
CREATE PROCEDURE REPORTE_INTEGRANTES(IN _idolimpiada INT )
BEGIN 
	SELECT 	integrantes.idintegrantes 'id',
	delegaciones.`delegacion`,disciplinas.`disciplina`,
	personas.`nombres`, personas.`apellidos`,
	YEAR(olimpiadas.`fechainicio`) 'fecha'
	FROM integrantes
	INNER JOIN equipos ON equipos.idequipo = integrantes.idequipo
	INNER JOIN personas ON personas.idpersona = equipos.idparticipante
	INNER JOIN delegaciones ON delegaciones.iddelegacion = equipos.iddelegacion
	INNER JOIN detalle_disciplinas ON detalle_disciplinas.iddetalle = integrantes.iddetalle
	INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
	INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina
	WHERE olimpiadas.`idolimpiadas` = _idolimpiada 
	ORDER BY delegaciones.`delegacion`;
END $$

DELIMITER $$
CREATE PROCEDURE REPORTE_GANADORES(IN _idolimpiada INT )
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
	WHERE olimpiadas.`idolimpiadas` = _idolimpiada
	ORDER BY disciplinas.`disciplina`, ganadores.`puesto`;
END $$
	
CALL REPORTE_GANADORES(1);

CALL SPU_LISTAR_DETALLE();
CALL SPU_REGISTRAR_EQUIPO(2,5);
CALL SPU_REGISTRAR_PERSONA('Fernandez, Tasayco', 'Jonathan', '76364020', '1999-02-15','av. manco capac 451','999555111', 'jvbdfh@gmail.com');
CALL SPU_LISTA_PERSONAS();
CALL SPU_LISTA_POR_OLIMPIADAS();
CALL SPU_LISTA_OLIMPIADAS();

CALL SPU_LISTA_ANUAL_OLIMPIADAS('2023');
CALL SPU_LOGIN_USUARIOS('irene31');
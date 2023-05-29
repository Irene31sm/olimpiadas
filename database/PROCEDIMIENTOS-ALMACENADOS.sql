USE OLIMPIADAS_1;


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

-- LISTAR OLIMPIADAS POR AÑO:
DELIMITER $$
CREATE PROCEDURE SPU_LISTA_ANUAL_OLIMPIADAS

CALL SPU_LOGIN_USUARIOS('irene31');
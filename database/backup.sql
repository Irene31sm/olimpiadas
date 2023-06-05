/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.25-MariaDB : Database - olimpiadas_dis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`olimpiadas_dis` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `olimpiadas_dis`;

/*Table structure for table `delegaciones` */

DROP TABLE IF EXISTS `delegaciones`;

CREATE TABLE `delegaciones` (
  `iddelegacion` int(11) NOT NULL AUTO_INCREMENT,
  `delegacion` varchar(60) NOT NULL,
  PRIMARY KEY (`iddelegacion`),
  UNIQUE KEY `uk_delegacion_del` (`delegacion`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `delegaciones` */

insert  into `delegaciones`(`iddelegacion`,`delegacion`) values 
(8,'Alto Laran'),
(9,'Chavin'),
(3,'Chincha Alta'),
(4,'Chincha Baja'),
(6,'El Carmen'),
(5,'Grocio Prado'),
(2,'Pueblo Nuevo'),
(1,'Sunampe'),
(7,'Tambo de mora');

/*Table structure for table `detalle_disciplinas` */

DROP TABLE IF EXISTS `detalle_disciplinas`;

CREATE TABLE `detalle_disciplinas` (
  `iddetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idolimpiada` int(11) NOT NULL,
  `iddisciplina` int(11) NOT NULL,
  PRIMARY KEY (`iddetalle`),
  UNIQUE KEY `uk_detalle_det` (`idolimpiada`,`iddisciplina`),
  KEY `fk_disciplina_det` (`iddisciplina`),
  CONSTRAINT `fk_disciplina_det` FOREIGN KEY (`iddisciplina`) REFERENCES `disciplinas` (`iddisciplinas`),
  CONSTRAINT `fk_olimpiada_det` FOREIGN KEY (`idolimpiada`) REFERENCES `olimpiadas` (`idolimpiadas`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

/*Data for the table `detalle_disciplinas` */

insert  into `detalle_disciplinas`(`iddetalle`,`idolimpiada`,`iddisciplina`) values 
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,4),
(5,1,5),
(6,1,6),
(7,2,1),
(8,2,2),
(9,2,3),
(10,2,4),
(11,2,5),
(12,2,6),
(13,2,7),
(14,3,1),
(15,3,2),
(16,3,3),
(17,3,4),
(18,3,6),
(19,3,8);

/*Table structure for table `disciplinas` */

DROP TABLE IF EXISTS `disciplinas`;

CREATE TABLE `disciplinas` (
  `iddisciplinas` int(11) NOT NULL AUTO_INCREMENT,
  `disciplina` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`iddisciplinas`),
  UNIQUE KEY `uk_disciplina_dis` (`disciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `disciplinas` */

insert  into `disciplinas`(`iddisciplinas`,`disciplina`) values 
(3,'Atletismo'),
(4,'Ciclismo'),
(8,'Esgrima‎'),
(6,'Gimnasia en trampolin'),
(5,'Gimnasia Ritmica'),
(7,'Karate'),
(1,'Natación'),
(2,'Tenis');

/*Table structure for table `equipos` */

DROP TABLE IF EXISTS `equipos`;

CREATE TABLE `equipos` (
  `idequipo` int(11) NOT NULL AUTO_INCREMENT,
  `iddelegacion` int(11) NOT NULL,
  `idparticipante` int(11) NOT NULL,
  PRIMARY KEY (`idequipo`),
  UNIQUE KEY `uk_equipo_equi` (`iddelegacion`,`idparticipante`),
  KEY `fk_participantes_equi` (`idparticipante`),
  CONSTRAINT `fk_delegacion_equi` FOREIGN KEY (`iddelegacion`) REFERENCES `delegaciones` (`iddelegacion`),
  CONSTRAINT `fk_participantes_equi` FOREIGN KEY (`idparticipante`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

/*Data for the table `equipos` */

insert  into `equipos`(`idequipo`,`iddelegacion`,`idparticipante`) values 
(1,1,3),
(2,1,4),
(3,1,5),
(4,1,6),
(5,1,7),
(6,1,8),
(55,1,59),
(7,2,9),
(8,2,10),
(9,2,11),
(10,2,12),
(11,2,13),
(12,2,14),
(56,2,60),
(13,3,15),
(14,3,16),
(15,3,17),
(16,3,18),
(17,3,19),
(18,3,20),
(57,3,61),
(19,4,21),
(20,4,22),
(21,4,23),
(22,4,24),
(23,4,25),
(24,4,26),
(58,4,62),
(25,5,28),
(26,5,29),
(27,5,30),
(28,5,31),
(29,5,32),
(30,5,33),
(59,5,63),
(31,6,34),
(32,6,35),
(33,6,36),
(34,6,37),
(35,6,38),
(36,6,39),
(60,6,64),
(37,7,40),
(38,7,41),
(39,7,42),
(40,7,43),
(41,7,44),
(42,7,45),
(61,7,65),
(43,8,47),
(44,8,48),
(45,8,49),
(46,8,50),
(47,8,51),
(48,8,52),
(62,8,66),
(49,9,53),
(50,9,54),
(51,9,55),
(52,9,56),
(53,9,57),
(54,9,58),
(63,9,67);

/*Table structure for table `ganadores` */

DROP TABLE IF EXISTS `ganadores`;

CREATE TABLE `ganadores` (
  `idganador` int(11) NOT NULL AUTO_INCREMENT,
  `idintegrante` int(11) NOT NULL,
  `puesto` char(1) NOT NULL,
  PRIMARY KEY (`idganador`),
  UNIQUE KEY `uk_ganador_gana` (`idintegrante`,`puesto`),
  CONSTRAINT `fk_integrante_gana` FOREIGN KEY (`idintegrante`) REFERENCES `integrantes` (`idintegrantes`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ganadores` */

insert  into `ganadores`(`idganador`,`idintegrante`,`puesto`) values 
(3,1,'1'),
(10,3,'2'),
(12,5,'1'),
(4,7,'2'),
(11,9,'3'),
(20,12,'3'),
(13,17,'2'),
(6,20,'1'),
(14,23,'3'),
(17,28,'3'),
(18,30,'1'),
(7,32,'2'),
(9,33,'1'),
(19,36,'2'),
(15,40,'1'),
(8,44,'3'),
(5,49,'3'),
(16,52,'2'),
(1,55,'1');

/*Table structure for table `integrantes` */

DROP TABLE IF EXISTS `integrantes`;

CREATE TABLE `integrantes` (
  `idintegrantes` int(11) NOT NULL AUTO_INCREMENT,
  `iddetalle` int(11) NOT NULL,
  `idequipo` int(11) NOT NULL,
  PRIMARY KEY (`idintegrantes`),
  UNIQUE KEY `uk_integrante_int` (`idequipo`,`iddetalle`),
  KEY `fk_detalle_int` (`iddetalle`),
  CONSTRAINT `fk_detalle_int` FOREIGN KEY (`iddetalle`) REFERENCES `detalle_disciplinas` (`iddetalle`),
  CONSTRAINT `fk_equipo_int` FOREIGN KEY (`idequipo`) REFERENCES `equipos` (`idequipo`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4;

/*Data for the table `integrantes` */

insert  into `integrantes`(`idintegrantes`,`iddetalle`,`idequipo`) values 
(1,1,1),
(55,7,1),
(2,2,2),
(56,8,2),
(3,3,3),
(57,9,3),
(4,4,4),
(58,10,4),
(5,5,5),
(59,11,5),
(6,6,6),
(60,12,6),
(7,1,7),
(62,7,7),
(8,2,8),
(63,8,8),
(9,3,9),
(64,9,9),
(10,4,10),
(65,10,10),
(11,5,11),
(66,11,11),
(12,6,12),
(67,12,12),
(13,1,13),
(69,7,13),
(14,2,14),
(70,8,14),
(15,3,15),
(71,9,15),
(16,4,16),
(72,10,16),
(17,5,17),
(73,11,17),
(18,6,18),
(74,12,18),
(19,1,19),
(76,7,19),
(20,2,20),
(77,8,20),
(21,3,21),
(78,9,21),
(22,4,22),
(79,10,22),
(23,5,23),
(80,11,23),
(24,6,24),
(81,12,24),
(25,1,25),
(83,7,25),
(26,2,26),
(84,8,26),
(27,3,27),
(85,9,27),
(28,4,28),
(86,10,28),
(29,5,29),
(87,11,29),
(30,6,30),
(88,12,30),
(31,1,31),
(90,7,31),
(32,2,32),
(91,8,32),
(33,3,33),
(92,9,33),
(34,4,34),
(93,10,34),
(35,5,35),
(94,11,35),
(36,6,36),
(95,12,36),
(37,1,37),
(97,7,37),
(38,2,38),
(98,8,38),
(39,3,39),
(99,9,39),
(40,4,40),
(100,10,40),
(41,5,41),
(101,11,41),
(42,6,42),
(102,12,42),
(43,1,43),
(104,7,43),
(44,2,44),
(105,8,44),
(45,3,45),
(106,9,45),
(46,4,46),
(107,10,46),
(47,5,47),
(108,11,47),
(48,6,48),
(109,12,48),
(49,1,49),
(111,7,49),
(50,2,50),
(112,8,50),
(51,3,51),
(113,9,51),
(52,4,52),
(114,10,52),
(53,5,53),
(115,11,53),
(54,6,54),
(116,12,54),
(61,13,55),
(68,13,56),
(75,13,57),
(82,13,58),
(89,13,59),
(96,13,60),
(103,13,61),
(110,13,62),
(117,13,63);

/*Table structure for table `olimpiadas` */

DROP TABLE IF EXISTS `olimpiadas`;

CREATE TABLE `olimpiadas` (
  `idolimpiadas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `fechainicio` datetime NOT NULL,
  `fechafin` datetime DEFAULT NULL,
  PRIMARY KEY (`idolimpiadas`),
  UNIQUE KEY `uk_nombre_oli` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `olimpiadas` */

insert  into `olimpiadas`(`idolimpiadas`,`nombre`,`fechainicio`,`fechafin`) values 
(1,'OLIMPIADAS DISTRITALES 2022','2022-06-15 00:00:00','2022-06-30 00:00:00'),
(2,'OLIMPIADAS DISTRITALES 2023','2023-06-12 00:00:00',NULL),
(3,'OLIMPIADAS DISTRITALES 2024','2024-07-15 00:00:00',NULL);

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `dni` char(8) NOT NULL,
  `fechanac` date NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpersona`),
  UNIQUE KEY `uk_dni_correo_per` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4;

/*Data for the table `personas` */

insert  into `personas`(`idpersona`,`apellidos`,`nombres`,`dni`,`fechanac`,`direccion`,`telefono`,`correo`,`estado`) values 
(1,'Suarez Matias','Irene Alejandra','76364010','2002-01-31','av. America 262','902191414','alejandramatias31@gmail.com','1'),
(2,'Tasayco Pachas','Kiara Yanina','76364011','2001-10-07','av. balconcito 152','999123456','kiaraTasayco07@gmail.com','1'),
(3,'Gutierrez Felipa','Frank Anderson','76364012','2001-07-17','av. benavides 152','999123456','frank07@gmail.com','1'),
(4,'Pachas Atuncar','Andrea','76364013','2002-06-23','av. palmas 152','999123456','andreapachas23@gmail.com','1'),
(5,'Hernandez Gomez','Geraldine','76364014','2002-08-05','av. rosales 152','999123456','geraldinehg@gmail.com','1'),
(6,'Rojas llanos','Joseph','76364015','2001-10-21','psj los rosales','999123456','jjrojasllanos@gmail.com','1'),
(7,'Rojas Pachas','Katherine','76364016','2003-04-18',NULL,'999123456','pachaskaterine@gmail.com','1'),
(8,'Tasayco Hernandez','Juan','76364017','2002-01-31','av. America 262','902191414','juan_hb@gmail.com','1'),
(9,'Vilca Magallanes','Maria','76364018','2001-10-07','av. balconcito 152','999123456','marcia29@gmail.com','1'),
(10,'Castillo perez','fernanda','76364019','2001-07-17','av. benavides 152','999123456','fer_castillo@gmail.com','1'),
(11,'Huaman Torres','Carlos','76364020','2002-06-23','av. palmas 152','999123456','torrescarlos@gmail.com','1'),
(12,'Anchante Martinez','Jose ','76364021','2002-08-05','av. rosales 152','999123456','jose_martinez@gmail.com','1'),
(13,'Levano Pachas','Celeste','76364022','2001-10-21','psj los rosales','999123456','celeste_123@gmail.com','1'),
(14,'Rojas Pachas','Katherine','76364023','2003-04-18',NULL,'999123456','katy_25@gmail.com','1'),
(15,'Peral gonsales','Ines','76364024','2002-01-31','av. America 262','902191414','ines@gmail.com','1'),
(16,'lazaro rios','Kevin','76364025','2001-10-07','av. balconcito 152','999123456','kevin@gmail.com','1'),
(17,'rios gonsales','Fernanda','76364026','2001-07-17','av. benavides 152','999123456','fernanda@gmail.com','1'),
(18,'garcia ramos','Armando','76364027','2002-06-23','av. palmas 152','999123456','armando@gmail.com','1'),
(19,'Carbajal cruz','Tamy','76364028','2002-08-05','av. rosales 152','999123456','Tamy@gmail.com','1'),
(20,'aldave leon','Jesus','76364029','2001-10-21','psj los rosales','999123456','jesus_leo@gmail.com','1'),
(21,'Romero tasayco','Korina','76364030','2003-04-18',NULL,'999123456','korina@gmail.com','1'),
(22,'Diaz carbajal','Javier','76364031','2002-01-31','av. America 262','902191414','javier@gmail.com','1'),
(23,'Ruiz perez','Mario','76364032','2001-10-07','av. balconcito 152','999123456','mario@gmail.com','1'),
(24,'Lopez Sosa','Rosa','76364033','2001-07-17','av. benavides 152','999123456','rosa@gmail.com','1'),
(25,'Fernandez Ruiz','Carmen','76364034','2002-06-23','av. palmas 152','999123456','carmen@gmail.com','1'),
(26,'Herrera Benitez','jacinto ','76364035','2002-08-05','av. rosales 152','999123456','jacinto@gmail.com','1'),
(27,'Martinez Martinez','Carlos','76364036','2001-10-21','psj los rosales','999123456','carlos@gmail.com','1'),
(28,'Ramirez Aguirre','Karen','76364037','2003-04-18',NULL,'999123456','karen@gmail.com','1'),
(29,'Rodriguez flores','Alana','76364038','2002-01-31','av. America 262','902191414','alana@gmail.com','1'),
(30,'Sanchez Sosa','Yanina','76364039','2001-10-07','av. balconcito 152','999123456','yanina@gmail.com','1'),
(31,'Fernandez Martinez','Andres','76364040','2001-07-17','av. benavides 152','999123456','andres@gmail.com','1'),
(32,'Gutierrez Ramos','Olga','76364041','2002-06-23','av. palmas 152','999123456','olga@gmail.com','1'),
(33,'Aguirre Acosta','Flavia','76364042','2002-08-05','av. rosales 152','999123456','flavia@gmail.com','1'),
(34,'Sanchez diaz','Carmen','76364043','2001-10-21','psj los rosales','999123456','carmen@gmail.com','1'),
(35,'gimenez Flores','Paola','76364044','2003-04-18',NULL,'999123456','paola@gmail.com','1'),
(36,'jones fox','Paolo','76364045','2002-01-31','av. America 262','902191414','paolo@gmail.com','1'),
(37,'de la fuente torres','Mauricio','76364046','2001-10-07','av. balconcito 152','999123456','mauricio_torres@gmail.com','1'),
(38,'Osorio riva','Valentina','76364047','2001-07-17','av. benavides 152','999123456','valentina_riva@gmail.com','1'),
(39,'Ochoa Aguilera','Matias','76364048','2002-06-23','av. palmas 152','999123456','matias_osorio@gmail.com','1'),
(40,'Zedepa roman','Julia','76364049','2002-08-05','av. rosales 152','999123456','julia_123@gmail.com','1'),
(41,'huaman perez','Emmanuel','76364050','2001-10-21','psj los rosales','999123456','emanuel_123@gmail.com','1'),
(42,'cabajal galindo','Jonathan','76364051','2003-04-18',NULL,'999123456','jonathan_cg@gmail.com','1'),
(43,'Carrion','Francisco','76364071','2003-04-18',NULL,'999123456','francis123@gmail.com','1'),
(44,'Neyra luna','Liliana','76364072','2001-10-07','av. balconcito 152','999123456','lili123456@gmail.com','1'),
(45,'Vilela Atuncar','Andrew','76364073','2001-07-17','av. benavides 152','999123456','2001_andrew@gmail.com','1'),
(46,'Ramos Anchante','Emir','76364074','2002-06-23','av. palmas 152','999123456','emir_123@gmail.com','1'),
(47,'Chico pachas','Maikel','76364075','2002-08-05','av. rosales 152','999123456','maikel@gmail.com','1'),
(48,'Abregu Ramos','Nelcia','76364076','2001-10-21','psj los rosales','999123456','nelcia@gmail.com','1'),
(49,'Fernandez Becerra','pathy','76364077','2003-04-18',NULL,'999123456','pathy@gmail.com','1'),
(50,'Becerra Suarez','Sara','76364078','2002-01-31','av. America 262','902191414','sarita@gmail.com','1'),
(51,'Castillo Paucar','Marcos','76364079','2001-10-07','av. balconcito 152','999123456','marcos_147@gmail.com','1'),
(52,'Salvador ramos','Milagros','76364080','2001-07-17','av. benavides 152','999123456','mili_salvador@gmail.com','1'),
(53,'Salvador ortiz','Estela','76364081','2002-06-23','av. palmas 152','999123456','estelita@gmail.com','1'),
(54,'Matias Quispe','Emilio','76364082','2002-08-05','av. rosales 152','999123456','emilio_quispe@gmail.com','1'),
(55,'quispe Hernandez','Jota','76364083','2001-10-21','psj los rosales','999123456','jota123@gmail.com','1'),
(56,'Paucar martinez','Cris','76364084','2003-04-18',NULL,'999123456','cris@gmail.com','1'),
(57,'García','Juan','76364052','1985-03-12','Calle 123','999777444','juan.garcia@gmail.com','1'),
(58,'López','María','76364053','1990-07-25','Avenida 456','990123456','maria.lopez@gmail.com','1'),
(59,'Martínez','Pedro','76364054','1982-11-05',' Calle Principal 789','963852741','pedro.martinez@gmail.com','1'),
(60,'Rodríguez','Ana','76364055','1995-02-18','Plaza 567','951236874','ana.rodriguez@gmail.com','1'),
(61,'González','Luisa','76364056','1988-09-30','Paseo 890','963852741','luisa.gonzalez@gmail.com','1'),
(62,'Sánchez','Carlos','76364057','1987-06-23','Avenida Central 123','98712365','carlos.sanchez@gmail.com','1'),
(63,'Torres','Laura','76364058','1992-04-15','Calle Secundaria 456','987412365','laura.torres@gmail.com','1'),
(64,'Ramírez','José','76364059','1980-12-08','Avenida Principal 789','901236547','jose.ramirez@gmail.com','1'),
(65,'Herrera','Gabriela','76364060','1998-10-02','Plaza Central 012','951478520','gabriela.herrera@gmail.com','1'),
(66,'Castro','Andrés','76364061','1993-08-14','Calle Mayor 345','999222111','andres.castro@gmail.com','1'),
(67,'guzman','Pedro','76364062','1990-07-25','Avenida 456','990123456','pedro.guzman@gmail.com','1'),
(68,'Ortiz','Emilio','76364063','1982-11-05',' Calle Principal 789','963852741','emilio.ortiz@gmail.com','1'),
(69,'Roman','Arturo','76364064','1995-02-18','Plaza 567','951236874','arturo.roman@gmail.com','1'),
(70,'Silva','Leonardo','76364065','1988-09-30','Paseo 890','963852741','leonardo.silva@gmail.com','1'),
(71,'Romero','Patricia','76364066','1987-06-23','Avenida Central 123','98712365','patriciaromero@gmail.com','1'),
(72,'Diaz','Astrid','76364067','1992-04-15','Calle Secundaria 456','987412365','astrid.diaz@gmail.com','1'),
(73,'Vargas','Javier','76364068','1980-12-08','Avenida Principal 789','901236547','javier.vargas@gmail.com','1'),
(74,'Rios','Carmen','76364069','1998-10-02','Plaza Central 012','951478520','carmen.rios@gmail.com','1'),
(75,'Peralta','Juana','76364070','1993-08-14','Calle Mayor 345','999222111','juana.peralta@gmail.com','1');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `nivelacceso` char(3) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `uk_usuario_user` (`usuario`),
  KEY `fk_idpersona_user` (`idpersona`),
  CONSTRAINT `fk_idpersona_user` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`idpersona`,`usuario`,`clave`,`nivelacceso`,`estado`,`create_at`,`update_at`) values 
(1,1,'irene31','$2y$10$XAuSPSjRRCQRvdpMDbvMz.tA8U3jo7XF3IF1vuGYITv/ROFj9g0Kq','ADM','1','2023-06-04 17:58:53',NULL),
(2,2,'kiara07','$2y$10$6l64SgQiLw/JChl5/LZLpunseifu/zLQYgYUeNkW.JGDgrleyAiwu','EDT','1','2023-06-04 17:58:53',NULL);

/* Procedure structure for procedure `GRAFICO_INTEGRANTES` */

/*!50003 DROP PROCEDURE IF EXISTS  `GRAFICO_INTEGRANTES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GRAFICO_INTEGRANTES`(IN _idolimpiada INT )
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `GRAFICO_MEDALLAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `GRAFICO_MEDALLAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GRAFICO_MEDALLAS`(IN _idolimpiada INT )
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `REPORTE_GANADORES` */

/*!50003 DROP PROCEDURE IF EXISTS  `REPORTE_GANADORES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_GANADORES`(IN _idolimpiada INT )
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `REPORTE_INTEGRANTES` */

/*!50003 DROP PROCEDURE IF EXISTS  `REPORTE_INTEGRANTES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_INTEGRANTES`(IN _idolimpiada INT )
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_BUSCAR_DISCIPLINA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_BUSCAR_DISCIPLINA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_BUSCAR_DISCIPLINA`(in _iddisciplina int)
BEGIN
	select iddisciplinas, disciplina
	from disciplinas
	where iddisciplinas = _iddisciplina;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_EDITAR_DISCIPLINA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_EDITAR_DISCIPLINA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_EDITAR_DISCIPLINA`(
in _iddisciplina int,
IN _disciplina varchar(40)
)
BEGIN
	update disciplinas set disciplina = _disciplina where iddisciplinas = _iddisciplina;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_EQUIPOS_PARTCIPANTES` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_EQUIPOS_PARTCIPANTES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_EQUIPOS_PARTCIPANTES`(IN _iddelegacion INT)
BEGIN
	SELECT equipos.`idequipo`, delegaciones.`delegacion`, personas.`nombres`,personas.`apellidos`
	FROM equipos
	INNER JOIN delegaciones ON delegaciones.`iddelegacion` = equipos.`iddelegacion`
	INNER JOIN personas ON personas.`idpersona` = equipos.`idparticipante` 
	WHERE delegaciones.`iddelegacion` = _iddelegacion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_FILTRO_DELEGACION` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_FILTRO_DELEGACION` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_FILTRO_DELEGACION`(IN _iddelegacion INT)
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_FILTRO_DELEGACION_DISCIPLINA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_FILTRO_DELEGACION_DISCIPLINA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_FILTRO_DELEGACION_DISCIPLINA`(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_FILTRO_DISCIPLINAS_ANUAL` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_FILTRO_DISCIPLINAS_ANUAL` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_FILTRO_DISCIPLINAS_ANUAL`( 
	IN _idolimpiada INT
)
BEGIN 
	SELECT disciplinas.`iddisciplinas`, disciplinas.disciplina
	FROM detalle_disciplinas 
	INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
	INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina
	WHERE olimpiadas.`idolimpiadas` = _idolimpiada;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_LISTAR_DELEGACIONES` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_LISTAR_DELEGACIONES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_LISTAR_DELEGACIONES`()
BEGIN 
	SELECT * 
	FROM delegaciones
	ORDER BY iddelegacion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_LISTAR_DETALLE` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_LISTAR_DETALLE` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_LISTAR_DETALLE`()
BEGIN
	SELECT detalle_disciplinas.iddetalle, olimpiadas.`idolimpiadas`, olimpiadas.`nombre` ,disciplinas.disciplina, YEAR(olimpiadas.fechainicio) 'fecha'
	FROM detalle_disciplinas 
	INNER JOIN olimpiadas ON olimpiadas.idolimpiadas = detalle_disciplinas.idolimpiada
	INNER JOIN disciplinas ON disciplinas.iddisciplinas = detalle_disciplinas.iddisciplina
	WHERE YEAR(olimpiadas.fechainicio) LIKE YEAR(NOW()) AND YEAR(NOW()+1);
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_LISTAR_DISCIPLINAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_LISTAR_DISCIPLINAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_LISTAR_DISCIPLINAS`()
BEGIN 
	SELECT * 
	FROM disciplinas
	ORDER BY iddisciplinas;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_LISTA_GANADORES_FECHA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_LISTA_GANADORES_FECHA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_LISTA_GANADORES_FECHA`(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_LISTA_OLIMPIADAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_LISTA_OLIMPIADAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_LISTA_OLIMPIADAS`()
BEGIN
	SELECT idolimpiadas, nombre ,YEAR(fechainicio) 'fecha', nombre, fechainicio, fechafin
	FROM olimpiadas;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_LISTA_PERSONAS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_LISTA_PERSONAS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_LISTA_PERSONAS`()
BEGIN
	SELECT *
	FROM personas;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_LOGIN_USUARIOS` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_LOGIN_USUARIOS` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_LOGIN_USUARIOS`(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_REGISTRAR_EQUIPO` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_REGISTRAR_EQUIPO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_REGISTRAR_EQUIPO`(
	IN _iddelegacion INT,
	IN _idparticipante INT
)
BEGIN 
	INSERT INTO equipos (iddelegacion, idparticipante) VALUES (_iddelegacion,_idparticipante);
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_REGISTRAR_GANADORES` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_REGISTRAR_GANADORES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_REGISTRAR_GANADORES`(
	IN _idintegrantes INT,
	IN _puesto INT
)
BEGIN 
	INSERT INTO ganadores (idintegrante, puesto) VALUES (_idintegrantes, _puesto);
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_REGISTRAR_INTEGRANTES` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_REGISTRAR_INTEGRANTES` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_REGISTRAR_INTEGRANTES`(
	IN _iddetalle INT,
	IN _idequipo INT
)
BEGIN 
	INSERT INTO integrantes (iddetalle, idequipo) VALUES (_iddetalle,_idequipo);
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_REGISTRAR_OLIMPIADA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_REGISTRAR_OLIMPIADA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_REGISTRAR_OLIMPIADA`(
	IN _nombre varchar(60),
	IN _fechainicio date,
	in _fechafin date
)
BEGIN 
	INSERT INTO olimpiadas (nombre, fechainicio, fechafin) VALUES (_nombre, _fechainicio, _fechafin);
END */$$
DELIMITER ;

/* Procedure structure for procedure `SPU_REGISTRAR_PERSONA` */

/*!50003 DROP PROCEDURE IF EXISTS  `SPU_REGISTRAR_PERSONA` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SPU_REGISTRAR_PERSONA`(
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
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

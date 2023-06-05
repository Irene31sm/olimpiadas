<?php

require_once '../models/equipos.php';

if(isset($_POST['operacion'])){
  $equipo = new Equipo();  

  if($_POST['operacion'] == 'listarParticipante'){
    $datos = $equipo->listarEquiposParticipantes($_POST['iddelegacion']);    
    echo json_encode($datos);    
  }

  if($_POST['operacion'] == 'registrarEquipo'){
    $datosGuardados =[
      "iddelegacion"           => $_POST['iddelegacion'],
      "idparticipante"         => $_POST['idparticipante']
    ];
      $respuesta = $equipo->registrarEquipos($datosGuardados);
      echo json_encode($respuesta);
  }
  if($_POST['operacion'] == 'listarUltimo'){
    $dato = $persona->listarUltimaPersona();    
    echo json_encode($dato);    
  }

}
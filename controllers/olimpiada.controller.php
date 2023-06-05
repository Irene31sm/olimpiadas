<?php

require_once '../models/olimpiada.php';

if(isset($_POST['operacion'])){
  $olimpiada = new Olimpiada();

  if($_POST['operacion'] == 'listarAnual'){
    $datos = $olimpiada->listaAnualGanadores($_POST['idolimpiada'],$_POST['iddisciplina']);
    if($datos) {
      echo json_encode($datos);
    }
    else{
      $mensaje = "No existen datos";
      echo json_encode($mensaje);
    }
    
  }
  if($_POST['operacion'] == 'listarOlimpiadas'){
    $datos = $olimpiada->listaOlimpiadas();
    
  echo json_encode($datos);
    
  }

  if($_POST['operacion'] == 'registrarGanador'){
    $datosGuardados =[
      "idintegrante"           => $_POST['idintegrante'],
      "puesto"                 => $_POST['puesto']
    ];
      $respuesta = $olimpiada->registrarGanador($datosGuardados);
      echo json_encode($respuesta);
  }

  if($_POST['operacion'] == 'registrarOlimpiada'){
    $datosGuardados =[
      "nombre"                      => $_POST['nombre'],
      "fechainicio"                 => $_POST['fechainicio'],
      "fechafin"                    => $_POST['fechafin']
    ];
      $respuesta = $olimpiada->registrarOlimpiada($datosGuardados);
      echo json_encode($respuesta);
  }


}
<?php

require_once '../models/integrantes.php';

if(isset($_POST['operacion'])){
  $integrante = new Integrante();

  if($_POST['operacion'] == 'registrarIntegrantes'){
    $datosGuardados =[
      "iddetalle"               => $_POST['iddetalle'],
      "idequipo"               => $_POST['idequipo']
    ];
      $respuesta = $integrante->registrarIntegrantes($datosGuardados);
      echo json_encode($respuesta);
  }
  if($_POST['operacion'] == 'grafico1'){
    $datos = $integrante->grafico1($_POST['idolimpiada']);    
    echo json_encode($datos);    
  }  

  if($_POST['operacion'] == 'grafico2'){
    $datos = $integrante->grafico2($_POST['idolimpiada']);    
    echo json_encode($datos);    
  } 

  if($_POST['operacion'] == 'reporte1'){
    $datos = $integrante->reporte1($_POST['idolimpiada']);    
    echo json_encode($datos);    
  } 
}

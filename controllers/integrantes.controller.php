<?php

require_once '../models/integrantes.php';

if(isset($_POST['operacion'])){
  $integrante = new Integrante();

  if($_POST['operacion'] == 'registrar'){
    $datosGuardados =[
      "iddelegacion"           => $_POST['iddelegacion'],
      "idparticipante"         => $_POST['idparticipante'],
      "iddetalle"               => $_POST['iddetalle']
    ];
      $respuesta = $integrante->registrarIntegrantes($datosGuardados);
      echo json_encode($respuesta);
  }
  

}

<?php

require_once '../models/olimpiada.php';

if(isset($_POST['operacion'])){
  $olimpiada = new Olimpiada();

  if($_POST['operacion'] == 'listarAnual'){
    $datos = $olimpiada->listaAnual($_POST['anual']);
    if($datos) {
      echo json_encode($datos);
    }
    
  }
  if($_POST['operacion'] == 'listarOlimpiadas'){
    $datos = $olimpiada->listaOlimpiadas();
    
  echo json_encode($datos);
    
  }
}
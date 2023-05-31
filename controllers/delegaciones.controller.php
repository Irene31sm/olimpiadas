<?php

require_once '../models/delegaciones.php';

if(isset($_POST['operacion'])){
  $delegacion = new Delegacion();

  if($_POST['operacion'] == 'listar'){
    $datos = $delegacion->listarDelegaciones();
    
  echo json_encode($datos);
    
  }
}
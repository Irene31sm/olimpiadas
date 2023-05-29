<?php

require_once '../models/detalle_eventos.php';

if(isset($_POST['operacion'])){
  $detalle = new Detalle();

  if($_POST['operacion'] == 'listar'){
    $datos = $detalle->listarTodosEventos();
    
  echo json_encode($datos);
    
  }
}
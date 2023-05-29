<?php

require_once '../models/disciplina.php';

if(isset($_POST['operacion'])){
  $disciplina = new Disciplina();

  if($_POST['operacion'] == 'listar'){
    $datos = $disciplina->listarDisciplinas();
    
  echo json_encode($datos);
    
  }
}
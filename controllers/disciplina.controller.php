<?php

require_once '../models/disciplina.php';

if(isset($_POST['operacion'])){
  $disciplina = new Disciplina();

  if($_POST['operacion'] == 'listar'){
    $datos = $disciplina->listarDisciplinas();    
    echo json_encode($datos);    
  }
  if($_POST['operacion'] == 'filtroDisciplinas'){
    $datos = $disciplina->filtroDisciplinas($_POST['idolimpiada']);    
    echo json_encode($datos);    
  }

  if($_POST['operacion'] == 'listarDetalle'){
    $datos = $disciplina->listarDetalle();    
    echo json_encode($datos);    
  }

  if($_POST['operacion'] == 'listarDisciplina_delegacion'){
    $datos = $disciplina->filtroDisciplinas_delegacion($_POST['iddelegacion']);    
    echo json_encode($datos);    
  }

  if($_POST['operacion'] == 'listarParticipante'){
    $datos = $disciplina->listarParticipante($_POST['iddelegacion'], $_POST['iddisciplina']);    
    echo json_encode($datos);    
  }

  if($_POST['operacion'] == 'buscarDisciplina'){
    $datos = $disciplina->buscar($_POST['iddisciplina']);    
    echo json_encode($datos);    
  }

  if($_POST['operacion'] == 'editarDisciplina'){
    $datosGuardados =[
      "iddisciplinas"                      => $_POST['iddisciplinas'],
      "disciplina"                          => $_POST['disciplina']
    ];
      $respuesta = $disciplina->editarDisciplina($datosGuardados);
      echo json_encode($respuesta);
  }

}
<?php

require_once '../models/personas.php';

if(isset($_POST['operacion'])){
  $persona = new Persona();

  if($_POST['operacion'] == 'registrar'){
    $datosGuardados =[
      "nombres"           => $_POST['nombres'],
      "apellidos"         => $_POST['apellidos'],
      "dni"               => $_POST['dni'],
      "fechanac"          => $_POST['fechanac'], 
      "direccion"         => $_POST['direccion'],
      "telefono"          => $_POST['telefono'],
      "correo"            => $_POST['correo']
    ];
      $respuesta = $automovil->registrarPersona($datosGuardados);
      echo json_encode($respuesta);
  }
}
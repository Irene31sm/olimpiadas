<?php
require_once '../models/usuario.php';

if(isset($_POST['operacion'])){
  $usuario = new Usuario();

  if($_POST['operacion'] == 'destroy'){
    session_destroy();
    session_unset();
    header('Location: ../index.html');
  }

  if($_POST['operacion'] == 'login'){
    $resultado = [
      "acceso" => false,
      "mensaje" => ""
    ];

    $data = $usuario->login($_POST['usuario']);
    $claveIngresada = $_POST['clave'];
    if($data){
      
      if (password_verify($claveIngresada, $data['clave'])){

        //Enviamos toda la info del usuario
        $resultado["acceso"] =  true;
        $resultado["mensaje"] = "Bienvenido a las olimpiadas";


      }else{

        //La contraseña es incorrecta
        $resultado["acceso"] = false;
        $resultado["mensaje"] = "La contraseña es incorrecta";
      }
    }else{
      $resultado["acceso"] = false;
      $resultado["mensaje"] = "El usuario NO existe";
    }
    echo json_encode($resultado);
  }
}
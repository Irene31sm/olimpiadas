<?php
//Iniciamos/heredamos la sesión
session_start();

//La sesión contendrá datos del login en formato de arreglo
$_SESSION["login"] = [];

require_once '../models/usuario.php';


if(isset($_POST['operacion'])){
  $usuario = new Usuario();

  
  if($_POST['operacion'] == 'inicioSesion'){
    $resultado = [
      "acceso" => false,
      "mensaje" => "",
      "nombres" => "",
      "apellidos" => "",
      "nivelacceso" => ""
    ];

    $data = $usuario->login($_POST['usuario']);

    
    if($data){

      $claveIngresada = $_POST['clave'];
      if (password_verify($claveIngresada, $data['clave'])){

        //Enviamos toda la info del usuario
        $resultado["acceso"] =  true;
        $resultado["mensaje"] = "Bienvenido a las olimpiadas";
        $resultado["nombres"] = $data["nombres"];
        $resultado["apellidos"] = $data["apellidos"];
        $resultado["nivelacceso"] = $data["nivelacceso"];

      }else{
        $resultado["mensaje"] = "La contraseña es incorrecta";
      }
    }else{
      $resultado["mensaje"] = "El usuario NO existe";
    }

    $_SESSION["login"] = $resultado;
    
    echo json_encode($resultado);
  }
}

if (isset($_GET['operacion']) == 'destroy'){
  session_destroy();
  session_unset();
  header("location:../");
}

?>
<?php
session_start();
if (isset($_SESSION['login']) && $_SESSION['login']['acceso']){
  header('Location:./views/');
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/login.css">
  
  <title>login</title>
  
</head>
<body>
  <div class="login-container">
    <div class="login-info-container">
      <h1 class="title">Inicio Sesión</h1>
      <div class="social-login">
      </div>
      
      <!-- formulario para login  -->
      <form class="form-login">
        <input class="input" type="text" id="usuario" placeholder=Usuario>
        <input class="input" type="password" id="clave" placeholder=Contraseña>
        <button type="button"class="btn" id="log">Iniciar Sesión</button>
      </form>
    </div>
    <img class="image-container" src="./images/login-imagen.svg" alt="img-login">
  </div>
  <script>
    document.addEventListener("DOMContentLoaded", () => {
      const btlogin = document.querySelector("#log");
      const usuario = document.querySelector("#usuario");
      const clave = document.querySelector("#clave");

      function logIn(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "inicioSesion");
        parametros.append("usuario", usuario.value);
        parametros.append("clave", clave.value);

        fetch("./controllers/usuario.controller.php", {
          method:  'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            if(datos.acceso){
              window.location.href = './views/index.php';
              alert(datos.mensaje);
            }else{
              alert(datos.mensaje);
              
            }
          })
          .catch(error => {
            console.log(error);
          })
      }

      clave.addEventListener("keypress", (evt) => {
        if (evt.charCode == 13) logIn();
      });
      btlogin.addEventListener("click", logIn);
    })
  
  </script>
</body>

</html>
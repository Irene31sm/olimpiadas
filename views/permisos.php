<?php
session_start();

$nivelacceso = $_SESSION['login']['nivelacceso'];
$url = $_SERVER['REQUEST_URI'];
$url_array = explode("/", $url);
$vistaActiva = $url_array[count($url_array) - 1];

$permisos = [
  "ADM" => ["ganadores.php","dashboart.php","registrar-equipos.php","reportes.php","configuracion.php"],
  "EDT" => ["ganadores.php","dashboart.php","registrar-equipos.php","reportes.php"]
];

$autorizado = false;

$vistasPermitidas = $permisos[$nivelacceso];

foreach($vistasPermitidas as $item){
  if ($item == $vistaActiva){
    $autorizado = true;
  }
}

if (!$autorizado){
  echo "<h1>Acceso restringido</h1>";
  exit();
}

?>
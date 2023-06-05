<?php
$permiso = $_SESSION['login']['nivelacceso'];

$opciones = [];

switch ($permiso){
  case "ADM":
    $opciones = [
      ["menu" => "Inicio", "url" => "index.php?view=dashboart.php"],
      ["menu" => "Olimpiadas", "url" => "index.php?view=ganadores.php"],
      ["menu" => "Formulario de registro", "url" => "index.php?view=registrar-equipos.php"],
      ["menu" => "Reporte", "url" => "index.php?view=reportes.php"],
      ["menu" => "Configuración", "url" => "index.php?view=configuracion.php"]
    ];
  break;
  case "EDT":
    $opciones = [
        ["menu" => "INICIO", "url" => "index.php?view=dashboart.php"],
        ["menu" => "OLIMPIADAS", "url" => "index.php?view=ganadores.php"],
        ["menu" => "Formulario de registro", "url" => "index.php?view=registrar-equipos.php"]
    ];    
  break;
}

foreach($opciones as $item){
  echo "
    <li class='sidebar-item bg'>
        <a class='sidebar-link bg-d' href='{$item['url']}' aria-expanded='false'>        
            <span class='hide-menu'>{$item['menu']}</span>
        </a>
    </li>
  ";
}
<?php

$claveBase = "76364010";      //Clave ORIGINAL
$claveEncriptada = password_hash($claveBase, PASSWORD_BCRYPT); //

var_dump($claveEncriptada);


?>
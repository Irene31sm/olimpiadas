<?php

$claveBase = "1234";      //Clave ORIGINAL
$claveEncriptada = password_hash($claveBase, PASSWORD_BCRYPT); //

var_dump($claveEncriptada);


?>
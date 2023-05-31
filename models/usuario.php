<?php

require_once 'conexion.php';

class Usuario extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function login($usuario =""){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_LOGIN_USUARIOS(?)");
      $consulta->execute(array($usuario));
      return $consulta->fetch(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
    
  }
}
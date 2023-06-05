<?php

require_once 'conexion.php';

class Delegacion extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listarDelegaciones(){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_LISTAR_DELEGACIONES()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }


  
}
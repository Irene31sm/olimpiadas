<?php

require_once 'conexion.php';

class Detalle extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listarTodosEventos(){
    try{
      $consulta = $this->conexion->prepare("CALL spu_listar_det_eventos()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  
}
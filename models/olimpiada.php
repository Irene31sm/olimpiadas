<?php

require_once 'conexion.php';

class Olimpiada extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listaAnual($anual){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_LISTA_ANUAL_OLIMPIADAS(?)");
      $consulta->execute(array($anual));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function listaOlimpiadas(){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_LISTA_POR_OLIMPIADAS()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  
}
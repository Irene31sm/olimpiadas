<?php

require_once 'conexion.php';

class Disciplina extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listarDisciplinas(){
    try{
      $consulta = $this->conexion->prepare("CALL spu_listar_disciplinas()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  
}
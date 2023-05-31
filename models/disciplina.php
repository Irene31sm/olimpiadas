<?php

require_once 'conexion.php';

class Disciplina extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listarDisciplinas(){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_LISTAR_DISCIPLINAS()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
  public function listarDisciplinasolimpiadas($idolimpiada){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_LISTAR_DISCIPLINAS_ANUAL(?)");
      $consulta->execute(array($idolimpiada));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  

  public function listarDetalle(){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_LISTAR_DETALLE()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }


  
}
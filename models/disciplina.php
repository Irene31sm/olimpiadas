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
  public function filtroDisciplinas($idolimpiada){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_FILTRO_DISCIPLINAS_ANUAL(?)");
      $consulta->execute(array($idolimpiada));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function filtroDisciplinas_delegacion($iddelegacion){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_FILTRO_DELEGACION(?)");
      $consulta->execute(array($iddelegacion));
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

  public function listarParticipante($iddelegacion, $iddisciplina){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_FILTRO_DELEGACION_DISCIPLINA(?,?)");
      $consulta->execute(array($iddelegacion, $iddisciplina));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function buscar($iddisciplina){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_BUSCAR_DISCIPLINA(?)");
      $consulta->execute(array($iddisciplina));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function editarDisciplina($datos = []){
    $respuesta = [
      "status" => false,
      "mensaje" => ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL SPU_EDITAR_DISCIPLINA(?,?)");
      $respuesta["status"]=$consulta->execute(
        array(
          $datos["iddisciplinas"],
          $datos["disciplina"]
        )
      );
    }
    catch(Exception $e){
      die($e->getMessage());
    }
    return $respuesta;
  }
  
}
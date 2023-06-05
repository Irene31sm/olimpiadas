<?php

require_once 'conexion.php';

class Integrante extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function registrarIntegrantes($datos = []){
    $respuesta = [
      "status" => false,
      "mensaje" => ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL SPU_REGISTRAR_INTEGRANTES(?,?)");
      $respuesta["status"]=$consulta->execute(
        array(
          $datos["iddetalle"],
          $datos["idequipo"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["mensaje"] = "No se pudo guadar. Codigo: ". $e->getCode();
    }
    return $respuesta;
  }

  public function grafico1($idolimpiada){
    try{
      $consulta = $this->conexion->prepare("CALL GRAFICO_INTEGRANTES(?)");
      $consulta->execute(array($idolimpiada));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function grafico2($idolimpiada){
    try{
      $consulta = $this->conexion->prepare("CALL GRAFICO_MEDALLAS(?)");
      $consulta->execute(array($idolimpiada));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
  public function reporte1($idolimpiada){
    try{
      $consulta = $this->conexion->prepare("CALL REPORTE_INTEGRANTES(?)");
      $consulta->execute(array($idolimpiada));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
  
}
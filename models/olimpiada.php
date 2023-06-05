<?php

require_once 'conexion.php';

class Olimpiada extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listaAnualGanadores($idolimpiada = 0 ,$iddisciplina = 0){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_LISTA_GANADORES_FECHA(?,?)");
      $consulta->execute(array($idolimpiada, $iddisciplina));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function registrarGanador($datos = []){
    $respuesta = [
      "status" => false,
      "mensaje" => ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL SPU_REGISTRAR_GANADORES(?,?)");
      $respuesta["status"]=$consulta->execute(
        array(
          $datos["idintegrante"],
          $datos["puesto"]
        )
      );
    }
    catch(Exception $e){
      die($e->getMessage());
    }
    return $respuesta;
  }

  public function registrarOlimpiada($datos = []){
    $respuesta = [
      "status" => false,
      "mensaje" => ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL SPU_REGISTRAR_OLIMPIADA(?,?,?)");
      $respuesta["status"]=$consulta->execute(
        array(
          $datos["nombre"],
          $datos["fechainicio"],
          $datos["fechafin"]
        )
      );
    }
    catch(Exception $e){
      die($e->getMessage());
    }
    return $respuesta;
  }

  public function listaOlimpiadas(){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_LISTA_OLIMPIADAS()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function reporte2($idolimpiada){
    try{
      $consulta = $this->conexion->prepare("CALL REPORTE_GANADORES(?)");
      $consulta->execute(array($idolimpiada));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  
}
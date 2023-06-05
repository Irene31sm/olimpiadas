<?php

require_once 'conexion.php';

class Equipo extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listarEquiposParticipantes($iddelegacion){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_EQUIPOS_PARTCIPANTES(?)");
      $consulta->execute(array($iddelegacion));
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
  public function registrarEquipos($datos = []){
    $respuesta = [
      "status" => false,
      "mensaje" => ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL SPU_REGISTRAR_EQUIPO(?,?)");
      $respuesta["status"]=$consulta->execute(
        array(
          $datos["iddelegacion"],
          $datos["idparticipante"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["mensaje"] = "No se pudo guadar. Codigo: ". $e->getCode();
    }
    return $respuesta;
  }
  
}
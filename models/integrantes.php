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
      $consulta = $this->conexion->prepare("CALL SPU_REGISTRAR_INTEGRANTE(?,?,?)");
      $respuesta["status"]=$consulta->execute(
        array(
          $datos["iddelegacion"],
          $datos["idparticipante"],
          $datos["iddetalle"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["mensaje"] = "No se pudo guadar. Codigo: ". $e->getCode();
    }
    return $respuesta;
  }
  
}
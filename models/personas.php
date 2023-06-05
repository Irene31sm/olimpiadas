<?php

require_once 'conexion.php';

class Persona extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function registrarPersona($datos = []){
    $respuesta = [
      "status" => false,
      "mensaje" => ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL spu_registrar_persona(?,?,?,?,?,?,?)");
      $respuesta["status"]=$consulta->execute(
        array(
          $datos["apellidos"],
          $datos["nombres"],
          $datos["dni"],
          $datos["fechanac"],
          $datos["direccion"],
          $datos["telefono"],
          $datos["correo"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["mensaje"] = "No se pudo guadar. Codigo: ". $e->getCode();
    }
    return $respuesta;
  }

  public function listarPersonas(){
    try{
      $consulta = $this->conexion->prepare("CALL SPU_LISTA_PERSONAS()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
  
}
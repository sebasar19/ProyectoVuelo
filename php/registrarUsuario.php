<?php

//traer conexion
require_once 'config.php';
//retornar un JS
$valido['success']=array('success'=>false,'mensaje'=>"");
if($_POST){


    $usuario=$_POST['usuario'];
    //md5 para encriptar basico la contraseña
    $password=md5($_POST['password']);
    $nombre=$_POST['nombre'];
    $pais=$_POST['pais'];
    $ciudad=$_POST['ciudad'];
    $direccion=$_POST['direccion'];
    $codigopostal=$_POST['codigopostal'];
    $telefono=$_POST['telefono'];
    $correo=$_POST['correo'];
 
   
        //insertar correo base de datos
        $sqlInsertar="INSERT INTO pasajero VALUES (null,'$usuario','$password','$nombre','$pais','$ciudad','$direccion','$codigopostal','$telefono','$correo')";
       //si devuelve un true se inserto correctamente
        if($cx->query($sqlInsertar)===true){
            $valido['success']=true; 
            $valido['mensaje']="SE GUARDO CORRECTAMENTE"; 
        }else{
            $valido['success']=false; 
            $valido['mensaje']="ERROR"; 
        }
  
 
   
}else{

    // arreglo que manda dos datos
    // si fue exitosa la consulta true , si no false
    $valido['success']=false; 
    $valido['mensaje']="NO SE GUARDO"; 
    
}
//trasformar a mensaje json
echo json_encode($valido);

?>
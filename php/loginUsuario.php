<?php

//traer conexion
require_once 'config.php';
//retornar un JS
$valido['success']=array('success'=>false,'mensaje'=>"",'nombre'=>"");
if($_POST){


    $usuario=$_POST['usuario'];
    //md5 para encriptar basico la contraseña
    $password=md5($_POST['password']);
 $sqlconsulta="SELECT * FROM pasajero WHERE pas_usuario='$usuario' AND pas_contraseña ='$password'";
 $result = $cx->query($sqlconsulta);
 $contar=$result->num_rows;

   if($contar>0){
    $row=$result->fetch_array();
    $valido['success']=true; 
    // strtoupper convierte a mayusculas en php
    $valido['mensaje']="BIENVENIDO".strtoupper($row['pas_nombre']); 
    $valido['nombre']=strtoupper($row['pas_nombre']); 
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
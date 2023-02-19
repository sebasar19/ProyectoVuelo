<?php

require_once 'config.php';
//permitir coleccion de caracteres
header("Content-Type:text/html;charset=utf-8");

$valido['success']=array('success'=>false,'mensaje'=>"");

$sqlcon="SELECT * FROM reserva ";
$res=$cx->query($sqlcon);

$salida=array('data'=>array());
if($res->num_rows>0){
    //guarda los datos de la tabla en solo una fila 
while($row=$res->fetch_array()){
    //arreglo bidimencional (filaxcolumna)
$salida['data'][]=array($row[0],$row[1]);

}
}
$cx->close();
echo json_encode($salida);
?>

<?php

require_once 'config.php';
//permitir coleccion de caracteres
header("Content-Type:text/html;charset=utf-8");

$valido['success']=array('success'=>false,'mensaje'=>"");

$sqlcon="SELECT * FROM vuelo";
$res=$cx->query($sqlcon);

$salida=array('data'=>array());
if($res->num_rows>0){
    //guarda los datos de la tabla en solo una fila 
while($row=$res->fetch_array()){
    //arreglo bidimencional (filaxcolumna)
$salida['data'][]=array($row[1],$row[3],$row[4],$row[6],$row[7]);

}
}
$cx->close();
echo json_encode($salida);
?>

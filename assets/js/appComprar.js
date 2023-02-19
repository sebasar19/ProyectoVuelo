var sesion=localStorage.getItem("nombre");

//usuario de la sesion se imprima aqui
const checarSesion=()=>{
//si es nula la variable cuando esta en inicio  lleve al usuario a la pag index
if(sesion==null){
window.location.href="index.html"

}
document.querySelector("#usuarioIniciado").innerHTML=sesion;
}

const cerrarSesion=()=>{
    localStorage.clear();
    window.location.href="index.html"
}


const cargarConsulta= async ()=>{

    var respuesta = await fetch("php/cargarComprar.php",{});
    var registrosHTML=``;
    var resultado= await respuesta.json();//esperar respuesta
    
    //console.log(resultado);
//por cada fila crear una funcion
    resultado.data.forEach(fila=>{
        registrosHTML+=`
        <tr>
        <td>${fila[0]}</td>
        <td>${fila[1]}</td>
        <td>${fila[2]}</td>
        <td>${fila[3]}</td>
        <td>${fila[4]}</td>
        </tr>
        `;

    });

    document.querySelector("#registros").innerHTML=registrosHTML;

}
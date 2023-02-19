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
var sesion=localStorage.getItem("nombre");

//usuario de la sesion se imprima aqui
const checarSesion=()=>{
//sí, no es nula la variable cuando esta en inicio de sesion o registrar usuario lleve al usuario a la pag inicio
if(sesion!=null){
window.location.href="inicio.html"
}
}

const registrarUsuario= async()=>{
    var usuario=document.querySelector("#usuario").value;
    var password=document.querySelector("#password").value;
    var nombre=document.querySelector("#nombre").value;
    var pais=document.querySelector("#pais").value;
    var ciudad=document.querySelector("#ciudad").value;
    var direccion=document.querySelector("#direccion").value;
    var codigopostal=document.querySelector("#codigopostal").value;
    var telefono=document.querySelector("#telefono").value;
    var correo=document.querySelector("#correo").value;
    ///validar ningun campo vacio 
    if(usuario.trim()===''||
    password.trim()===''||
    nombre.trim()===''||
    pais.trim()===''||
    ciudad.trim()===''||
    direccion.trim()===''||
    codigopostal.trim()===''||
    telefono.trim()===''||
    correo.trim()===''){
         Swal.fire({
            icon: 'error',
            title: 'ERROR',
            text: 'FALTA LLENAR CAMPOS',
            footer: 'INFORMACIÓN'
          })
       return
    }
    //Insertar base de datos 
    var datos=new FormData();
    datos.append("usuario",usuario);
    datos.append("password",password);
    datos.append("nombre",nombre);
    datos.append("pais",pais);
    datos.append("ciudad",ciudad);
    datos.append("direccion",direccion);
    datos.append("codigopostal",codigopostal);
    datos.append("telefono",telefono);
    datos.append("correo",correo);
    
    
    //adquirir datos los datos de arriba enviarlos a esta ruta de php con fetch
    var respuesta = await fetch('php/registrarUsuario.php',{
        method:'POST',
        body:datos
      
      
    })

    var resultado= await respuesta.json();

    if(resultado.success==true){
        Swal.fire({
            icon: 'success',
            title: 'Exito',
            text: resultado.mensaje,
            footer: 'INFORMACIÓN'
    
          })
          //resetar formulario
          document.querySelector("#formulario").reset();
          //para ir a inicio de sesion 
          setTimeout(()=>{
            window.location.href="index.html";
          },2000);
    }else{
        Swal.fire({
            icon: 'error',
            title: 'ERROR',
            text: resultado.mensaje,
            footer: 'INFORMACIÓN'
    
          })
    }
    
    }

    const loginUsuario= async()=>{
        var usuario=document.querySelector("#usuario").value;
        var password=document.querySelector("#password").value;

        ///validar ningun campo vacio 
        if(usuario.trim()===''||
        password.trim()===''){
             Swal.fire({
                icon: 'error',
                title: 'ERROR',
                text: 'FALTA LLENAR CAMPOS',
                footer: 'INFORMACIÓN'
              })
           return
        }

        


        //Insertar base de datos 
        var datos=new FormData();
        datos.append("usuario",usuario);
        datos.append("password",password);
        
        
        //adquirir datos los datos de arriba enviarlos a esta ruta de php con fetch
        var respuesta = await fetch('php/loginUsuario.php',{
            method:'POST',
            body:datos
          
          
        })
    
        var resultado= await respuesta.json();
    
        if(resultado.success==true){
            Swal.fire({
                icon: 'success',
                title: 'Exito',
                text: resultado.mensaje,
                footer: 'INFORMACIÓN'
        
              })
              //resetar formulario
              document.querySelector("#formIniciar").reset();
              //guarda una variable en el localStorage
              localStorage.setItem("nombre",resultado.nombre);
              //para ir a inicio de sesion 
              setTimeout(()=>{
              window.location.href="inicio.html";
             },2000);
        }else{
            Swal.fire({
                icon: 'error',
                title: 'ERROR',
                text: resultado.mensaje,
                footer: 'INFORMACIÓN'
        
              })
        }
        
        }


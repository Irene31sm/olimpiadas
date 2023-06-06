<div class="row">
    <div class="col-lg-6 d-flex align-items-strech">
        <div class="card w-100">
            <div class="card-body">
                <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                    <div class="mb-3 mb-sm-0">
                        <h5 class="card-title fw-semibold">OLIMPIADA:</h5>
                    </div>
                    <div>
                    </div>
                </div>
                <div>
                    <form id="form-olimpiada" >
                        <div class="col-md-12">
                            <label for="delegacion">Nombre OLIMPIADA:</label>          
                            <input type="text" id="nombre"class="form-control">
                        </div> 
                        <div class="mb-3 row g-2">                  
                            <div class="col-md-6">
                                <label for="delegacion">Fecha Incio:</label>          
                                <input type="date" value="2017-06-01" id="fechainicio" class="form-control">
                            </div> 
                            <div class="col-md-6">
                                <label for="delegacion">Fecha Fin:</label>          
                                <input type="date" id="fechafin" value="2017-06-01" class="form-control">
                            </div>
                        </div>
                        <div class="mb-3 row g-2">
                            <div class="col-md">
                                <div class="d-grid">
                                    <button id="registraroli" class="btn btn-danger btn-sm mt-1" type="button">Guardar</button>
                                </div> 
                            </div>
                        </div>                
                    </form>

                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6 d-flex align-items-strech">
        <div class="card w-100">
            <div class="card-body">
            <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                    <div class="mb-3 mb-sm-0">
                        <h5 class="card-title fw-semibold">EDITAR DISCIPLINA:</h5>
                    </div>
                    <div>
                    </div>
                </div>
                <div>
                    <form id="form-disciplina" >
                        <div class="col-md-4">
                            <label for="delegacion">ID:</label>          
                            <input type="text" id="iddisciplina"class="form-control">
                        </div> 
                        <div class="mb-3 row g-2">                  
                            <div class="col-md-6">
                                <label for="delegacion">Disciplina:</label>          
                                <input type="text" id="disciplina" class="form-control">
                            </div> 
                        </div>
                        <div class="mb-3 row g-2">
                            <div class="col-md">
                                <div class="d-grid">
                                    <button id="editar" class="btn btn-danger btn-sm mt-1" type="button">editar</button>
                                </div> 
                            </div>
                        </div>                
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    const olimpiada = document.querySelector("#olimpiada");
    const nombre = document.querySelector("#nombre");
    const fechainicio = document.querySelector("#fechainicio");
    const fechafin = document.querySelector("#fechafin");
    const registrar = document.querySelector("#registraroli");
    const iddisciplina = document.querySelector("#iddisciplina");
    const disciplina = document.querySelector("#disciplina");
    const editar = document.querySelector("#editar");


    function registrarOlimpiada(){
        if(confirm('¿Esta seguro de guardar?')){
            const parametros = new URLSearchParams();
            parametros.append("operacion", "registrarOlimpiada");
            parametros.append("nombre", nombre.value);
            parametros.append("fechainicio", fechainicio.value);            
            parametros.append("fechafin", fechafin.value);             
            fetch("../controllers/olimpiada.controller.php",{
              method: 'POST',
              body: parametros
            })
              .then(response => response.json())
              .then(datos => {
                console.log(datos);
                if(datos.status){
                  alert("Registro Guardado Correctamente");
                  document.querySelector("#form-olimpiada").reset();                  
                }else{
                    alert("No se pudo guardar");
                }
              })
              
          }
      }

    function buscarDisciplina(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "buscarDisciplina");
        parametros.append("iddisciplina", iddisciplina.value);
        fetch("../controllers/disciplina.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          datos.forEach(element => {
            disciplina.value = element.disciplina;
          });
        })
    }

    function editarDisciplina(){
        if(confirm('¿Esta seguro de guardar?')){
            const parametros = new URLSearchParams();
            parametros.append("operacion", "editarDisciplina");
            parametros.append("iddisciplinas", iddisciplina.value);
            parametros.append("disciplina", disciplina.value);          
            fetch("../controllers/disciplina.controller.php",{
              method: 'POST',
              body: parametros
            })
              .then(response => response.json())
              .then(datos => {
                console.log(datos);
                if(datos.status){
                  alert("Registro editado Correctamente");
                  document.querySelector("#form-disciplina").reset();                  
                }
                else{
                  alert(datos.mensaje);
                }
              })
              .catch(error =>{
                alert("Error al Guardar");
                document.querySelector("#form-disciplina").reset();
              })
              
          }
      }
    iddisciplina.addEventListener("keypress", buscarDisciplina);
    editar.addEventListener("click", editarDisciplina);
    registrar.addEventListener("click", registrarOlimpiada);
</script>
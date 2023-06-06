<div class="container-fluid">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title fw-semibold mb-4">Registrate en las Olimpiadas</h5>
        <div class="card">
          <div class="card-body">            
            <form id="form-integrantes">
              <div class="mb-3 row g-2">
                <div class="col-md-10">
                  <label for="delegacion">Delegaciones:</label>          
                  <select name="delegacion" class="form-select form-select-sm" id="delegacion">
                    <option value="">Seleccione</option>
                  </select>
                </div> 
                <div class="col-md-2">
                  <div class="d-grid">
                    <label for="">Crear Equipo</label>
                    <button id="agregar-equipo" class="btn btn-danger btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#modal-equipos">Añadir</button>
                  </div>                
                </div>                                   
              </div>
              <div class="mb-3 row g-2">                  
                <div class="col-md-10">
                  <label for="">Participantes:</label>          
                  <select name="participantes" class="form-select form-select-sm" id="participantes">
                    <option value="">Seleccione</option>
                  </select>                      
                </div>
                <div class="col-md-2">
                  <div class="d-grid">
                    <label for="">¿Eres nuevo?</label>
                    <button id="agregarPersona" class="btn btn-danger btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#modal-registrar">Añadir</button>
                  </div>                
                </div>
              </div>
              <div class="mb-3 row g-2">                  
                <div class="col-md-10">
                  <label for="">¿En que olimpiada te registraras?</label>          
                  <select name="r-olimpiada" class="form-select form-select-sm" id="r-olimpiada">
                    <option value="">Seleccione</option>
                  </select>                      
                </div>
              </div>
              <div class="mb-3 row g-2">
                <div class="col-md">
                  <div class="d-grid">
                    <button id="agregarintegrante" class="btn btn-danger btn-sm mt-1" type="button">Agregar</button>
                  </div> 
                </div>
              </div>                
            </form>
          </div>
        </div>
        
        
      </div>
    </div>
  </div>

  <!-- modal Registro personas  -->
  <div class="modal fade" id="modal-registrar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Registrar Participantes: </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        <form action="" id="form-personas">
          <div class="mb-3">
            <label for="md-nombres">Nombres:</label>
            <input type="text"class="form-control form-control-sm" id="md-nombres" required>
          </div>
          <div class="mb-3">
            <label for="md-apellidos">Apellidos:</label>
            <input type="text"class="form-control form-control-sm" id="md-apellidos" required>
          </div>
          <div class="mb-3 row g-2">
            <div class="col-md">
              <label for="md-dni">DNI:</label>
              <input type="tel"class="form-control form-control-sm" id="md-dni" maxlength="8" placeholder="88888888" required>
            </div>
            <div class="col-md">
              <label for="md-telefono">Telefono:</label>
              <input type="tel"class="form-control form-control-sm" id="md-telefono" maxlength="9" placeholder="999999999" >
            </div>
          </div>
          <div class="mb-3">
            <label for="md-direccion">Direccion:</label>
            <input type="text"class="form-control form-control-sm" id="md-direccion" >
          </div>
          <div class="mb-3 row g-2">
            <div class="col-md">
              <label for="md-fecha_nac">Fecha Nacimiento:</label>
            <input type="date"class="form-control form-control-sm" id="md-fecha_nac" required>
            </div>
            <div class="col-md">
              <label for="md-correo">Correo:</label>
              <input type="text"class="form-control form-control-sm" id="md-correo" placeholder="correo@gmail.com" required>
            </div>            
          </div>
          <div class="mb-3 row g-2">
            <button type="button" class="btn btn-primary" id="btn-registrar-md">Registrar</button>
          </div>
        </div>
        </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Cancelar</button>
      </div>
    </div>
  </div>
  </div>

  <div class="modal fade" id="modal-equipos" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Registrar Equipo: </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="" id="form-equipos">
            <div class="mb-3">
              <label for="delegacion">Delegaciones:</label>          
                  <select name="m-delegacion" class="form-select form-select-sm" id="m-delegacion">
                    <option value="">Seleccione</option>
                  </select>
            </div>
            <div class="mb-3">
              <div class="col-md-10">
                <label for="">Participantes:</label>          
                <select name="m-participantes" class="form-select form-select-sm" id="m-participantes">
                  <option value="">Seleccione</option>
                </select>                      
              </div>
            </div>
            <div class="mb-3 row g-2">
              <button type="button" class="btn btn-primary" id="btn-registrar-equipo">Registrar</button>
            </div>
          </div>
          </form>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Cancelar</button>
        </div>
      </div>
    </div>
    </div>
   
  <script>     
    const agregarintegrante = document.querySelector("#agregarintegrante");
    const participantes = document.querySelector("#participantes");
    const delegacion = document.querySelector("#delegacion");
    const olimpiada = document.querySelector("#r-olimpiada");
    const agregarPersona = document.querySelector("#agregarPersona");

    //Modal personas
    const nombres = document.querySelector("#md-nombres");
    const apellidos = document.querySelector("#md-apellidos");
    const dni = document.querySelector("#md-dni");
    const telefono = document.querySelector("#md-telefono");
    const direccion = document.querySelector("#md-direccion");
    const fechanac = document.querySelector("#md-fecha_nac");
    const correo = document.querySelector("#md-correo");
    const registrar_persona = document.querySelector("#btn-registrar-md");

    //Modal equipos
    const m_delegaciones = document.querySelector("#m-delegacion");
    const m_participantes = document.querySelector("#m-participantes");
    const m_btnequipo = document.querySelector("#btn-registrar-equipo");


    
    function listarPersonas(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarPersonas");
        fetch("../controllers/personas.controllers.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          datos.forEach(element => {
            const optionTag = document.createElement("option");
            optionTag.value = element.idpersona;
            optionTag.text = element.nombres + ", "+element.apellidos;
            m_participantes.appendChild(optionTag);
            
          });
        })
    }
      
    function listarDelegaciones(select){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listar");
        fetch("../controllers/delegaciones.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          datos.forEach(element => {
            const optionTag = document.createElement("option");
            optionTag.value = element.iddelegacion;
            optionTag.text = element.delegacion;
            select.appendChild(optionTag);
            
          });
        })
    }

    function listarParticipantesEquipo(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarParticipante");
        parametros.append("iddelegacion", delegacion.value );
        fetch("../controllers/equipos.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          participantes.innerHTML = "<option value=''>Seleccione</option>";
          datos.forEach(element => {
            const optionTag = document.createElement("option");
            optionTag.value = element.idequipo;
            optionTag.text = element.nombres + ", "+element.apellidos;
            participantes.appendChild(optionTag);
            
          });
        })
    }

    function listarOlimpiadas(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarDetalle");
        fetch("../controllers/disciplina.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          datos.forEach(element => {
            const optionTag = document.createElement("option");
            optionTag.value = element.iddetalle;
            optionTag.text = element.nombre + " - " + element.disciplina + " - " + element.fecha;
            olimpiada.appendChild(optionTag);
            
          });
        })
    }

    function registrarPersonas(){
        if(confirm('¿Esta seguro de guardar el registro?')){
            const parametros = new URLSearchParams();
            parametros.append("operacion", "registrar");
            parametros.append("nombres", nombres.value);
            parametros.append("apellidos", apellidos.value);
            parametros.append("dni", dni.value);
            parametros.append("fechanac", fechanac.value);
            parametros.append("direccion", direccion.value);
            parametros.append("telefono", telefono.value);
            parametros.append("correo", correo.value);
            
            fetch("../controllers/personas.controllers.php",{
              method: 'POST',
              body: parametros
            })
              .then(response => response.json())
              .then(datos => {
                if(datos.status){
                  alert("Registro Guardado Correctamente");
                  document.querySelector("#form-personas").reset();
                  listarPersonas();
                }else{
                  alert(datos.mensaje);
                }
              })
              .catch(error => {
               alert("Error al guardar");
              })
          }
      }
      //idpersona

    function registrarEquipo(){
        if(confirm('¿Esta seguro de guardar el registro?')){
            const parametros = new URLSearchParams();
            parametros.append("operacion", "registrarEquipo");
            parametros.append("iddelegacion", m_delegaciones.value);
            parametros.append("idparticipante", m_participantes.value)
            
            fetch("../controllers/equipos.controller.php",{
              method: 'POST',
              body: parametros
            })
              .then(response => response.json())
              .then(datos => {
                if(datos.status){
                  alert("Registro Guardado Correctamente");
                  document.querySelector("#form-equipos").reset();
                  
                }
                else{
                  alert(datos.mensaje);
                }
              })
              .catch(error => {
               alert("El participante ya fue registrado en equipo");
              })
          }
      }

      function registrarIntegrante(){
        if(confirm('¿Esta seguro de guardar el registro?')){
            const parametros = new URLSearchParams();
            parametros.append("operacion", "registrarIntegrantes");
            parametros.append("iddetalle", olimpiada.value);
            parametros.append("idequipo", participantes.value)
            
            fetch("../controllers/integrantes.controller.php",{
              method: 'POST',
              body: parametros
            })
              .then(response => response.json())
              .then(datos => {
                if(datos.status){
                  alert("Registro Guardado Correctamente"); 
                  document.querySelector("#form-integrantes").reset();                 
                }
                else{
                  alert(datos.mensaje);
                }
              })
              .catch(error => {
               alert(datos.mensaje);
              })
          }
      }
    

    listarDelegaciones(delegacion);
    listarDelegaciones(m_delegaciones);
    listarOlimpiadas();
    listarPersonas();
    delegacion.addEventListener("change", listarParticipantesEquipo);
    m_btnequipo.addEventListener("click", registrarEquipo);
    registrar_persona.addEventListener("click", registrarPersonas);
    agregarintegrante.addEventListener("click", registrarIntegrante);
  </script>
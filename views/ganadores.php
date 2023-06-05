<?php require_once 'permisos.php'; ?>
<div class="row">
    <div class="col-lg-12 d-flex align-items-strech">
        <div class="card w-100">
            <div class="card-body">
                <div class="row mt-3 mb-3">
                    <div class="col-md-12 text-center">
                      <h1>Ganadores de las OLIMPIADAS</h1>
                    </div>
                </div>
                <div class="row mt-4 mb-3">
                  <div class="col-md-12">
                    <div class="row g-2 mb-3">  
                      <div class="col-md">
                        <label for="">Años:</label>
                      </div>
                      <div class="col-md">
                        <select name="olimpiada" id="olimpiada" class="form-select form-select-sm">
                          <option value="">Seleccione</option>
                        </select>
                      </div>
                      <div class="col-md">
                        <label for="">Disciplinas:</label>
                      </div>
                      <div class="col-md">
                        <select name="olimpiada_disciplina" id="olimpiada_disciplina" class="form-select form-select-sm">
                          <option value="">Seleccione</option>
                        </select>
                      </div>
                      <div class="col-md">
                        <button id="consultar" class="btn btn-sm btn-danger" type="button">Consultar</button>
                      </div>
                      <div class="col-md">
                        <button id="registrarganador" class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#registrar-ganador" type="button">Registar Ganadores</button>
                      </div>
                      <div class="col-md">
                        <button id="reporte" class="btn btn-info btn-sm" type="button">Exportar PDF</button>
                      </div>
                    </div>          
                  </div>
                </div>

                <div class="row" id="card">         
                </div>

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="registrar-ganador" tabindex="-1"  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar Ganador</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row mt-2 mb-3">
          <div class="col-md-12">
            <div class="row g-2 mb-3">  
              <form action="" id="form-ganador">
                <div class="col-md">
                  <label for="">Delegaciones:</label>
                  <select name="md-delegacion" id="md-delegacion" class="form-select form-select-sm">
                    <option value="">Seleccione</option>
                  </select>
                </div>
                <div class="col-md">
                  <label for="">Disciplinas:</label>
                  <select name="md-disciplina" id="md-disciplina" class="form-select form-select-sm">
                    <option value="">Seleccione</option>
                  </select>
                </div>
                <div class="col-md">
                  <label for="">Resumen:</label>
                  <input type="text" class="form-control" id="m-participante" disabled>                
                </div>
                <div class="col-md">
                  <label for="">Puesto:</label>
                  <select name="md-puesto" id="md-puesto" class="form-select form-select-sm">
                    <option value="">Seleccione</option>
                    <option value="1">ORO</option>
                    <option value="2">PLATA</option>
                    <option value="3">BRONCE</option>
                  </select>
                </div>
              </form>
              
            </div>          
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="md-guardar">Guardar</button>
      </div>
    </div>
  </div>
</div>






<script>
    const card = document.querySelector("#card");
    const olimpiada = document.querySelector("#olimpiada");
    const oli_disc = document.querySelector("#olimpiada_disciplina");
    const consultar = document.querySelector("#consultar");

    // Botones
    const btnGanadores = document.querySelector("#registrarganador");
    const btnreporte = document.querySelector("#reporte");

    //MODAL
    const m_delegaciones = document.querySelector("#md-delegacion");
    const m_disciplinas = document.querySelector("#md-disciplina");
    const resumen = document.querySelector("#m-participante");
    const puesto = document.querySelector("#md-puesto");
    const guardar = document.querySelector("#md-guardar");
    let idintegrante = 0;
    
      function listarcards(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarAnual");
        parametros.append("idolimpiada", olimpiada.value);
        parametros.append("iddisciplina", oli_disc.value);
        fetch("../controllers/olimpiada.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          let numfilas = 1
          card.innerHTML = ``;
          datos.forEach(element => {
            let src;
            if(element.puesto == 1){
              src = "./images/products/1.png"
            }else if(element.puesto == 2){
              src = "./images/products/2.png"
            } else{
              src = "./images/products/3.png"
            }
            const fila = `
                <div class="col-sm-6 col-xl-3">
                  <div class="card overflow-hidden rounded-2">
                    <div class="position-relative">
                      <a href="javascript:void(0)"><img src=${src} class="card-img-top rounded-0" alt="..."></a>                            
                    </div>
                    <div class="card-body pt-3 p-4">
                      <div class="col-md">
                           <h4 class="fw-semibold fs-4 text-center">${element.disciplina}</h4>             
                      </div>
                      <div class="d-flex align-items-center justify-content-between">
                        <ul class="list-group list-group-flush">
                          <li class="list-group fw-semibold">Participante: </li>
                          <li class="list-group-item">${element.nombres}, ${element.apellidos}</li>
                          <li class="list-group fw-semibold">Delegacion: </li>
                          <li class="list-group-item">${element.delegacion}</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>`;
            card.innerHTML += fila;
            numfilas++;
          })
        })
        .catch(error => {
          alert("No se encontraron datos");
        })
      }

      function listarOlimpiadas(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarOlimpiadas");
        fetch("../controllers/olimpiada.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          datos.forEach(element => {
            const optionTag = document.createElement("option");
            optionTag.value = element.idolimpiadas;
            optionTag.text = element.fecha;
            olimpiada.appendChild(optionTag);
          });
        })
      }

      function listardisciplinaOlimpiada(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "filtroDisciplinas");
        parametros.append("idolimpiada",parseInt(olimpiada.value));
        fetch("../controllers/disciplina.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          oli_disc.innerHTML="<option value=''>Seleccione</option>";
          if(datos){
              datos.forEach(element => {
                const optionTag = document.createElement("option");
                optionTag.value = element.iddisciplinas;
                optionTag.text = element.disciplina;
                oli_disc.appendChild(optionTag);
              });
          }else{
            alert(datos.mensaje);
          }
          
        })
      }
      
      // para el modal
      function listarDelegaciones(){
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
            m_delegaciones.appendChild(optionTag);
            
          });
        })
      }
      
      function listarDisciplinas(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarDisciplina_delegacion");
        parametros.append("iddelegacion", m_delegaciones.value);
        fetch("../controllers/disciplina.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          m_disciplinas.innerHTML = "<option value=''>Seleccione</option>";
          datos.forEach(element => {
            const optionTag = document.createElement("option");
            optionTag.value = element.iddisciplinas;
            optionTag.text = element.disciplina+" - "+element.fecha;
            m_disciplinas.appendChild(optionTag);            
          });
        })
      }
      
      function participantedis(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarParticipante");
        parametros.append("iddelegacion",m_delegaciones.value);
        parametros.append("iddisciplina",m_disciplinas.value);
        fetch("../controllers/disciplina.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          datos.forEach(element => {
            resumen.value = element.nombre + " - " + element.delegacion + " - " + element.disciplina ;
            idintegrante = element.id;
          });
        })
        .catch(error =>{
          alert("no hay datos");
        })
      }


      function registrarGanador(){
        if(confirm('¿Esta seguro de guardar?')){
            const parametros = new URLSearchParams();
            parametros.append("operacion", "registrarGanador");
            parametros.append("idintegrante", idintegrante);
            parametros.append("puesto", puesto.value);            
            fetch("../controllers/olimpiada.controller.php",{
              method: 'POST',
              body: parametros
            })
              .then(response => response.json())
              .then(datos => {
                if(datos.status){
                  alert("Registro Guardado Correctamente");
                  document.querySelector("#form-ganador").reset();
                  
                }
                else{
                  alert(datos.mensaje);
                }
              })
              .catch(error =>{
                alert("La delegacion ya fue premiada en esa disciplina");
                document.querySelector("#form-ganador").reset();
              })
              
          }
      }

      function generarpdf() {
        const parametros = new URLSearchParams();
        parametros.append("idolimpiada", parseInt(olimpiada.value));
        parametros.append("titulo","Ganadores de la Olimpiada " + olimpiada.options[olimpiada.selectedIndex].text);
        window.open(`../reports/ganadores.report.php?${parametros}`, '_blank');
      }

    listarDelegaciones();
    listarOlimpiadas();


    m_delegaciones.addEventListener("change", listarDisciplinas);
    m_disciplinas.addEventListener("change", participantedis);
    olimpiada.addEventListener("change",listardisciplinaOlimpiada);
    reporte.addEventListener("click", generarpdf);
    guardar.addEventListener("click", registrarGanador);
    consultar.addEventListener("click",listarcards);
</script>
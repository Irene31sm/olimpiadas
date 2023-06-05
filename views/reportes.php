<div class="container">
    <div class="row mt-3 mb-3">
      <div class="col-md-12">
        <h1>Lista de Integrantes</h1>
      </div>
    </div>
    <div class="row mt-3 mb-3">
      <div class="col-md-12">
        <div class="row g-2 mb-3">  
          <div class="col-md-3">
            <label for="">Años:</label>
          </div>
          <div class="col-md-3">
            <select name="olimpiada" id="olimpiada" class="form-select form-select-sm">
              <option value="">Seleccione</option>
            </select>
          </div>
          <div class="col-md-3">
            <button id="reporte" class="btn btn-info btn-sm" type="button">Exportar</button>
          </div>           
        </div>          
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <table class="table table-sm table-striped table-success" id="tabla_olimpiadas">
          <thead>
            <tr>
              <th>Delegacion</th>
              <th>Disciplinas</th>
              <th>Nombres</th>
              <th>Apellidos</th>
              <th>Olimpiada</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div> 
<script>
    const tabla = document.querySelector("#tabla_olimpiadas"); 
    const body = tabla.querySelector("tbody");
    const olimpiada = document.querySelector("#olimpiada");
    const reporte = document.querySelector("#reporte");

    function listarOlimpiadas(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarOlimpiadas");
        fetch("../controllers/olimpiada.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          console.log(datos);
          datos.forEach(element => {
            const optionTag = document.createElement("option");
            optionTag.value = element.idolimpiadas;
            optionTag.text = element.fecha;
            olimpiada.appendChild(optionTag);
          });
        })
      }

      function listar(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "reporte1");
        parametros.append("idolimpiada", olimpiada.value);
        fetch("../controllers/integrantes.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          console.log(datos);
          let numfilas = 1
          body.innerHTML = ``;
          datos.forEach(element => {
            const fila = `
            <tr>
              <td>${element.delegacion}</td>
              <td>${element.disciplina}</td>
              <td>${element.nombres}</td>
              <td>${element.apellidos}</td>
              <td>${element.fecha}</td>           
            </tr>
            `;
            body.innerHTML += fila;
            numfilas++;
          });
        })
      }
    
      function generarpdf() {
        const parametros = new URLSearchParams();
        parametros.append("idolimpiada", parseInt(olimpiada.value));
        parametros.append("titulo", olimpiada.options[olimpiada.selectedIndex].text);
        window.open(`../reports/olimpiadas.report.php?${parametros}`, '_blank');
      }
      
    reporte.addEventListener("click",generarpdf);
    olimpiada.addEventListener("change", listar);
    listarOlimpiadas();
</script>
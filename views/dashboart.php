<div class="row">
    <div class="col-lg-5 d-flex align-items-strech">
        <div class="card w-100">
            <div class="card-body">
                <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                    <div class="mb-3 mb-sm-0">
                    <h5 class="card-title fw-semibold">Participantes disciplina:</h5>
                    </div>
                    <div>
                    <select id="olimpiada" class="form-select">
                      
                    </select>
                    </div>
                </div>
                <div>
                    <canvas id="grafico1"></canvas>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-7 d-flex align-items-strech">
        <div class="card w-100">
            <div class="card-body">
                <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                    <div class="mb-3 mb-sm-0">
                    <h5 class="card-title fw-semibold">Medallas por Delegacion:</h5>
                    </div>
                </div>
                <div>
                    <canvas id="grafico2"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    const olimpiada = document.querySelector("#olimpiada");
    const grafico1 = document.querySelector("#grafico1");
    const grafico2 = document.querySelector("#grafico2");


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
            olimpiada.focus();
          });
        })
    }
    
    const graficoBarras = new Chart(grafico1, {
        type: 'pie',
        data: {
          labels:[],
          datasets: [
            {        
              label: '',
              data: [],
              backgroundColor: ['#2FAABB', '#347E9E','#49B080','#D29F59','#D9B954','#6C5BDD','#DD5B88']
            }
          ]
        }
      })
      
      const graficoBarras2= new Chart(grafico2, {
        type: 'bar',
        data: {
          labels:[],
          datasets: [
            {        
              label: '',
              data: [],
              backgroundColor: ['#2FAABB', '#347E9E','#49B080','#D29F59','#D9B954','#6C5BDD','#DD5B88']
            }
          ]
        }
      })

      function datosBarras() {
        const parametros = new URLSearchParams();
        parametros.append("operacion", "grafico1")
        parametros.append("idolimpiada", olimpiada.value);
        fetch("../controllers/integrantes.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          graphic(datos);
        });
      }

      function datosBarras2() {
        const parametros = new URLSearchParams();
        parametros.append("operacion", "grafico2")
        parametros.append("idolimpiada", olimpiada.value);
        fetch("../controllers/integrantes.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          graphic2(datos);
        });
      }

      function graphic(coleccion = []){
        let etiquetas = []; 
        let datos = [];

        coleccion.forEach(element => {
          etiquetas.push(element.disciplina);
          datos.push(element.Participantes);
        });
        graficoBarras.data.labels = etiquetas;
        graficoBarras.data.datasets[0].data = datos;
        graficoBarras.update();
      }

      function graphic2(coleccion = []){
        let etiquetas = []; 
        let datos = [];

        coleccion.forEach(element => {
          etiquetas.push(element.delegacion);
          datos.push(element.Medallas);
        });
        graficoBarras2.data.labels = etiquetas;
        graficoBarras2.data.datasets[0].data = datos;
        graficoBarras2.update();
      }
    
      listarOlimpiadas();

    olimpiada.addEventListener("focus",datosBarras )
    olimpiada.addEventListener("focus", datosBarras2)

</script>
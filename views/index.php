<?php
session_start();
if (!isset($_SESSION['login']) || !$_SESSION['login']['acceso']){
    header("Location:../");
}
?>
<!doctype html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Olimpiadas</title>
  <!-- <link rel="shortcut icon" type="image/png" href="images/logos/" /> -->
  <link rel="stylesheet" href="css/styles.min.css" />
</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <aside class="left-sidebar">
      <!-- Sidebar scroll-->
      <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
          <a href="" class="text-nowrap logo-img">
            <img src="images/logos/logo-olimpiada.svg" width="210" alt="" />
          </a>
          <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
            <i class="ti ti-x fs-8"></i>
          </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
          <ul id="sidebarnav">
            
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Opciones</span>
            </li>
            
            <?php require_once './opciones.php'; ?>     
          </ul>
        </nav>
        <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
      <!--  Header Start -->
      <header class="app-header">
        <nav class="navbar navbar-expand-lg navbar-light">
          <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
              <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                <i class="ti ti-menu-2"></i>
              </a>
            </li>
            
          </ul>
          <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
              <label>Hola! <?= $_SESSION['login']['nombres']?></label>
              <li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  <img src="images/profile/user-3.jpg" alt="" width="35" height="35" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                  <div class="message-body">
                    <a href="../controllers/usuario.controller.php?operacion=destroy" class="btn btn-outline-primary mx-3 mt-2 d-block">Cerrar Sesión</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!--  Header End -->
      <div class="container-fluid" id="contenedor-vistas">
        
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
        <!--  Row 1 -->
        
      </div>
    </div>
  </div>
  <script src="libs/jquery/dist/jquery.min.js"></script>
  <script src="libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/sidebarmenu.js"></script>
  <script src="js/app.min.js"></script>
  <script src="libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="libs/simplebar/dist/simplebar.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <script>
    document.addEventListener("DOMContentLoaded", () => {
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
      
      function getURL(){
        const url = new URL(window.location.href);
        const vista = url.searchParams.get("view");
        const contenedor = document.querySelector("#contenedor-vistas");
        if (vista != null){
          fetch(vista)
          .then(respuesta => respuesta.text())
          .then(datos => {
            contenedor.innerHTML = datos;
            const scriptsTag = contenedor.getElementsByTagName("script");
            for (i = 0; i < scriptsTag.length; i++){
              eval(scriptsTag[i].innerText);
            }
          });
        }
      }  
      getURL();
      listarOlimpiadas();
      olimpiada.addEventListener("focus",datosBarras )
      olimpiada.addEventListener("focus", datosBarras2)
    });

  </script>
</body>

</html>
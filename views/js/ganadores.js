
    const tabla = document.querySelector("#tabla_olimpiadas"); 
    const body = tabla.querySelector("tbody");
    const anual = document.querySelector("#anual");
    const oli_disc = document.querySelector("#olimpiada_disciplina");
    const consultar = document.querySelector("#consultar");

    function listar(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarAnual");
        parametros.append("anual", anual.value);
        fetch("../../controllers/olimpiada.controller.php", {
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
              <td>${element.puesto}</td>
              <td>${element.nombre}</td>
              <td>${element.disciplina}</td>
              <td>${element.nombres}</td>
              <td>${element.apellidos}</td>
              <td>${element.delegacion}</td>           
            </tr>
            `;
            body.innerHTML += fila;
            numfilas++;
          });
        })
      }

      function listarOlimpiadas(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarOlimpiadas");
        fetch("../../controllers/olimpiada.controller.php", {
          method : "POST",
          body: parametros
        })
        .then(response => response.json())
        .then(datos => {
          console.log(datos);
          datos.forEach(element => {
            const optionTag = document.createElement("option");
            optionTag.value = element.fecha;
            optionTag.text = element.fecha;
            anual.appendChild(optionTag);
          });
        })
      }
    listar();
    anual.addEventListener("change", () => {
        alert("hola");
    });
   
<h1 class="text-center text-md"><?=$titulo?></h1>

<table class="table table-border mt-3">
  <colgroup>
  <col style='width: 20%'>
  <col style='width: 20%'>
  <col style='width: 20%'>
  <col style='width: 25%'>
  <col   class="text-end" style='width: 15%'>

  </colgroup>
  <thead>
    <tr>
        <th>Delegación</th>
        <th>Disciplinas</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Olimpiada</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($datosObtenidos as $registro):   ?>
      <tr>
        <td><?=$registro['delegacion']?></td>
        <td><?=$registro['disciplina']?></td>
        <td><?=$registro['nombres']?></td>
        <td><?=$registro['apellidos']?></td>
        <td><?=$registro['fecha']?></td>
      </tr>
    <?php endforeach ?>
  </tbody>
</table>
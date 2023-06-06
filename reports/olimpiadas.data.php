<h1 class="text-center text-md"><?=$titulo?></h1>

<table class="table table-border mt-3">
  <colgroup>
  <col style='width: 25%'>
  <col style='width: 25%'>
  <col style='width: 25%'>
  <col style='width: 25%'>

  </colgroup>
  <thead>
    <tr>
        <th>Delegación</th>
        <th>Disciplinas</th>
        <th>Nombres</th>
        <th>Apellidos</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($datosObtenidos as $registro):   ?>
      <tr>
        <td><?=$registro['delegacion']?></td>
        <td><?=$registro['disciplina']?></td>
        <td><?=$registro['nombres']?></td>
        <td><?=$registro['apellidos']?></td>
      </tr>
    <?php endforeach ?>
  </tbody>
</table>
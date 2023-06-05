<h1 class="text-center text-md"><?=$titulo?></h1>

<table class="table table-border mt-3">
  <colgroup>
  <col style='width: 10%'>
  <col style='width: 20%'>
  <col style='width: 20%'>
  <col style='width: 20%'>
  <col style='width: 20%'>
  <col style='width: 10%'>

  </colgroup>
  <thead>
    <tr>
        <th>Puesto</th>
        <th>Olimpiada</th>
        <th>Disciplina</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Delegación</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($datos as $registro): ?>
      <tr>
        <td><?=$registro['puesto']?></td>
        <td><?=$registro['nombre']?></td>
        <td><?=$registro['disciplina']?></td>
        <td><?=$registro['nombres']?></td>
        <td><?=$registro['apellidos']?></td>
        <td><?=$registro['delegacion']?></td>
      </tr>
    <?php endforeach ?>
  </tbody>
</table>
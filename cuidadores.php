<?php
session_start();
require_once("../../conexion.php");
require_once("../../../paginacion.inc.php");
require_once("../../libreria_menu.php");

echo "<html>
      <head>
         <meta http-equiv='Content-type' content='text/html; charset=utf-8' />
         <link rel='stylesheet' href='../../css/estilos.css' type='text/css'>
         <link href='../../../css/bootstrap.min.css' rel='stylesheet'>
         <script src='../../../js/bootstrap.bundle.min.js'></script>
         <script type='text/javascript' src='../../ajax.js'></script>
         <script type='text/javascript' src='js/buscar_cuidadores.js'></script>
      </head>
      <body>
      <p>&nbsp;</p>";

// Librería Menú
require_once("../../libreria_menu.php");

echo "
      <div class='container'>
         <h1 class='text-center'>LISTADO DE CUIDADORES</h1>
         <div class='text-center mb-4'>
            <a href='cuidadores_nuevo.php' class='btn btn-primary'>Nuevo cuidador</a>
         </div>
         <form action='#' method='post' name='formu'>
            <div class='row g-3'>
               <div class='col-md-2'>
                  <label><b>C.I.</b></label>
                  <input type='text' name='ci' class='form-control' onkeyup='buscar_cuidadores()'>
               </div>
               <div class='col-md-2'>
                  <label><b>Nombres</b></label>
                  <input type='text' name='nombres' class='form-control' onkeyup='buscar_cuidadores()'>
               </div>
               <div class='col-md-2'>
                  <label><b>Paterno</b></label>
                  <input type='text' name='paterno' class='form-control' onkeyup='buscar_cuidadores()'>
               </div>
               <div class='col-md-2'>
                  <label><b>Materno</b></label>
                  <input type='text' name='materno' class='form-control' onkeyup='buscar_cuidadores()'>
               </div>
               <div class='col-md-2'>
                  <label><b>Fecha inserción</b></label>
                  <input type='date' name='fecha' class='form-control' onchange='buscar_cuidadores()'>
               </div>
            </div>
         </form>
      </div>";

// Contenedor de resultados
echo "<div id='cuidadores1'>";

// Paginación
contarRegistros($db, "cuidadores");
paginacion("cuidadores.php?");

$sql = $db->Prepare("SELECT *
                     FROM cuidadores
                     WHERE estado <> 'X' 
                     AND id_cuidador > 1
                     ORDER BY id_cuidador ASC
                     LIMIT ? OFFSET ?");

$rs = $db->GetAll($sql, array($nElem, $regIni));

if ($rs) {
    echo "<div class='container'>
            <div class='table-responsive'>
              <table class='table table-bordered table-hover'>
                <thead class='table-light'>
                  <tr>
                    <th>Nro</th><th>C.I.</th><th>Nombres</th><th>Paterno</th><th>Materno</th>
                    <th>Modificar</th><th>Eliminar</th>
                  </tr>
                </thead>
                <tbody>";

    $b = 0;
    $total = $pag - 1;
    $a = $nElem * $total;
    $b = $b + 1 + $a;

    foreach ($rs as $fila) {
        echo "<tr>
                <td>" . $b . "</td>
                <td>" . $fila['ci'] . "</td>
                <td>" . $fila['nombres'] . "</td>
                <td>" . $fila['ap'] . "</td>
                <td>" . $fila['am'] . "</td>
                <td>
                  <form name='formModif" . $fila["id_cuidador"] . "' method='post' action='cuidadores_modificar.php'>
                    <input type='hidden' name='id_cuidador' value='" . $fila['id_cuidador'] . "'>
                    <a href='javascript:document.formModif" . $fila['id_cuidador'] . ".submit();' class='btn btn-warning btn-sm'>
                      Modificar
                    </a>
                  </form>
                </td>
                <td>
                  <form name='formElimi" . $fila["id_cuidador"] . "' method='post' action='cuidadores_eliminar.php'>
                    <input type='hidden' name='id_cuidador' value='" . $fila["id_cuidador"] . "'>
                    <a href='javascript:document.formElimi" . $fila['id_cuidador'] . ".submit();' class='btn btn-danger btn-sm'
                    onclick='return confirm(\"¿Desea realmente eliminar al cuidador " . $fila["nombres"] . " " . $fila["ap"] . " " . $fila["am"] . "?\")'>
                      Eliminar
                    </a>
                  </form>
                </td>
              </tr>";
        $b++;
    }

    echo "</tbody>
          </table>
          </div>
          </div>";
} else {
    echo "<div class='container text-center'><b>NO SE ENCONTRARON CUIDADORES.</b></div><br>";
}

mostrar_paginacion();
echo "</div>";
echo "</body>
      </html>";
?>

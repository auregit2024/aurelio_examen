<?php
session_start();
require_once("../../conexion.php");
require_once("../../resaltarBusqueda.inc.php");

$paterno = isset($_POST["paterno"]) ? $_POST["paterno"] : '';
$materno = isset($_POST["materno"]) ? $_POST["materno"] : '';
$nombres = isset($_POST["nombres"]) ? $_POST["nombres"] : '';
$ci = isset($_POST["ci"]) ? $_POST["ci"] : '';
$fecha = isset($_POST["fecha"]) ? $_POST["fecha"] : '';

if ($paterno || $materno || $nombres || $ci || $fecha) {
    $sql = $db->Prepare("SELECT *
                         FROM cuidadores
                         WHERE ap LIKE ?
                         AND am LIKE ?
                         AND nombres LIKE ?
                         AND ci LIKE ?
                         AND fecha_insercion LIKE ?
                         AND estado <> 'X'
                         ORDER BY id_cuidador ASC");

    $rs = $db->GetAll($sql, array($paterno . "%", $materno . "%", $nombres . "%", $ci . "%", $fecha . "%"));

    if ($rs) {
        echo "<div class='container mt-5'>
                <div class='table-responsive'>
                    <table class='table table-bordered table-striped'>
                      <thead class='thead-dark'>
                        <tr>
                          <th>C.I.</th><th>Nombres</th><th>Paterno</th><th>Materno</th><th>Fecha Inserción</th><th>Modificar</th><th>Eliminar</th>
                        </tr>
                      </thead>
                      <tbody>";

        foreach ($rs as $fila) {
            $ci_val = $fila["ci"];
            $nombres_val = $fila["nombres"];
            $ap_val = $fila["ap"];
            $am_val = $fila["am"];
            $fecha_val = $fila["fecha_insercion"];

            echo "<tr>
                    <td>" . resaltar($ci, $ci_val) . "</td>
                    <td>" . resaltar($nombres, $nombres_val) . "</td>
                    <td>" . resaltar($paterno, $ap_val) . "</td>
                    <td>" . resaltar($materno, $am_val) . "</td>
                    <td>" . resaltar($fecha, $fecha_val) . "</td>
                    <td>
                        <form name='formModif" . $fila["id_cuidador"] . "' method='post' action='cuidadores_modificar.php'>
                            <input type='hidden' name='id_cuidador' value='" . $fila["id_cuidador"] . "'>
                            <button type='submit' class='btn btn-warning btn-sm'>Modificar</button>
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
        }

        echo "</tbody>
              </table>
            </div>
          </div>";
    } else {
        echo "<div class='container mt-5'>
                <div class='alert alert-warning' role='alert'>
                  <strong>¡No se encontraron cuidadores con los criterios especificados!</strong>
                </div>
              </div>";
    }
}
?>

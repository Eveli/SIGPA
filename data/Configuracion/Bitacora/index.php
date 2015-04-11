<?php
		// Verificar que no se accede al archivo directamente con el navegador
	@include "../../../lib/verificar.php";

	$sql="select * from historial order by f desc";
	$ejec=pg_query($sigpa, $sql);
?>


<table class="tab_index">
	<tr>
		<th colspan=3>BITÁCORA</th>
	</tr>
	<tr>
		<th>Fecha</th>
		<th>Usuario</th>
		<th>Descripción</th>
	</tr>

<?php
	while($a=pg_fetch_object($ejec)){
		echo "<tr><td>$a->f</td><td>$a->ci</td><td>$a->d</td></tr>";
	}
?>
</table>

<?php
	include("../../../lib/conexion.php");

	$ci=$_GET["ci"];
	$cuc=$_GET["cuc"];

	$sql="delete from dicta where ci='$ci' and cuc='$cuc'";
	$ejec=pg_query($sigpa, $sql);

	echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/?r=data/Registro/Profesor/consultar.php&ci=$ci' />";
?>
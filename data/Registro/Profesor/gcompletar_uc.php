<?php
	include("../../../lib/conexion.php");

	$ci=$_POST["ci"];
	$cuc=$_POST["cuc"];
	$ht=$_POST["ht"];
	$hp=$_POST["hp"];
	$ti=$_POST["ti"];

	$sql="insert into uc values ('$cuc', '$ti', '$ht', '$hp')";
	$ejec=pg_query($sigpa, $sql);

	// Asignacion de Unidad Curricular

	$sql="insert into dicta values ('$ci', '$cuc')";
	$ejec=pg_query($sigpa, $sql);

	echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/?r=data/Registro/Profesor/consultar.php&ci=$ci' />";
?>
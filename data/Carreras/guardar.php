<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

		// Carrera
	$cc=$_POST["cc"];
	$d=strtoupper($_POST["d"]);
	$ca=$_POST["ca"];

	$sql="insert into carrera values('$cc', '$d', '$ca')";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		echo "Se creó satisfactoriamente la carrera";
		historial($sigpa, $_SESSION["ci"], "Se creó la carrera $d");
	}
?>
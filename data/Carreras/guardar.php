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

	if(!$_POST["caT"])
	{
		$ca=$_POST["ca"];
		$sql="insert into carrera values('$cc', '$d', '$ca')";
	}

	else
	{
		$caT=$_POST["caT"];
		$da=$_POST["da"];

		$sql="insert into area values('$caT', '$da')";
		$ejec=pg_query($sigpa, $sql);

		$sql="insert into carrera values('$cc', '$d', '$caT')";
	}

	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		echo "Se creó satisfactoriamente la carrera";
		historial($sigpa, $_SESSION["ci"], "Se creó la carrera $d");
	}
?>
<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	extract($_POST);

	$sql="insert into malla(cm, cc) values('$cm', '$cc')";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		echo "Se creó una nueva malla";
		historial($sigpa, $_SESSION["ci"], "Se creó la malla $cm en a carrera $cc");
	}
?>
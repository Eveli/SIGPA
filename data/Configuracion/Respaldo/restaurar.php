<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	/*
		C -> Crea la base de datos si no existe y limpia el respaldo de sìntaxis que no sea para .sql
		Ox -> Evita errores de propietarios y permisos
	*/

	$nombre=$_POST["archivo"];

	exec("psql postgres -c 'drop database \"SIGPA\"'");
	system("psql postgres -f Respaldos/$nombre");

	require "../../../lib/conexion.php";
	historial($sigpa, $_SESSION["ci"], "Se restauró el respaldo $nombre");
?>
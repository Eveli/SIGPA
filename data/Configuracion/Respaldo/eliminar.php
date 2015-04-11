<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	$nombre=$_POST["archivo"];

	unlink("Respaldos/$nombre");

	require "../../../lib/conexion.php";
	historial($sigpa, $_SESSION["ci"], "Se eliminó el respaldo $nombre");
?>
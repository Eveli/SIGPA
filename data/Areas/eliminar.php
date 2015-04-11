<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$ca=$_POST["ca"];

	$sql="delete from area where ca='$ca'";
	$ejec=pg_query($sigpa, $sql);

	if(pg_affected_rows($ejec))
	{
		echo 1;
		historial($sigpa, $_SESSION["ci"], "Se eliminó el área $ca");
	}
?>
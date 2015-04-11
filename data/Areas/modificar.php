<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$ca=$_POST["ca"];
	$ca_ant=$_POST["ca_ant"];
	$da=$_POST["da"];

	$sql="update area set ca='$ca', d='$da' where ca='$ca_ant'";
	$ejec=pg_query($sigpa, $sql);

	if(pg_affected_rows($ejec))
	{
		echo "Se modificó satisfactoriamente el área";
		historial($sigpa, $_SESSION["ci"], "Se modificó el área $da");
	}
?>
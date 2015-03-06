<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$ca=$_POST["ca"];
	$da=$_POST["da"];

	$sql="insert into area values('$ca', '$da')";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		echo "Se creó satisfactoriamente el área";
		historial($sigpa, $_SESSION["ci"], "Se creó el área $da");
	}
?>
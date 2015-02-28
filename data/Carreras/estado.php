<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	extract($_POST);

	$sql="update malla set e='$e' where cc='$cc' and cm='$cm'";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		echo "Se modificó la malla";
		historial($sigpa, $_SESSION["ci"], "Se cambió el estado de la malla $cm en a carrera $cc");
	}
?>
<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	extract($_POST);
	$d=strtoupper($d);

	$sql="delete from uc where cuc='$cuc' and cc='$cc' and cm='$cm'";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		echo "Se eliminó con éxito";
		historial($sigpa, $_SESSION["ci"], "Se eliminó la unidad curricular $cuc de la carrera $cc en la malla $cm");
	}
?>
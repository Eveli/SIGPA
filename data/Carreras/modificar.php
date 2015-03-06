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
		$sql="update carrera set d='$d', ca='$ca' where cc='$cc'";
	}

	else
	{
		$caT=$_POST["caT"];
		$da=$_POST["da"];

		$sql="insert into area values('$caT', '$da')";
		$ejec=pg_query($sigpa, $sql);

		$sql="update carrera set d='$d', ca='$caT' where cc='$cc'";
	}

	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		echo "Se modificó satisfactoriamente la carrera";
		historial($sigpa, $_SESSION["ci"], "Se modificó la carrera $d");
	}
?>
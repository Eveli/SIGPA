<?php
		// Invocacion de las conexiones
	require "../../lib/conexion.php";

	$id=$_POST["id"];

	$sql="insert into seccion values('$id')";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
		echo 1;
?>
<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$uc=$_POST["uc"];
	$ci=$_POST["ci"];

	$sql="insert into perfil values('$uc', '$ci')";
	$ejec=pg_query($sigpa, $sql);

	if(!$ejec)
	{
		echo "Ocurrio un error, vuelva a intentarlo";
	}
?>

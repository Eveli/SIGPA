<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$cuc=$_POST["cuc"];
	$ci=$_POST["ci"];

	$sql="delete from perfil where ci='$ci' and cuc='$cuc'";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
	{
		echo 1;
	}

	else
	{
		echo "Ocurrio un error, vuelva a intentarlo";
	}
?>

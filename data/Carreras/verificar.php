<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$d=strtoupper($_POST["d"]);

	$sql="select count(cc) ra from carrera where d='$d'";
	$ejec=pg_query($sigpa, $sql);

	$ra=pg_fetch_object($ejec);

	if($ra->ra>0)
		echo 1;
?>
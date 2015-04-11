<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	$ci=$_POST["ci"];

	$sql="select cc from coordinacion where ci='$_SESSION[ci]'";
	$ejec=pg_query($sigpa, $sql);

	$cord=pg_fetch_object($ejec);

	$sql="insert into pertenece values('$ci', '$cord->cc')";
	$ejec=pg_query($sigpa, $sql);

	if(!$ejec)
	{
		echo 1;
	}
?>

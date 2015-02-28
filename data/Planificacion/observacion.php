<?php
		// Invocacion de las conexiones
	require "../../lib/conexion.php";

	$p=$_POST["p"];
	$ci=$_POST["ci"];
	$d=$_POST["d"];

	if($d=="")
	{
		$sql="delete from observacion where p='$p' and ci='$ci'";
		$ejec=pg_query($sigpa, $sql);

		if($ejec)
			echo 1;

		exit();
	}

	$sql="insert into observacion values('$p', '$ci', '$d')";
	$ejec=pg_query($sigpa, $sql);

	if($ejec)
		echo 1;

	else
	{
		$sql="update observacion set d='$d' where p='$p' and ci='$ci'";
		$ejec=pg_query($sigpa, $sql);

		if($ejec)
			echo 1;
	}
?>
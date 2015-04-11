<?php
	session_start();

	if(empty($_SESSION["ci"]))
	{
		echo "<meta http-equiv='Refresh' content='0; url=/SIGPA/' />";
		exit();
	}

	include "../../lib/conexion.php";

	extract($_POST);

	if($mod)
	{
		$sql="update coordinacion set ci='$ci' where cc='$cc' and s='$s'";
		$ejec=pg_query($sigpa, $sql);

		$sql="update usuario set ci='$ci', pw='1234', r='1234' where ci='$ci_ant'";
		$ejec=pg_query($sigpa, $sql);

		if($ejec)
		{
			echo "Se cambio el coordinador";
			historial($sigpa, $_SESSION["ci"], "Se cambio el coordinador de la carrera $cc en la sede $s");
		}
	}

	else
	{
		$sql="insert into profesor values('$ci', '$n1', '$n2', '$a1', '$a2', '$c', '$cat', '$ded', '$s', '$ce', '$tf', '$tm')";
		$ejec=pg_query($sigpa, $sql);

		if($ejec)
		{
			$sql="insert into estudios values('$cp', '$ci')";
			$ejec=pg_query($sigpa, $sql);

			$sql="insert into pertenece values('$ci', '$cc')";
			$ejec=pg_query($sigpa, $sql);

			$sql="insert into coordinacion values('$ci', '$cc', '$s')";
			$ejec=pg_query($sigpa, $sql);

			$sql="insert into usuario values('$ci', '1234', '1234', 2)";
			$ejec=pg_query($sigpa, $sql);

			echo "Se agrego la nueva sede";
			historial($sigpa, $_SESSION["ci"], "Se agrego la carrera $cc a la sede $s con $n1 $a1 en la coordinación");
		}
	}
?>